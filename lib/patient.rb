class Patient
  attr_accessor :name, :birthday, :need, :doctorid

  def initialize(attributes)
    @name = attributes[:name]
    @birthday = attributes[:birthday]
    @need = attributes[:need]
    @doctorid
  end

  def save
    if !(DB.exec("SELECT * FROM patients;").column_values(1).include?(@name))
      DB.exec("INSERT INTO patients (name, birthday, need) VALUES ('#{@name}', '#{@birthday}', '#{@need}');")
    end
  end

  def self.read_all
    variable = DB.exec("SELECT * FROM patients;")
    patients = []
    variable.each do |x|
      patients.push(x)
    end
    return patients
  end

  def assign_dr(doctor_id)
    @doctorid = doctor_id
    DB.exec("UPDATE patients SET doctorid = '#{doctor_id}' WHERE name='#{@name}'")
  end

  def self.find(id)
    info = DB.exec("SELECT * FROM patients WHERE id='#{id}';")[0]
    Patient.new({:name => "#{info['name']}", :birthday => "#{info['birthday']}", :need => "#{info['need']}"})
  end

end
