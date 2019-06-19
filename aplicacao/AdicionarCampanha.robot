*** Settings ***
Documentation   Log in App monitora
Resource        monitora.resource
Suite Setup  Open Monitora
Suite Teardown  Close Browser


*** Test Cases ***

Login
        Login Monitora

Acesso
        Acesso Monitora

Aderir Nova UC
        Acesso UC List
        Aderir Nova UC
        Acesso UC List

Adicionar Ciclo Teste
        Adicionar Ciclo

Adicionar Campanha Teste
        Adicionar Campanha

Deletar Campanha Teste
        Deletar Campanha

Deletar Ciclo Teste
        Acesso UC List
        Acesso UC
        Deletar Ciclo

Deletar UC
        Acesso UC List
        Deletar UC Teste



*** Variables ***


*** Keywords ***
Acesso UC List
    Click Element  xPath://*[@id="navbarSupportedContent"]/ul/li[2]/a
    Wait Until Page Contains  Unidades de Conservação do Programa Monitora

Aderir Nova UC
    Click Element  xPath:/html/body/div[1]/article/section/div/div/div/div[1]/div/a
    Wait Until Page Contains  Unidade de Conservação do Programa Monitora
    Set Selenium Implicit Wait  5 seconds
    Click Element  class:select2-selection
    Set Selenium Implicit Wait  5 seconds
    Input Text  xPath:/html/body/span/span/span[1]/input  ${UC}
    Wait Until Page Contains  ${UC}
    Click Element  xPath://*[@id="select2-id_uc-results"]/li[1]
    Input Text  xPath://*[@id="id-form"]/div/div[2]/div[2]/div[2]/span/span[1]/span/ul/li/input  ${PROTOCOLO}
    Wait Until Page Contains  ${PROTOCOLO}
    Click Element  //*[@id="select2-id_protocolos-results"]/li[1]
    Select From List By Label  name:situacao  ${SITUACAO}
    Click Button  xPath://*[@id="id-form"]/div/div[3]/div/button[2]
    Wait Until Page Contains  Dados salvos com sucesso!

Adicionar Ciclo
    Click Element   xPath:/html/body/div[1]/article/section/div/div/div/div[2]/div/table/tbody/tr[2]/td[1]/a
    Click Element   xPath:/html/body/div[1]/article/section/div[3]/div/div/div[1]/a
    Input Text     name:identificador   ${IDENT_CICLO}
    Click Element  name:protocolo
    Wait Until Page Contains  ${PROTOCOLO}
    Click Element   xPath://*[@id="id_protocolo"]/option[2]
    Input Text    name:data_ini     ${DATA_INI}
    Input Text    name:data_fim     ${DATA_FIM}
    Click Button    xPath://*[@id="id-form"]/div/div[3]/div/button[2]
    Wait Until Page Contains    Dados salvos com sucesso!

Acesso UC
    Click Element   xPath:/html/body/div[1]/article/section/div/div/div/div[2]/div/table/tbody/tr[2]/td[1]/a
    Wait Until Page Contains    Ciclos

Deletar Ciclo
    Click Button    xPath:/html/body/div[1]/article/section/div[3]/div/div/div[2]/div/table/tbody/tr/td[8]/button
    Wait Until Page Contains    Deseja deletar este item?
    Click Element   id:delete-button
    Wait Until Page Contains    Deletado com sucesso

Deletar UC Teste
    Click Button  xPath:/html/body/div[1]/article/section/div/div/div/div[2]/div/table/tbody/tr[2]/td[9]/button
    Wait Until Page Contains  Deseja deletar este item?
    Click Element  id:delete-button
    Wait Until Page Contains  Deletado com sucesso

Adicionar Campanha
    Click Element   xPath:/html/body/div[1]/article/section/div[3]/div/div/div[2]/div/table/tbody/tr/td[5]/a[2]
    Input Text      name:identificador      ${IDENT_CAMP}
    Input Text      name:data_ini           ${DATA_INI}
    Input Text      name:data_fim           ${DATA_FIM}
    Click Button    xPath://*[@id="id-form"]/div/div[3]/div/button[2]
    Wait Until Page Contains    Dados salvos com sucesso!

Deletar Campanha
    Click Element   xPath:/html/body/div[1]/article/section/div[3]/div/div/div[2]/div/table/tbody/tr/td[5]/a[1]
    Wait Until Page Contains    ${IDENT_CAMP}
    Click Button    xPath:/html/body/div[1]/article/section/div/div/div/div[2]/div[2]/table/tbody/tr[2]/td[10]/button
    Wait Until Page Contains    Deseja deletar este item?
    Click Element   id:delete-button
    Wait Until Page Contains    Deletado com sucesso