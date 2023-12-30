*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${Base URL}    https://reqres.in

# ------------------- Endpoint --------------------------
${Create User}    /api/users 
${Register User}    /api/register