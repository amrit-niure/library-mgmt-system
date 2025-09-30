*** Settings ***
Documentation    Simple test suite for Django Library Management System signup and login only
Library          SeleniumLibrary

Resource         LoginRegistrationTest.robot
Suite Setup      Go to Website
Suite Teardown   Close Browser

*** Test Cases ***
Test Staff Registration
    [Documentation]    Test new user registration
    Go To Staff Signup Page
    Register New User
    Verify Registration Success

Test Staff Login
    [Documentation]    Test user login with registered credentials
    Go To Staff Login Page
    Login With Credentials
    Verify Login Success