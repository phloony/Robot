***setting***
Documentation   Isto é um exemplo de documentação do código
Library         Selenium2Library

# Função Principal
***Test case***
Open Google
        Open Google

*** Variables ***
#
${BROWSER}              firefox
${URL}           https://www.google.com/

***Keyword***
Open Google
        Open Browser    ${URL}    ${BROWSER}