#language: pt

@cadastro
Funcionalidade: cadastro
    Sendo um novo cliente da vivo
    Quero fazer meu cadastro
    Para que possa acessar minha conta

Cenario: Fazer cadastro

    Dado que acesso a página de cadastro
    Quando submeto meu cadastro completo
    Então devo ser cadastrado e email de confirmação deve chegar
    
