*** Settings ***
Library    SeleniumLibrary    

Suite Setup    Log    I am inside Test Suite Setup    
Suite Teardown    Log    I am inside Test Suite TearDown   
Test Setup    Log    I am inside Test Case Setup   
Test Teardown    Log    I am inside Test Case TearDown 

Default Tags    Sanity Test       

*** Test Cases ***
FirstTest
    [Tags]    Smoke Test
    Log    Hello World!!!    

FirstSeleniumTest
    Open Browser    https://google.com  chrome
    Set Browser Implicit Wait    5
    Input Text    name=q    Automation step by step    
    Press Keys    name=q    ENTER
   # Click Button  name=btnK    
   Sleep    2    
    Close Browser
    Log    Test completed    
    Set Tags    Regression Test
    
SampleLoginTest
    [Tags]    Smoke Test
    [Documentation]    This is sample test
    Open Browser   ${URL}   chrome
    Set Browser Implicit Wait    5
    Maximize Browser Window
    Input Text    id=txtUsername  @{CREDENTIALS}[0]
    Input Password    id=txtPassword    &{LOGINDATA}[password]
    Click Button    id=btnLogin
    Click Element    id=welcome   
    Sleep    5          
    Click Link    link=Logout  
    Close Browser
    Log    Test Completed     
    Log    This test was executed by %{username} on %{os}
    Set Tags    Regression Test
    Remove Tags    Regression Test
    
*** Variables ***
${URL}  https://opensource-demo.orangehrmlive.com/  
@{CREDENTIALS}  Admin  admin123 
&{LOGINDATA}   uaername=Admin  password=admin123 

       