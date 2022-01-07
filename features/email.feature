#language: pt

@email
Funcionalidade: cadastro de email
    Sendo um novo cliente da vivo
    Quero fazer meu cadastro de um novo email
    Para que possa realizar meu cadastro

Cenario: Fazer cadastro

    Dado que acesso a página de email
    Quando adiciono o novo email
    Então um novo email é criado
     
    