Dado (/^que ingreso a la pantalla de login e ingreso mis credenciales$/) do
  @browser = Selenium::WebDriver.for :firefox
  @browser.get "https://cas.nac.everis.int/cas/login"
  
  @usuario = @browser.find_element(:xpath, "/html/body/div/div[2]/div[2]/div/div/div/div/div[2]/div/input")
  @usuario.click
  @usuario.send_keys("fbonifac")

  @contrasenia = @browser.find_element(:xpath, "/html/body/div/div[2]/div[2]/div/div/div/div/div[3]/div/input")
  @contrasenia.click
  @contrasenia.send_keys("Boni1245")

end

Cuando (/^presiono en acceder$/) do
  @btningreso = @browser.find_element(:xpath, "/html/body/div/div[2]/div[2]/div/div/div/div/div[4]/button")
  @btningreso.click
end

Entonces (/^debo ingresar a EU$/) do
	sleep(4)
	
	if @browser.current_url.to_s != "http://eu.nac.everis.int/eu-web/"
		fail "Fallo"
	end
	sleep(6)
	@repa = @browser.find_element(:xpath, "//div[contains(., 'Seleccione')]//table//tr[contains(@class,'z-listitem') and (contains(.,'FACU') and (contains(.,'SEC01')))]") 
	@repa.click

	#Trae toda la fila
	#@repa = @browser.find_elements(:xpath, "//div[contains(., 'Seleccione')]//table//tr[contains(@class,'z-listitem') and (contains(.,'ALS'))]//td[(position()=2 or position()=3) and contains(.,'MARINAIDAS')]") #Recata las columnas 2 y 3 de la fila")
	
end










  

Dado (/^que ingreso a la pantalla de login e ingreso mis credenciales$/) do
  require_relative 'metodos'
  @nav = Metodoseu.new
  @nav.SetNavegador("https://cas.nac.everis.int/cas/login")
  @nav.AbrirPag 
  @nav.SetDatosIngreso("fbonifac","Boni1245")
  @nav.IngresoCAS 
end

Cuando (/^presiono en acceder$/) do

end

Entonces (/^debo ingresar a EU$/) do
	sleep(4)
	
	if @browser.current_url.to_s != "http://eu.nac.everis.int/eu-web/"
		fail "Fallo"
	end
	sleep(6)
	@repa = @browser.find_element(:xpath, "//div[contains(., 'Seleccione')]//table//tr[contains(@class,'z-listitem') and (contains(.,'FACU') and (contains(.,'SEC01')))]") 
	@repa.click

	#Trae toda la fila
	#@repa = @browser.find_elements(:xpath, "//div[contains(., 'Seleccione')]//table//tr[contains(@class,'z-listitem') and (contains(.,'ALS'))]//td[(position()=2 or position()=3) and contains(.,'MARINAIDAS')]") #Recata las columnas 2 y 3 de la fila")
	
end
 
  require_relative 'metodos'
  @nav = Metodoseu.new
  @nav.SetNavegador("https://cas.nac.everis.int/cas/login")
  @nav.AbrirPag 
  @nav.SetDatosIngreso("fbonifac","Boni1245")
  @nav.IngresoCAS 
	sleep(4)
	if @browser.current_url.to_s != "http://eu.nac.everis.int/eu-web/"
		fail "Fallo"
	end
	sleep(6)
	@repa = @browser.find_element(:xpath, "//div[contains(., 'Seleccione')]//table//tr[contains(@class,'z-listitem') and (contains(.,'FACU') and (contains(.,'SEC01')))]") 
	@repa.click
