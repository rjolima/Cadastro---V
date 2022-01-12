require "json"

class CadastroPagina
  include Capybara::DSL

  def openvivo
    # STG CLOUD CO
    # visit "https://cloudcostg.vivoplataformadigital.com.br/cms/pt#"

    # STG TBRA
    # visit "https://rsl-stg.vivoplataformadigital.com.br/cms/pt"

    # esteira 2 UAT Cloud CO
    # visit "https://cloudco-uat-admin.vivoplataformadigital.com.br/cms/pt"

    # Esteira 1 Billing #Tbras
    #visit "https://rsl-uat-billing.vivoplataformadigital.com.br/cms/pt"

    #CloucCO
    visit "https://cloudco-uat-billing.vivoplataformadigital.com.br"
  end

  def cadastro
    # STG CLOUD CO # STG TBRA
    #find(:id, "block-tb-megamenu-menu-login").click

    # esteira 2 UAT Cloud CO - Esteira 1 CloudCO / Tbra
    find(:xpath, "//*[@id='block-tb-megamenu-menu-login']/div/div/div/ul/li[3]").click
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
