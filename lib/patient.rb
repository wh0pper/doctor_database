class Patient
  attr_accessor :name, :birthday, :need

  def initialize(attributes)
    @name = attributes[:name]
    @birthday = attributes[:birthday]
    @need = attributes[:need]
  end
end
