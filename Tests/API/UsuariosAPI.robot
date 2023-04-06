*** Settings ***
Library      RequestsLibrary
Library      FakerLibrary    locale=pt_br    seed=120
Variables   Resources/ResourceUser.py
Variables   Resources/ResourceLojinhaApi.py

Test Setup    Create Session    sessao    ${BaseURI}/${basePath}

*** Test Cases ***
Cria um usuario novo
#    Cria usuario fake
        ${usuario.nome}=  FakerLibrary.Name
        ${usuario.usuario}=     FakerLibrary.User Name
        ${usuario.password}=    FakerLibrary.Password
        ${cabecalho}=    Create Dictionary    Content-Type=application/json

#   Faz a requisição
        ${corpo}=    catenate
        ...    {
        ...     "usuarioNome":  "${usuario.nome}",
        ...    "usuarioLogin": "${usuario.usuario}",
        ...    "usuarioSenha": "${usuario.password}"
        ...    }
        
        ${response}=     POST On Session    sessao    ${caminhoUsuarios}    data=${corpo}    headers=${cabecalho}
        ${status_code}=    Convert To String    ${response.status_code}
        Should Be Equal    ${status_code}    201

#   Pega Token
    ${corpo}=    catenate
        ...    {
        ...    "usuarioLogin": "${usuario.usuario}",
        ...    "usuarioSenha": "${usuario.password}"
        ...    }

    ${response}=    POST On Session    sessao    ${caminhoLogin}    data=${corpo}    headers=${cabecalho}
    ${status_code}=    Convert To String    ${response.status_code}
    ${token}=    Set Variable    ${response.json()['data']['token']}
    Should Be Equal    ${status_code}    200

#   Deleta usuario
    ${cabecalho}=    Create Dictionary    Content-Type=application/json    token=${token}
    ${response}=    DELETE On Session    sessao    ${caminhoDados}    headers=${cabecalho}
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    204