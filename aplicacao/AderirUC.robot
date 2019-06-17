*** Settings ***
Documentation   Log in App monitora
Library         SeleniumLibrary

Suite Setup  Open Login Acesso Monitora   699.743.491-68   qaz123
Suite Teardown  Deletar UC Teste
Test Setup
Test Teardown

# Função Principal
*** Test Cases ***

Aderir Nova UC
        Acesso UC List
        Aderir Nova UC    Floresta Nacional Tefé  Plantas - Mata Atlântica e Amazônia    Implementação
        Acesso UC List


*** Variables ***
# @{BROWSERS}          firefox   chrome
# ${URL}


*** Keywords ***

Open Login Acesso Monitora
    [Arguments]    ${cpf}    ${password}
    Open Browser    http://dev.monitora.sisicmbio.icmbio.gov.br/  chrome
    Wait Until Page Contains   Login
    Input Text  id:nuLogin   ${cpf}
    Input Text  id:senha   ${password}
    Click Button  class:btn-primary
    Wait Until Page Contains  Bem-vindo aos Sistemas
    Click Button  xPath:/html/body/div[2]/div[2]/div/div[2]/div[6]/div/button
    Wait Until Page Contains  Unidade Organizacional
    Set Selenium Implicit Wait  5 seconds
    Select From List By Label  id:usersList  COTEC - Coordenação de Tecnologia da Informação
    Select From List By Label  id:feijoadaProfile  Gestor
    Click Button  id:btn-access
    Wait Until Page Contains  Autenticação Realizada com sucesso

Acesso UC List
    Click Element  xPath://*[@id="navbarSupportedContent"]/ul/li[2]/a
    Wait Until Page Contains  Unidades de Conservação do Programa Monitora

Aderir Nova UC
    [Arguments]    ${uc}    ${protocolo}    ${situacao}
    Click Element  xPath:/html/body/div[1]/article/section/div/div/div/div[1]/div/a
    Wait Until Page Contains  Unidade de Conservação do Programa Monitora
    Set Selenium Implicit Wait  5 seconds
    Click Element  class:select2-selection
    Set Selenium Implicit Wait  5 seconds
    Input Text  xPath:/html/body/span/span/span[1]/input  ${uc}
    Wait Until Page Contains  ${uc}
    Click Element  //*[@id="select2-id_uc-results"]/li[1]
    Input Text  //*[@id="id-form"]/div/div[2]/div[2]/div[2]/span/span[1]/span/ul/li/input  ${protocolo}
    Wait Until Page Contains  ${protocolo}
    Click Element  //*[@id="select2-id_protocolos-results"]/li[1]
    Select From List By Label  name:situacao  ${situacao}
    Click Button  //*[@id="id-form"]/div/div[3]/div/button[2]
    Wait Until Page Contains  Dados salvos com sucesso!

Deletar UC Teste
    Click Button  xPath:/html/body/div[1]/article/section/div/div/div/div[2]/div/table/tbody/tr[2]/td[9]/button
    Wait Until Page Contains  Deseja deletar este item?
    Click Element  id:delete-button
    Wait Until Page Contains  Deletado com sucesso
    Close Browser