*** Settings ***
Documentation    (s396426 Amrit Niure) Automated Test for Login and Registration Functionality 
Library          SeleniumLibrary

Resource         LoginRegistrationTest.robot
Suite Setup      Go to Website
Suite Teardown   Close Browser

*** Test Cases ***
Test Staff Registration
    [Documentation]    Test new user registration with valid data
    Go To Staff Signup Page
    Register New User
    Verify Registration Success

Test Staff Login
    [Documentation]    Test user login with registered credentials
    Go To Staff Login Page
    Login With Credentials
    Verify Login Success

# Empty Field Tests
Test Registration With Empty Username
    [Documentation]    Test registration with empty username field
    Go To Staff Signup Page
    Register User With Empty Field    username
    Verify Registration Fails

Test Registration With Empty Email
    [Documentation]    Test registration with empty email field
    Go To Staff Signup Page
    Register User With Empty Field    email
    Verify Registration Fails

Test Registration With Empty Password
    [Documentation]    Test registration with empty password field
    Go To Staff Signup Page
    Register User With Empty Field    password
    Verify Registration Fails

Test Login With Empty Username
    [Documentation]    Test login with empty username field
    Go To Staff Login Page
    Login With Empty Field    username
    Verify Login Fails

Test Login With Empty Password
    [Documentation]    Test login with empty password field
    Go To Staff Login Page
    Login With Empty Field    password
    Verify Login Fails

Test Login With Both Fields Empty
    [Documentation]    Test login with both username and password empty
    Go To Staff Login Page
    Login With Empty Field    both
    Verify Login Fails

# Special Characters Tests
Test Registration With Special Characters In Username
    [Documentation]    Test registration with special characters in username
    Go To Staff Signup Page
    Register User With Special Chars    username    user@#$%
    Verify Registration Behavior

Test Registration With Special Characters In Email
    [Documentation]    Test registration with invalid email containing special characters
    Go To Staff Signup Page
    Register User With Special Chars    email    invalid@@email..com
    Verify Registration Fails

Test Registration With SQL Injection Attempt
    [Documentation]    Test registration security against SQL injection
    Go To Staff Signup Page
    Register User With Special Chars    username    admin' OR '1'='1
    Verify Registration Behavior

Test Login With Special Characters
    [Documentation]    Test login with special characters in credentials
    Go To Staff Login Page
    Login With Special Chars    user@#$%    pass@#$%
    Verify Login Fails

# Edge Case Tests
Test Registration With Very Long Username
    [Documentation]    Test registration with username exceeding normal length
    Go To Staff Signup Page
    Register User With Long Input    username    abcdefghijklmnopqrstuvwxyz1234567890abcdefghijklmnopqrstuvwxyz
    Verify Registration Behavior

Test Registration With Very Long Email
    [Documentation]    Test registration with very long email address
    Go To Staff Signup Page
    Register User With Long Input    email    verylongemailaddress1234567890@verylongdomainnameexample.com
    Verify Registration Behavior

Test Registration With Single Character Fields
    [Documentation]    Test registration with minimum length inputs
    Go To Staff Signup Page
    Register User With Short Input    a    a    a    a@a.a    123    a
    Verify Registration Behavior

Test Registration With Invalid Email Format
    [Documentation]    Test registration with invalid email formats
    Go To Staff Signup Page
    Register User With Invalid Email    invalidemail
    Verify Registration Fails

Test Registration With Invalid Phone Number
    [Documentation]    Test registration with non-numeric phone number
    Go To Staff Signup Page
    Register User With Invalid Phone    abcdefghij
    Verify Registration Behavior

Test Login With Wrong Password
    [Documentation]    Test login with incorrect password
    Go To Staff Login Page
    Login With Wrong Credentials    ${USERNAME}    wrongpassword123
    Verify Login Fails

Test Login With Non-Existent User
    [Documentation]    Test login with non-existent username
    Go To Staff Login Page
    Login With Wrong Credentials    nonexistentuser999    somepassword
    Verify Login Fails

# Duplicate Tests
Test Registration With Duplicate Username
    [Documentation]    Test registration with already registered username
    Go To Staff Signup Page
    Register Duplicate User    username
    Verify Duplicate Registration Fails

Test Registration With Duplicate Email
    [Documentation]    Test registration with already registered email
    Go To Staff Signup Page
    Register Duplicate User    email
    Verify Duplicate Registration Fails

# Additional Edge Cases
Test Registration With Whitespace In Fields
    [Documentation]    Test registration with leading/trailing whitespaces
    Go To Staff Signup Page
    Register User With Whitespace    ${SPACE}${SPACE}testuser${SPACE}${SPACE}    ${SPACE}${SPACE}test@email.com${SPACE}${SPACE}
    Verify Registration Behavior

Test Password With Only Spaces
    [Documentation]    Test registration with password containing only spaces
    Go To Staff Signup Page
    Register User With Space Password
    Verify Registration Fails

Test Case Sensitivity In Login
    [Documentation]    Test login username case sensitivity
    Go To Staff Login Page
    Login With Different Case    UNIQUETESTUSER    ${PASSWORD}
    Verify Login Behavior