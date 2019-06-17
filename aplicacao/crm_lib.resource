*** Settings ***
Documentation   Isto é um exemplo de documentação do código
Library         Selenium2Library


# Função Principal
# ***Test case***
# Open Crm
#         Open Crm


*** Variables ***


*** Keywords ***

Open Crm
    Open Browser    https://crm.teste.necto.com.br/


Log in Crm
    # [Arguments]    ${email}    ${password}
    Input Text    id:id_username    robot@admin.com
    Input Password    id:id_password    rbT12345
    Click Button    class:bg-success
    Wait Until Page Contains    Eventos
    Click Element   xPath:/html/body/div/div/div/aside/div/nav/ul/li[1]/a
    Wait Until Page Contains     Adicionar
    Click Button    class:btn-secondary


Create Lead
    [Arguments]    ${titulo}    ${descricao}    ${valor}    ${data_prevista}
    Input Text    id:id_titulo   ${titulo}
    Click Element    xPath:/html/body/div/div/div/section/section/div[2]/form/div[4]/div[1]/div/select/option[2]
    Click Element    xPath:/html/body/div/div/div/section/section/div[2]/form/div[4]/div[2]/div/select/option[3]
    Input Text    id:id_descricao    ${descricao}
    Input Text    id:id_valor    ${valor}
    Input Text    id:id_data_prevista    ${data_prevista}
    Click Button    xPath:/html/body/div/div/div/section/section/div[2]/form/div[7]/button
