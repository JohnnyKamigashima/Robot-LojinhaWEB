*** Settings ***
Resource        Resources/ResourceLojinhaLogin.robot
Resource        Resources/ResourceLojinhaProdutos.robot

Test Setup      Acessa página

*** Test Cases ***
CT01 - Login correto na lojinha com usuário e senhas válidos
    Preenche usuario "admin"
    Preenche senha "admin"
    Aperta botao ENTRAR
    Verifica se esta logado com o texto "Boas vindas, admin!""

CT02 - Login incorreto na lojinha com usuário incorreto
    Preenche usuario "Joao Invalido"
    Preenche senha "senha"
    Aperta botao ENTRAR
    Verifica mensagem de erro de Login "Falha ao fazer o login"

CT03 - Login incorreto na lojinha com senha incorreta
    Preenche usuario "admin"
    Preenche senha "senha"
    Aperta botao ENTRAR
    Verifica mensagem de erro de Login "Falha ao fazer o login"
