Dado (/^que ingreso a la pantalla de login e ingreso mis credenciales$/) do
  require_relative 'metodos'
  @nav = Metodoseu.new
  @nav.AbrirPag ("https://cas.nac.everis.int/cas/login")
  @nav.SetDatosIngreso("fbonifac","Boni1245")
end

Cuando (/^presiono en acceder$/) do
	 @nav.IngresoCAS 
end

Entonces (/^debo ingresar a EU$/) do
	sleep(7)	
	#if @nav.EvaluarIngreso("http://eu.nac.everis.int/eu-web/") != true
	#	fail "Fallo"
	#end
	sleep(6)
	@nav.DatosRepaSectorMR("MARINAIDAS","ALS")
	sleep(4)
	@nav.SeleccionMR

end


Cuando (/^selecciono la solapa Administración$/) do
	sleep(4)
	@nav.SeleccionarSolapa("Administración")
end

Cuando (/^selecciono la subsolapa Sellos$/) do
	sleep(5)
	@nav.SeleccionarSubSolapa("Reparticiones")
	sleep(3)
	@nav.SeleccionarAlta("Alta Repartición")
	sleep(3)
	@nav.DatosAltaRepa
end