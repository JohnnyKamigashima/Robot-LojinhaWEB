import requests

class User(object):
        def __init__(self, nome, usuario, password):
            self.nome = nome
            self.usuario = usuario
            self.password = password

def makeUser(nome, usuario, password):
        return User(nome, usuario, password)

def makeDefaultUser():
    nomeDefault = 'Administrador'
    usuarioDefault = 'admin'
    senhaDefault = 'admin'
    return User(nomeDefault,usuarioDefault, senhaDefault)

def makeRandomUser():
        return User(
        requests.get("https://my.api.mockaroo.com/lojinha_api.json?key=b555ee80").json()['usuarioNome'],
        requests.get("https://my.api.mockaroo.com/lojinha_api.json?key=b555ee80").json()['usuarioLogin'], 
        requests.get("https://my.api.mockaroo.com/lojinha_api.json?key=b555ee80").json()['usuarioSenha'])
