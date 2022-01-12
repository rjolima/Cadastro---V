require "json"

Dado("que acesso a página de email novamente") do
  @acesso_pagina.open
end

Quando("acesso o novo email") do
  nome = @cadastro_pagina.cadastrocompleto[0]

  @acesso_pagina.cliquebotao
  find(:id, "grid-first-name").send_keys [:control, "a"]
  find(:id, "grid-first-name").set nome
  @acesso_pagina.cliquegetnada
  @acesso_pagina.cliquebotao2
end

Então("o link do email deve ser apresentado para acesso") do

  find(:xpath, "/html/body/div[1]/div/div/div/div[2]/div/div[1]/div/div/div[1]/div[2]/table/tbody/tr/td[1]/a").click
  page.save_screenshot("logs/screenshot_01.png")

  within_frame("the_message_iframe") do
    href = find(:xpath, "/html/body/table/tbody/tr/td/div[2]/a")["href"]
    print href
    Cadastro_href = { "href" => href }
    File.open("dados_href.json", "w") do |f|
      f.write(Cadastro_href.to_json)
      #find(:link, "Clique aqui").click

    end
  end
end

Então("acesso o cadastro do usuário") do
end
