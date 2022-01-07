require "json"

class CadastroPagina
  include Capybara::DSL

  def openvivo
    #CloucCO
    visit "https://www.vivoplataformadigital.com.br"
  end

  def cadastro
    find(:xpath, "//*[@id='block-tb-megamenu-menu-login']/div/div/div/ul/li[2]").click
  end

  def cadastrocompleto
    file = File.read("dados_email.json")
    dados = JSON.parse(file)
    nome = dados["nome"]
    email = dados["email"]
    cnpj = Faker::CNPJ.numeric

    return [nome, email, cnpj]
  end

  def cadastrocompleto_1(nome, email, cnpj)
    cadastro = { "nome" => nome, "email" => email, "cnpj" => cnpj }

    File.open("dados_cadastro.json", "a+") do |f|
      f.write(cadastro.to_json)
    end
  end
end
