*** Settings ***
Documentation   Log in CRM Necto
Library         Selenium2Library
Resource        ./crm_lib.resource
Suite Setup
Test Setup   Open Crm
Suite Teardown
Test Teardown   Delete Added Lead

# Função Principal
*** Test Cases ***
Open-Login-CreateLead
        Log in Crm
        Create Lead    TesteAmendoimComChocolateMandioca    Testando    69    2019-12-25



*** Variables ***
# @{BROWSERS}          firefox   chrome
# ${URL}


*** Keywords ***

Delete Added Lead
    Select From List By Value    xPath: /html/body/div/div/div/section/div[1]/section/div[2]/div[2]/div/div[2]/select    5
    Click Element    xPath: /html/body/div/div/div/section/div[1]/section/div[2]/div[2]/div/div[1]/ul/li[5]



