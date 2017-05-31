# El cocinero (user stories):

# Necesita preparar diferentes tipos de tortas.
# Necesita meter las tortas por lotes al horno.
# Y lo más importante saber cuando sacarlas.
# crudo, casi listo, listo y quemado.

#Tipos: queso, salchicha, milanesa
class Torteria

  def initialize(charola, tiempo)
    @charola = charola
    @tiempo = tiempo
  end

  def coccion(tipo_torta)

    if tipo_torta == "queso"
      @listo = 5
    elsif tipo_torta == "salchicha"
      @listo = 7
    elsif tipo_torta == "milanesa"
      @listo = 10      
    end
   
  end

  # crudo, casi listo, listo y quemado.
  def horneado
    p @charola
    #charola_final = []

    @charola.each do |torta|
      #p torta
      coccion(torta)
      #p @listo
      if @tiempo == @listo
        #charola_final << "Torta de #{torta}: lista¡"
        p "Torta de #{torta}: lista¡"
      elsif @tiempo > @listo
        #charola_final << "Torta de #{torta}: quemada¡¡"
        p "Torta de #{torta}: quemada¡¡"
      elsif @tiempo > (@listo - 2) && @tiempo < @listo
        #charola_final << "Torta de #{torta}: casi lista¡"
        p "Torta de #{torta}: casi lista¡"
      else
        #charola_final << "Torta de #{torta}: cruda¡"
        p "Torta de #{torta}: cruda¡"
      end
    end
    #p charola_final
  end

end

tortas = ["milanesa", "queso", "queso", "salchicha", "milanesa"]
ronda_1 = Torteria.new(tortas, 7)
p ronda_1.horneado
