*** Settings ***
Documentation   Log in App monitora
Library         SeleniumLibrary



*** Variables ***
${URL}          http://dev.monitora.sisicmbio.icmbio.gov.br/
${BROWSER}      chrome
${CPF}          699.743.491-68
${PASSWORD}     qaz123
${PROTOCOLO}    Plantas - Mata Atlântica e Amazônia
${UC}           Floresta Nacional Tefé
${SITUACAO}     Implementação
${IDENT_CICLO}  Teste
${DATA_INI}     01/01/2011
${DATA_FIM}     01/01/2020
${IDENT_CAMP}   Teste Campanha


*** Keywords ***

Open Monitora
    Open Browser      ${URL}    ${BROWSER}
    Wait Until Page Contains    Login

Login Monitora
    Input Text  id:nuLogin   ${CPF}
    Input Text  id:senha   ${PASSWORD}
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
