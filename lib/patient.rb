class Patient
  attr_accessor :name, :birthday, :need

  def initialize(attributes)
    @name = attributes[:name]
    @birthday = attributes[:birthday]
    @need = attributes[:need]
  end

  def save
    DB.exec("INSERT INTO patients (name, birthday, need) VALUES ('#{@name}', '#{@birthday}', '#{@need}');")
  end

  def self.read_all
    variable = DB.exec("SELECT * FROM patients;")
    patients = []
    variable.each do |x|
      patients.push(x)
    end
    return patients
  end

end
