*** Settings ***
Library     Browser
Library     XML

*** Variables ***
${url}                  http://165.227.93.41/lojinha-web/v2
${cabecalhoLogin}       .input-field.col.s12 h4
${campoUsuario}         id=usuario
${labelUsuario}         text=Usuário
${campoSenha}           id=senha
${labelSenha}           text=Senha
${botaoEntrar}          text=ENTRAR
${toastErroLogin}       .toast

*** Keywords ***
Acessa página
    New Browser    headless=False
    New Page    ${url}
    Get Text    ${cabecalhoLogin}    contains    Acessar a Lojinha
    Take Screenshot

Preenche usuario "${usuario}"
    Click    ${labelUsuario}
    Type Text    ${campoUsuario}    ${usuario}
    Take Screenshot

Preenche senha "${senha}"
    Click    ${labelSenha}
    Type Text    ${campoSenha}    ${senha}
    Take Screenshot

Aperta botao ENTRAR
    Click    ${botaoEntrar}

Verifica mensagem de erro de Login "${mensagemDeErro}"
    Get Text    ${toastErroLogin}    contains    ${mensagemDeErro}
    Take Screenshot

Login com usuario admin
    Acessa página
    Preenche usuario "admin"
    Preenche senha "admin"
    Aperta botao ENTRAR
