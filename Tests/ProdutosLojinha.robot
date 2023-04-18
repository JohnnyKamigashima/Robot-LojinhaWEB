*** Settings ***
Resource        ../Resources/ResourceLojinhaAdicaoDeProdutos.robot
Resource        ../Resources/ResourceLojinhaProdutos.robot
Resource        ../Resources/ResourceLojinhaLogin.robot

Test Setup      Login com usuario admin

*** Test Cases ***
CT01 - Cadastro de Produto com informações válidas
    Selecionar Adicionar Produto
    Preenche nome do produto "Playstation 2023"
    Preenche valor do produto "900,00"
    Preenche cores do produto "Branco, Preto, Azul"
    Pressiona botao Salvar
    Verifica mensagem toast "Produto adicionado com sucesso"

CT02 - Cadastro de Produto com valor 0
    Selecionar Adicionar Produto
    Preenche nome do produto "Playstation 2023"
    Preenche valor do produto "0,00"
    Preenche cores do produto "Branco, Preto, Azul"
    Pressiona botao Salvar
    Verifica mensagem toast "O valor do produto deve estar entre R$ 0,01 e R$ 7.000,00"

CT03 - Cadastro de Produto com valor 7001
    Selecionar Adicionar Produto
    Preenche nome do produto "Playstation 2023"
    Preenche valor do produto "7001,00"
    Preenche cores do produto "Branco, Preto, Azul"
    Pressiona botao Salvar
    Verifica mensagem toast "O valor do produto deve estar entre R$ 0,01 e R$ 7.000,00"
