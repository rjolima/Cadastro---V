class AcessoPagina
  include Capybara::DSL

  def open
    visit "https://getnada.com/"
  end

  def cliquebotao
    click_button "Add inboxe"
  end

  def cliquegetnada
    find("option[value='getnada.com']").click
  end

  def cliquebotao2
    click_button "Add now!"
  end

  def emailcadastro
    texto_email = find(:xpath, "//*[@id='__layout']/div/div/div[2]/div/div[1]/div/div/p/span[1]/a/button").text
    email = texto_email.strip
    nome = email.split("@")[0]
    dados = { "nome" => nome, "email" => email }
    File.open("dados_email.json", "w") do |f|
      f.write(dados.to_json)
    end
  end

  def cliqueaqui
    clique_aqui = find(:xpath, "/html/body/table/tbody/tr/td/div[2]/a/@href").value
  end
end
