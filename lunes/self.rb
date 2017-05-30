

class DummyClass #refiere al objeto

    def intance_method
        puts "Dentro de un método de instancia"
        puts "En este contexto self es igual a: #{self}"
    end
end

dummy_class = DummyClass.new()
puts dummy_class.intance_method

# class DummyClass #refiere a la clase

#     def self.class_method
#             puts "Dentro de un método de clase"
#         puts "En este contexto self es igual a: #{self}"
#     end
# end

# dummy_class = DummyClass.new()

# puts DummyClass.class_method  
