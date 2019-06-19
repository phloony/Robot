*** Settings ***
Documentation   Aderir Unidade de Conservação
Resource        Monitora.resource
Suite Setup  Open Monitora
Suite Teardown  Close Browser



*** Test Cases ***

Login
        Login Monitora

Acesso
        Acesso Monitora

Aderir Nova UC
        Acesso UC List
        Aderir Nova UC    ${uc}   ${protocolo}   ${situacao}
        Acesso UC List

Deletar UC Teste
        Deletar UC Teste


*** Variables ***


*** Keywords ***
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
    Wait Until Page Contains  ${sucesso}

Deletar UC Teste
    Click Button  xPath:/html/body/div[1]/article/section/div/div/div/div[2]/div/table/tbody/tr[2]/td[9]/button
    Wait Until Page Contains  ${confirmacao}
    Click Element  id:delete-button
    Wait Until Page Contains  ${sucesso_del}