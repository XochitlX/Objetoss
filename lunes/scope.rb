
=begin
def return_my_local_var
  local_var = "this is my local var"
  local_var
end
p return_my_local_var

#En primera instancia no reconocía la variable dado que no se encontraba dentro del método
#y cuando se hace el cambio para que se encuentre dentro del metodo no hay problema, 
#ya que se trata de una variable local



class DummyClass

  def initialize
    @local_var = "this is my local var"
  end

  def return_my_local_var
    @local_var
  end
end

dummy = DummyClass.new
p dummy.return_my_local_var

# Aquí si utilizamos a la variable como una variable local, solo se podrá reconocer dentro
#de cada metodo y por separado, haciendo que el programa tenga error, pero a diferencia si
#se declara esta variable como una variable de instancia la podemos ocupar y la reconoce 
#toda la clase


class DummyClass
  def initialize
    @local_var = "this is my local var"
  end

  def return_my_local_var
    @local_var
  end

  # Este es un getter
  def instance_var
    @instance_var
  end

# Este es un setter
  def instance_var=(value)
    @instance_var = value
  end
end

dummy_class = DummyClass.new
#p dummy.return_my_local_var

p dummy_class.instance_var=("Bar")
p dummy_class.instance_var
p dummy_class.instance_var   =    "Baz"
p dummy_class.instance_var




class DummyClass
  @@class_variable = "This is a class variable"

  def initialize
    @local_var = "this is my local var"
  end

  def class_variable
    @@class_variable
  end
  def class_variable=(new_value)
    @@class_variable = new_value
  end

  def return_my_local_var
    @local_var
  end

  # Este es un getter
  def instance_var
    @instance_var
  end

# Este es un setter
  def instance_var=(value)
    @instance_var = value
  end
end

dummy_1 = DummyClass.new
dummy_2 = DummyClass.new

p dummy_1.class_variable
p dummy_2.class_variable
dummy_1.class_variable = "New value for the class variable"
p dummy_1.class_variable
p dummy_2.class_variable
=end


$global_var = "This is a global variable"
CONSTANT = 3.1416 

def global_var
  $global_var
end
def global_var=(new_value)
  $global_var = new_value
end



class DummyClass
  @@class_variable = "This is a class variable"

  def initialize
    @local_var = "this is my local var"
  end

  def class_variable
    @@class_variable
  end
  def class_variable=(new_value)
    @@class_variable = new_value
  end

  def return_my_local_var
    @local_var
  end

  # Este es un getter
  def instance_var
    @instance_var
  end

# Este es un setter
  def instance_var=(value)
    @instance_var = value
  end

  def global_var
  $global_var
end
def global_var=(new_value)
  $global_var = new_value
end

end

dummy_1 = DummyClass.new
dummy_2 = DummyClass.new

p dummy_1.global_var
p $global_var 
p $global_var = "again"
p dummy_1.global_var