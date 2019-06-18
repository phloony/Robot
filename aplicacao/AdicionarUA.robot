*** Settings ***
Documentation   Log in App monitora
Resource        Monitora.robot
Suite Setup  Open Monitora
Suite Teardown  Close Browser


*** Test Cases ***

Login
        Login Monitora   699.743.491-68   qaz123

Acesso
        Acesso Monitora

Aderir Nova UC
        Acesso UC List
        Aderir Nova UC    Floresta Nacional Tefé  Plantas - Mata Atlântica e Amazônia    Implementação
        Acesso UC List

Acesso UC Teste
        Acesso UC Teste

Adicionar EA Teste
        Adicionar Nova EA

Adicionar UA Teste
        Adicionar Nova UA

Deletar UA Teste
        Deletar Nova UA

Deletar EA Teste
        Deletar Nova EA

Acessar UC List
        Acesso UC List

Deletar UC Teste
        Deletar UC Teste


*** Variables ***
# @{BROWSERS}          firefox   chrome
# ${URL}


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
    Wait Until Page Contains  Dados salvos com sucesso!

Acesso UC Teste
    Click Element  xPath:/html/body/div[1]/article/section/div/div/div/div[2]/div/table/tbody/tr[2]/td[1]/a
    Wait Until Page Contains  (Painel de Gestão)

Adicionar Nova EA
    Click Element  xPath:/html/body/div[1]/article/section/div[2]/div[2]/div/div[1]/a
    Wait Until Page Contains  UC: Floresta Nacional Tefé (Estação Amostral)
    Input Text  name:nome  Teste
    Click Button  xPath://*[@id="id-form"]/div/div[2]/div[2]/div/button[2]
    Wait Until Page Contains  Dados salvos com sucesso!

Adicionar Nova UA
    Click Element  xPath:/html/body/div[1]/article/section/div[2]/div[2]/div/div[2]/div/table/tbody/tr/td[2]/a[2]
    Input Text  name:nome  UA Teste
    Click Element  //*[@id="id-form"]/div/div[2]/div/div[1]/div[4]/div/span/span[1]/span/ul
    Set Selenium Implicit Wait  5 seconds
    Wait Until Page Contains  Plantas - Mata Atlântica e Amazônia
    Click Element  xPath://*[@id="select2-id_protocolos-results"]/li
    Click Button  //*[@id="id-form"]/div/div[3]/div/button[2]
    Wait Until Page Contains  Dados salvos com sucesso!

Deletar Nova UA
    Click Element  xPath:/html/body/div[1]/article/section/div[2]/div[2]/div/div[2]/div/table/tbody/tr/td[2]/a[1]
    Wait Until Page Contains  UC: Floresta Nacional Tefé / Unidades Amostrais
    Click Button  xPath:/html/body/div[1]/article/section/div/div/div/div[2]/div/table/tbody/tr[2]/td[4]/button
    Wait Until Page Contains  Deseja deletar este item?
    Click Element  id:delete-button
    Wait Until Page Contains  Deletado com sucesso
    Click Element  xPath:/html/body/div[1]/header/h3/a
    Wait Until Page Contains  Floresta Nacional Tefé

Deletar Nova EA
    Click Button  xPath:/html/body/div[1]/article/section/div[2]/div[2]/div/div[2]/div/table/tbody/tr/td[3]/button
    Wait Until Page Contains  Deseja deletar este item?
    Set Selenium Implicit Wait  5 seconds
    Click Element  id:delete-button
    Wait Until Page Contains  Deletado com sucesso


Deletar UC Teste
    Click Button  xPath:/html/body/div[1]/article/section/div/div/div/div[2]/div/table/tbody/tr[2]/td[9]/button
    Wait Until Page Contains  Deseja deletar este item?
    Click Element  id:delete-button
    Wait Until Page Contains  Deletado com sucesso
