require 'rspec'
require 'pg'
require 'pry'
require 'doctor'
require 'patient'

DB = PG.connect({:dbname => 'doctor_patient_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM patients *;")
    DB.exec("DELETE FROM doctors *;")
  end
end

describe('Doctor') do
  describe('#initialize') do
    it('creates new doctor instance') do
      doctor = Doctor.new({:name =>'doc', :specialty => 'ology'})
      expect(doctor.name).to(eq('doc'))
      expect(doctor.specialty).to(eq('ology'))
    end
  end

  describe('#save') do
    it('saves current doctor instance to database') do
      doctor = Doctor.new({:name =>'doc', :specialty => 'ology'})
      doctor.save
      result = Doctor.read_all
      expect(result[0].fetch('name')).to(eq('doc'));
      expect(result[0].fetch('specialty')).to(eq('ology'));
    end
  end
end

describe('Patient') do
  describe('#initialize') do
    it('creates new patient instance') do
      patient = Patient.new({:name =>'doc', :birthday => '1980-11-11', :need => 'general'})
      expect(patient.name).to(eq('doc'))
      expect(patient.birthday).to(eq('1980-11-11'))
      expect(patient.need).to(eq('general'))
    end
  end

  describe('#save') do
    it('saves current patient instance to database') do
      patient = Patient.new({:name =>'Jane', :birthday => '1985-11-11', :need => 'cough'})
      patient.save
      newpatient = DB.exec('SELECT * FROM patients;')
      expect(newpatient[0].fetch('name')).to(eq('Jane'))
    end
  end

  describe('#read_all') do
    it('reads current patient from database') do
      patient = Patient.new({:name =>'Sophie', :birthday => '1985-11-11', :need => 'tuberculosis'})
      patient.save
      result = Patient.read_all
      expect(result[0].fetch('birthday')).to(eq('1985-11-11 00:00:00'))
    end
  end
end
