require "json"

Dado("que acesso a página de cadastro de senha") do
  file = File.read("dados_href.json")
  dados = JSON.parse(file)
  visit dados["href"]
  sleep 10
  
  fill_in(:xpath, '//*[@id="newPassword"]', with: "010101")
  fill_in(:xpath, '//*[@id="confirmPassword"]', with: "010101")
  fill_in(:xpath, '//*[@id="securityQuestion"]', with: "Qual o seu número favorito?")
  fill_in(:xpath, '//*[@id="securityQueAns"]', with: "19")
  sleep 15
  click_button " Salvar e Finalizar"
end

Quando("informo a nova senha") do
end

Então("salvo a nova senha de acesso") do
end
