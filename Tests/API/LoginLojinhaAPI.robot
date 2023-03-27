*** Settings ***
Library         RequestsLibrary
Library         FakerLibrary    locale=pt_br    seed=121
Variables       Resources/ResourceLojinhaApi.py
Library       Resources/ResourceUser.py

Test Setup      Create Session    sessao    ${BaseURI}/${basePath}

*** Test Cases ***
Verifica se o Login válido seja bem sucedido
    ${usuario}=  Make Default User

    ${cabecalho}=    Create Dictionary    Content-Type=application/json
    ${corpo}=    catenate
    ...    {
    ...    "usuarioLogin": "${usuario.usuario}",
    ...    "usuarioSenha": "${usuario.password}"
    ...    }

    ${response}=    POST On Session    sessao    ${caminhoLogin}    data=${corpo}    headers=${cabecalho}
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200

    ${token}=    Set Variable    ${response.json()['data']['token']}

Testa Pojo
    ## Mockaroo Fake
    ${usr}=    Make Random User
    Log To Console    \n ${usr.nome} ${usr.usuario} ${usr.password}

    ## FakerLibrary
    ${fakeNome}=    FakerLibrary.Name
    ${fakeUsuario}=    FakerLibrary.User Name
    ${fakePassword}=    FakerLibrary.Password
    Log To Console    \n ${fakeNome} ${fakeUsuario} ${fakePassword}
