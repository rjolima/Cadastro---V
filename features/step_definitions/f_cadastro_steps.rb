require "json"

Dado("que acesso a página de cadastro") do
  @cadastro_pagina.openvivo
  @cadastro_pagina.cadastro
end

Quando("submeto meu cadastro completo") do
  nome = @cadastro_pagina.cadastrocompleto[0]
  email = @cadastro_pagina.cadastrocompleto[01]
  cnpj = @cadastro_pagina.cadastrocompleto[2]

  find("#cpfNumber").set Faker::CPF.numeric
  find("#firstName").set nome
  find("#lastName").set Faker::Internet.username(specifier: "MultaContrat")
  find("#email").set email
  find("#contactPhone").set Faker::PhoneNumber.cell_phone
  find("#cnpjNumber").set cnpj
  find(:id, "companyName").set Faker::JapaneseMedia::DragonBall.character
  find(:id, "companyName").send_keys [:space, []]
  find(:id, "companyName").send_keys Faker::Internet.username(specifier: "MultaContrat")
  find(:id, "mailingAddress1").set Faker::Address.street_name
  find(:id, "mailingAddress2").set Faker::Number.decimal_part(digits: 2)
  find(:id, "mailingaddress4").set Faker::Internet.username(specifier: "Sion")
  find(:id, "mailingPhone").set Faker::PhoneNumber.cell_phone
  find(:id, "mailingState").find("option", text: "Minas Gerais").select_option
  find(:id, "mailingCity").set Faker::Internet.username(specifier: "BH")
  find(:id, "mailingZip").set Faker::Internet.username(specifier: "30810-500")
  find("#billingCheck").click
  find(:id, "timeZone").find("option", text: "(GMT-03:00) Brasilia").select_option
  sleep 20 # para resolver o captcha - como não é possível remover ele nesse acesso.
  find(:id, "i_agree").click
  click_button "Cadastrar"

  @cadastro_pagina.cadastrocompleto_1(nome, email, cnpj)
end

Então("devo ser cadastrado e email de confirmação deve chegar") do
  alert = find(".RegisterSuccessText")
  expect(alert.text).to eql "Obrigado por se cadastrar!"
end
