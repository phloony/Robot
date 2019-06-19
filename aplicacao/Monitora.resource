*** Settings ***
Library     SeleniumLibrary



*** Variables ***
${cpf}      699.743.491-68
${senha}        qaz123
${uc}       Floresta Nacional Tefé
${protocolo}        Plantas - Mata Atlântica e Amazônia
${situacao}        Implementação
${sucesso}          Dados salvos com sucesso!
${nome}         Teste
${confirmacao}         Deseja deletar este item?
${sucesso_del}         Deletado com sucesso


*** Keywords ***

Open Monitora
    Open Browser    http://dev.monitora.sisicmbio.icmbio.gov.br/  chrome
    Wait Until Page Contains   Login

Login Monitora
    Input Text  id:nuLogin   ${cpf}
    Input Text  id:senha   ${senha}
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
