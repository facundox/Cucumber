class Metodoseu

	@browser
	@Pag
	@RepaSel
	@SecSel
	

	@Usuario
	@ComponenteUsuario

	@Contrasenia
	@ComponenteContrasenia

	@btnIngreso

	@ComponenteTablaMR
	@ReparticionMR
	@SectorMR

	@respuesta

	#Inicialización obj browser que abre el navegador
	def AbrirNav
		@browser = Selenium::WebDriver.for :firefox
	end

	#Sete Url a ingresar
	def SetNavegador(uRLP)
		@Pag = uRLP
	end

	#Ingreso a la página deseada
	def AbrirPag(url)
		SetNavegador(url)
		AbrirNav()
		@browser.get @Pag.to_s
	end

	#Seteo ingreso de credenciales de CAS
	def SetDatosIngreso(usu, pass)
		@Usuario = usu
		@Contrasenia = pass
	end

	
	def ComponentesCAS
		@ComponenteUsuario = @browser.find_element(:xpath, "/html/body/div/div[2]/div[2]/div/div/div/div/div[2]/div/input")
		@ComponenteContrasenia = @browser.find_element(:xpath, "/html/body/div/div[2]/div[2]/div/div/div/div/div[3]/div/input")
		@btnIngreso = @browser.find_element(:xpath, "/html/body/div/div[2]/div[2]/div/div/div/div/div[4]/button")
	end


	#Seteo Repartición/Sector a seleccionar
	def SetDatosTRMR(codrepa, codsect)
		@RepaSel = codrepa.to_s
		@SecSel = codsect.to_s
	end

	
	def IngresoCAS
		ComponentesCAS()
		
		@ComponenteUsuario.click
		@ComponenteUsuario.send_keys(@Usuario)

		@ComponenteContrasenia.click
		@ComponenteContrasenia.send_keys(@Contrasenia)

		@btnIngreso.click
	end

	#def EvaluarIngreso(pageval)
	#	if @browser.current_url.to_s != pageval.to_s
	#		respuesta = false
	#	end
	#	else
	#		respuesta = true
	#	end
	#end

	def DatosRepaSectorMR(reparticion, sector)
		@ReparticionMR = reparticion
		@SectorMR = sector
	end

	def ComponenteIngMultiEU
		@ComponenteTablaMR = @browser.find_element(:xpath, "//div[contains(., 'Seleccione')]//table//tr[contains(@class,'z-listitem') and (contains(.,'#{@ReparticionMR}') and (contains(.,'#{@SectorMR}')))]") 
	end

	def SeleccionMR
		ComponenteIngMultiEU()
		@ComponenteTablaMR.click
	end
end