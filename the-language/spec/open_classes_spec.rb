RSpec.describe "Open Classes" do
  class OpenClassesDog
    def bark
      "WOOF"
    end
  end

  it "barks as defined" do
    fido = OpenClassesDog.new
    expect( fido.bark ).to eq( "WOOF" )
  end

  # Open the existing OpenClassesDog class and add a new method.
  class OpenClassesDog
    def wag
      "HAPPY"
    end
  end

  it "can now wag too" do
    fido = OpenClassesDog.new
    expect( fido.wag ).to eq( "HAPPY" )
    expect( fido.bark ).to eq( "WOOF" )
  end

  class Integer
    def even_number?
      (self % 2) == 0
    end
  end

  it "is possible to reopen a built in class" do
    expect( 1.even_number? ).to eq( false )
    expect( 2.even_number? ).to eq( true )
  end

end
