*** Settings ***
Documentation   Log in App monitora
Library         SeleniumLibrary

Suite Setup
Test Setup
Suite Teardown
Test Teardown

# Função Principal
*** Test Cases ***
Open Login Acesso Monitora
        Open Monitora
        Login Monitora   699.743.491-68   qaz123
        Acesso Monitora


*** Variables ***
# @{BROWSERS}          firefox   chrome
# ${URL}


*** Keywords ***

Open Monitora
    Open Browser    http://dev.monitora.sisicmbio.icmbio.gov.br/  chrome
    Wait Until Page Contains   Login

Login Monitora
    [Arguments]    ${cpf}    ${password}
    Input Text  id:nuLogin   ${cpf}
    Input Text  id:senha   ${password}
    Click Button  class:btn-primary
    Wait Until Page Contains  Bem-vindo aos Sistemas

Acesso Monitora
    Click Button  xPath:/html/body/div[2]/div[2]/div/div[2]/div[6]/div/button
    Wait Until Page Contains  Unidade Organizacional
    Set Selenium Implicit Wait  5 seconds
    Select From List By Label  id:usersList  COTEC - Coordenação de Tecnologia da Informação
    Select From List By Label  id:feijoadaProfile  Gestor
    Click Button  id:btn-access
    Wait Until Page Contains  Autenticação Realizada com sucesso

Acesso UC List
    Click Element  xPath://*[@id="navbarSupportedContent"]/ul/li[2]/a
