*** Settings ***
Library     Browser

*** Variables ***
${campoNomeDoProduto}       id=produtonome
${campoValorDoProduto}      id=produtovalor
${campoCoresDoProduto}      id=produtocores
${botaoSalvar}              button.btn
${botaoListaDeProdutos}     text=Lista de Produtos

*** Keywords ***
Preenche nome do produto "${nomeDoProduto}"
    Type Text    ${campoNomeDoProduto}    ${nomeDoProduto}
    Take Screenshot

Preenche valor do produto "${valorDoProduto}"
    Type Text    ${campoValorDoProduto}    ${valorDoProduto}
    Take Screenshot

Preenche cores do produto "${coresDoProduto}"
    Type Text    ${campoCoresDoProduto}    ${coresDoProduto}
    Take Screenshot

Pressiona botao Salvar
    Click    ${botaoSalvar}

Pressiona botao Lista de Produtos
    Click    ${botaoListaDeProdutos}
