RSpec.describe "ruby classes" do
  class ClassesDog
  end

  it "creates new instances of ClassesDog with new" do
    fido = ClassesDog.new
    expect( fido.class ).to eq( ClassesDog )
  end

  class ClassesDog2
    def set_name(a_name)
      @name = a_name
    end
  end

  it "sets instance variables by assigning to them " do
    fido = ClassesDog2.new
    expect( fido.instance_variables ).to eq( [] )

    fido.set_name("Fido")
    expect( fido.instance_variables ).to eq( [:@name] )
  end

  it "can not access instance variables outside of the class" do
    fido = ClassesDog2.new
    fido.set_name("Fido")

    expect { fido.name }.to raise_error( NoMethodError )
    expect {
      eval "fido.@name"
      # NOTE: Using eval because the above line is a syntax error.
    }.to raise_error( SyntaxError )
  end

  it "is possible to ask for an instance variable, politely" do
    fido = ClassesDog2.new
    fido.set_name("Fido")

    expect( fido.instance_variable_get("@name") ).to eq( "Fido" )
  end

  it "can rip out the instance variable using instance_eval" do
    fido = ClassesDog2.new
    fido.set_name("Fido")

    expect( fido.instance_eval("@name") ).to eq( "Fido" ) # string version
    expect( fido.instance_eval { @name } ).to eq( "Fido" ) # block version
  end

  class ClassesDog3
    def set_name(a_name)
      @name = a_name
    end
    def name
      @name
    end
  end

  it "can have accessor methods to access instance variables" do
    fido = ClassesDog3.new
    fido.set_name("Fido")

    expect( fido.name ).to eq( "Fido" )
  end

  class ClassesDog4
    attr_reader :name

    def set_name(a_name)
      @name = a_name
    end
  end


  it "can automatically define an accessor using attr_reader" do
    fido = ClassesDog4.new
    fido.set_name("Fido")

    expect( fido.name ).to eq( "Fido" )
  end

  class ClassesDog5
    attr_accessor :name
  end


  it "can automatically create readers and writers with attr_accessor" do
    fido = ClassesDog5.new

    fido.name = "Fido"
    expect( fido.name ).to eq( "Fido" )
  end

  class ClassesDog6
    attr_reader :name
    def initialize(initial_name)
      @name = initial_name
    end
  end

  it "uses initialize to set up initial values of instance variables" do
    fido = ClassesDog6.new("Fido")
    expect( fido.name ).to eq( "Fido" )
  end

  it "match args to new with initializer" do
    expect { ClassesDog6.new }.to raise_error( ArgumentError )
    # THINK ABOUT IT:
    # Why is this so?
  end

  it "has different instance variables for different instances" do
    fido = ClassesDog6.new("Fido")
    rover = ClassesDog6.new("Rover")

    expect( rover.name != fido.name ).to eq( true )
  end

  class ClassesDog7
    attr_reader :name

    def initialize(initial_name)
      @name = initial_name
    end

    def get_self
      self
    end

    def to_s
      @name
    end

    def inspect
      "<ClassesDog named '#{name}'>"
    end
  end

  it "uses self inside method to refer to the containing object" do
    fido = ClassesDog7.new("Fido")

    fidos_self = fido.get_self
    expect( fidos_self ).to eq( fido )
  end

  it "provides a string version of the object with to_s" do
    fido = ClassesDog7.new("Fido")
    expect( fido.to_s ).to eq( "Fido" )
  end

  it "uses to_s inside string interpolation" do
    fido = ClassesDog7.new("Fido")
    expect( "My ClassesDog is #{fido}" ).to eq( "My ClassesDog is Fido" )
  end

  it "uses inspect to provide a string description of the object" do
    fido = ClassesDog7.new("Fido")
    expect( fido.inspect ).to eq( "<ClassesDog named 'Fido'>" )
  end

  it "has to_s and inspect on all objects" do
    array = [1,2,3]

    expect( array.to_s ).to eq( "[1, 2, 3]" )
    expect( array.inspect ).to eq( "[1, 2, 3]" )

    expect( "STRING".to_s ).to eq( "STRING" )
    expect( "STRING".inspect ).to eq( "\"STRING\"" )
  end

end
