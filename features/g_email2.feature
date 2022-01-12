#language: pt

@email2
Funcionalidade: Acessando email já cadastrado
    Sendo que já tenho cadastro na vivo
    Quero acessar meu email para finalizar o cadastro
    Para que possa acessar minha conta

Cenario: Fazer cadastro

    Dado que acesso a página de email novamente
    Quando acesso o novo email
    Então o link do email deve ser apresentado para acesso
    E acesso o cadastro do usuário