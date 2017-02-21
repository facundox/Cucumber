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

	@SolapaSeleccionada
	@SubSolapaSeleccionada

	#Componentes Alta Repartición
	#Clase z-textbox
	@compAltaCod
	@compAltaNom
	@compAltaTel
	@compAltaFax
	@compAltaOfi
	@compAltaMail
	@compAltaCalle
	@compAltaAltura
	@compAltaPiso
	@compAltaDpto
	@compAltaCp

	@compAltaEst
	@compAltaRepPa
	@compAltaJu
	@compAltaAdmin 

	@compAltaBusq
	#***************************
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
		AbrirNav()
		SetNavegador(url)
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
		sleep(4)
		@BotonOk = @browser.find_element(:xpath, "//div[contains(@class,'z-window-highlighted z-window-highlighted-shadow')]//td[contains(.,'') and contains(@class,'z-button-cm')]")
		@BotonOk.click
	end


def SeleccionarSolapa(solapaa)
		@SolapaSeleccionada = @browser.find_element(:xpath, "//li[contains(@class, 'z-tab') and contains(., '#{solapaa}')]")
		@SolapaSeleccionada.click
end		

def SeleccionarSubSolapa(solapa)
		@SubSolapaSeleccionada = @browser.find_element(:xpath, "//li[contains(@class, 'z-tab') and contains(., '#{solapa}')]")
		@SubSolapaSeleccionada.click
end

def SeleccionarAlta(alta)
	@ComponenteAlta = @browser.find_element(:xpath, "//div[contains(@class, 'z-toolbarbutton-cnt') and contains(., '#{alta}')]")
	@ComponenteAlta.click
end


def ComponentesAltaRepa
	elementosaltarepatext = @browser.find_elements(:xpath, "//div[contains(@class, 'z-grid')]//div[contains(@class,'z-row-cnt z-overflow-hidden')]//input[contains(@class, 'z-textbox')]")

	@compAltaCod = elementosaltarepatext[0]
	@compAltaNom = elementosaltarepatext[1]
	@compAltaTel = elementosaltarepatext[2]
	@compAltaFax = elementosaltarepatext[3]
	@compAltaOfi = elementosaltarepatext[4]
	@compAltaMail = elementosaltarepatext[5]
	@compAltaCalle = elementosaltarepatext[7]
	@compAltaAltura = elementosaltarepatext[8]
	@compAltaPiso = elementosaltarepatext[9]
	@compAltaDpto = elementosaltarepatext[10]
	@compAltaCp = elementosaltarepatext[11]

	elementosaltarepaband = @browser.find_elements(:xpath, "//div[contains(@class, 'z-grid')]//input[contains(@class, 'z-bandbox-inp z-bandbox-readonly')]")
	@compAltaEst = elementosaltarepaband[0]
	@compAltaRepPa = elementosaltarepaband[1]
	@compAltaJu = elementosaltarepaband[3]
	@compAltaAdmin = elementosaltarepaband[4]

	
end

def DatosAltaRepa()
	ComponentesAltaRepa()
	
	@compAltaCod.click
	@compAltaCod.send_keys("asd")
	@compAltaNom.click
	@compAltaNom.send_keys("qwe")
	@compAltaTel.click
	@compAltaTel.send_keys("123")
	@compAltaFax.click

	@compAltaEst.click
	sleep(4)
	elementosaltabandbuscar = @browser.find_element(:xpath, "//div[contains(@class, 'z-bandbox-pp z-bandbox-shadow')]//div[contains(@class, 'z-groupbox-cnt')]//input[contains(@class, 'z-textbox')]")
	@compAltaBusq = elementosaltabandbuscar
	
	@compAltaBusq.click
	@compAltaBusq.send_keys("R01")


	@compAltaFax.send_keys("123asd")
	@compAltaOfi.click
	@compAltaOfi.send_keys("23")
	@compAltaMail.click
	@compAltaMail.send_keys("wer@hotmail.com")
	@compAltaCalle.click
	@compAltaCalle.send_keys("asdasdasd")
	@compAltaAltura.click
	@compAltaAltura.send_keys("234")
	@compAltaPiso.click
	@compAltaPiso.send_keys("34")
	@compAltaDpto.click
	@compAltaDpto.send_keys("234324")
	@compAltaCp.click
	@compAltaCp.send_keys("asd")
end

def combobox

end

end
