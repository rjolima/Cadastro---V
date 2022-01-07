Before do
  @cadastro_pagina = CadastroPagina.new
  @acesso_pagina = AcessoPagina.new

  #@acesso_pagina = AcessoPagina.new
  #page.driver.browser.manage.window.maximize (cuidado com esse resolução, pois em outros lugares pode não ser adequada)
  page.current_window.resize_to(1920, 1080)
end

After do
  temp_shot = page.save_screenshot("logs/temp_screenshot.png")
  #     temp_shot = page.save_screenshot("screenshots/#{scenario.name}#{Time.now.to_s.gsub(':', '')}_screenshot.png")
  # Allure.add_attachment(name: scenario.name, source: File.open(temp_shot, 'rb'), type: Allure::ContentType::PNG)
end
