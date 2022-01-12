require "json"

Dado("que acesso a página de email") do
  @acesso_pagina.open
  #@AcessoPagina.open
end

Quando("adiciono o novo email") do
 
  @acesso_pagina.cliquebotao
  @acesso_pagina.cliquegetnada
  @acesso_pagina.cliquebotao2
  @acesso_pagina.emailcadastro

end

Então("um novo email é criado") do
  alert = find(".bg-gray-200")
  expect(alert).to have_content "Disposable Temporary Email"
end
