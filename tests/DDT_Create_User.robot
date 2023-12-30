*** Settings ***
Documentation    API Test Menggunakan Data Driven Testing
Resource    ../keyword/Create_User_Keyword.robot
Test Template    Create User with Data Driven Test

*** Test Cases ***                Base_URL        Endpoint                    Nama        Job                Response_Status    Response_Body
Nama Saya Budi                    ${Base URL}     ${Create User}              Budi        Staff              201                Budi
Nama Saya Aziz                    ${Base URL}     ${Create User}              Aziz        Staff              201                Aziz
Nama Saya Kurniawan               ${Base URL}     ${Create User}              Kurniawan   Kepala Bagian      201                Kurniawan