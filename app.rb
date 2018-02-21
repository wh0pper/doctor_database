#!/home/linuxbrew/.linuxbrew/bin/env ruby
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
also_reload('lib/**/*.rb')
require './lib/doctor'
require './lib/patient'
require 'pg'

DB = PG.connect({:dbname => 'doctor_patient'})

get('/') do
  erb(:home)
end

get('/doctors') do
  erb(:doctors)
end

get('/patients') do
  erb(:patients)
end

get('/administrators') do
  @doctors = []
  @patients = []
  erb(:administrators)
end

post('/administrators') do

  doctor_name = params[:name_doc]
  specialty = params[:specialty]
  patient_name = params[:name_patient]
  birthday = params[:birthday]
  need = params[:need]
  if doctor_name
    doctor = Doctor.new({:name => doctor_name, :specialty => specialty})
    doctor.save
  end
  if patient_name
    patient = Patient.new({:name => patient_name, :birthday => birthday, :need => need})
    patient.save
  end
  @doctors = Doctor.read_all
  @patients = Patient.read_all
  erb(:administrators)
end

get('/patients/:id') do
  @this_patient = Patient.find(params[:id])
  @doctors = Doctor.read_all
  @doc_id = params[:doclist]
  # @this_patient.assign_dr(doc_id)
  # @doc_name = Doctor.get_name(doc_id)
  erb(:patients)
end



# get('/') do
#   @cards = Card.read_all
#   erb(:flashcards)
# end
#
# post('/') do
#   front = params["front"]
#   back = params["back"]
#   card = Card.new({:front => front, :back => back})
#   card.create
#   @cards = Card.read_all
#   erb(:flashcards)
# end

# get('/:word') do
#   word = params[:word]
#   @entry = Entry.find(word)
#   # binding.pry
#   erb(:entry)
# end
#
# post('/:word') do
#   word = params[:word]
#   definition = params["definition"]
#   @entry = Entry.find(word)
#   @entry.define(definition)
#   erb(:entry)
# end
