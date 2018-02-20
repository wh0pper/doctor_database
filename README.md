# Doctor

## February 20, 2018

#### Sinatra, PostgreSQL App

#### By Jared Clemmensen, John Rykken

## Description
  A CRUD application for a faux hospital allowing administrators, doctors, and patients to view and input information.

## Specs

#### Backend
  1. Add new doctor (initialize(name, specialty))
  2. Add new patient (initialize(name, DOB, health concern))
  3. Assign patient to doctor ( assign_dr(doctorID)
  4. Search doctors table by specialty and return list of all ( list(specialty) )
  5. List all patients, and doctors ( .all() )
  6. List all patients of one doctor ( .patients )
  7. Return doctor of any given patient ( .doctor )

#### Frontend
  1.


## Setup/Installation Requirements
  1. install ruby 2.2.2
  2. install bundler gem ($ gem install bundler)
  3. clone or download word_definer repository
  4. run bundler in repository ($ bundle)
  5. host locally with Sinatra ($ ruby app.rb)

## Technologies Used
  This application was built with Sinatra and uses Postgresql for database management.

## License
  Copyright (c) 2018 Jared Clemmensen, Russell Hofvendahl

  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
