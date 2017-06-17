require "faker"
require 'date'
require 'csv'

class Person 
  attr_reader :first_name, :last_name, :email, :phone, :created_at

  def initialize(first_name, last_name, email, phone, created_at)
  #(first_name = Faker::Name.first_name, last_name = Faker::Name.last_name, email = Faker::Internet.email, phone = Faker::PhoneNumber.phone_number, created_at = Faker::Date.birthday(18, 65))
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone = phone
    @created_at = created_at
  end

end


def people(number)
  prueba = []
  for item in 1..number
     prueba << Person.new(Faker::Name.first_name, Faker::Name.last_name, Faker::Internet.email, Faker::PhoneNumber.phone_number, Faker::Date.backward)
  end
  prueba[0] = Person.new("Xochitl", "Tufiño", "xochitl@gmail", "511131146", "2017-05-15")
  prueba
end

#p people(5)[0].first_name
people_objetos = people(15)
#p people



# Crea un método que reciba un array y por cada elemento cree una línea en el archivo CSV.
class PersonWriter
  def initialize(archivo, objetos)
    @archivo = archivo
    @objetos = objetos
  end

  def create_csv
    CSV.open(@archivo, "wb") do |csv|
      @objetos.each do |persona|
        csv << [persona.first_name, persona.last_name, persona.email, persona.phone, persona.created_at]
      end
    end
  end
end

person_writer = PersonWriter.new("people.csv", people_objetos)
person_writer.create_csv


#Crea una instancia de la clase Person y guárdalas en un arreglo.
class PersonParser
  def initialize(archivo)
    @archivo = archivo
  end

  def people
    array = []
    csv = CSV.read(@archivo, "rb") #****
    
    csv.each do |row|
      array << Person.new(row[0], row[1], row[2], row[3], row[4])
      #p row*("")
    end
    p array[0..9]
  end
end

parser = PersonParser.new('people.csv')
p people = parser.people.count

