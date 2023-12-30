*** Settings ***
Documentation    Register
Resource    ../keyword/Register_Keyword.robot
Test Template    Register User with Data Driven Test

*** Variables ***



*** Test Cases ***    Test_Type     Base_URL         Endpoint             Email                 Password                Response_Status    Response_Error
Akun Aziz             Positive      ${Base URL}     ${Register User}    eve.holt@reqres.in      pistol                  200                ${null}
Invalid Account       Negative      ${Base URL}     ${Register User}    aziz@gmail.com          kocak                   400                Note: Only defined users succeed registration
Missing Password      Negative      ${Base URL}     ${Register User}    abc@gmail.com           ${null}                 400                Missing password
Missing Email         Negative      ${Base URL}     ${Register User}    ${null}                 kocak                   400                Missing email or username
                