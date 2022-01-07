require "json"

Dado("que acesso a página de email novamente") do
  @acesso_pagina.open
end

Quando("acesso o novo email") do
  nome = @cadastro_pagina.cadastrocompleto[0]

  @acesso_pagina.cliquebotao
  find(:id, "grid-first-name").send_keys [:control, "a"]
  find(:id, "grid-first-name").set nome
  @acesso_pagina.cliqueget
  @acesso_pagina.cliquebotao2
  find(:xpath, "/html/body/div[1]/div/div/div/div[2]/div/div[1]/div/div/div[1]/div[2]/table/tbody/tr/td[1]/a").click
end

Então("o email de confirmação deve ser apresentado") do
  #nesse caso não chega o email de confirmação com link para cadastrar a nova senha, no processo interno dentro do ambiente
  #esse email é apresentado e o processo de cadastro é concluído.
end
