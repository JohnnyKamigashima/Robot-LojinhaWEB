*** Settings ***
Library     Browser

*** Variables ***
${MensagemBoasVindas}       id=nav-mobile
${botaoAdicionarProduto}    text=Adicionar produto
${toastErro}                .toast

*** Keywords ***
Verifica se esta logado com o texto "${TextoMensagemBoasVindas}""
    Get Text    ${MensagemBoasVindas}    contains    ${TextoMensagemBoasVindas}
    Take Screenshot

Selecionar Adicionar Produto
    Click    ${botaoAdicionarProduto}

Verifica mensagem toast "${mensagem}"
    Get Text    ${toastErro}    contains    ${mensagem}
    Take Screenshot
