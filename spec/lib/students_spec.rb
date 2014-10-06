require 'spec_helper'

require 'students_miji'

describe Students do
  let(:students) { Students.new }
  it 'can return all students' do
    expected_students = [
        {name: "Bob", age: 10},
        {name: "Sue", age: 10},
        {name: "Greg", age: 15},
        {name: "Amanda", age: 8},
        {name: "Steve", age: 22},
    ]

    expect(students.all).to match_array expected_students
  end

  it 'can calculate the average age of the class' do
    expect(students.average_age).to eq 13
  end

  it 'can return a string of student names' do
    expect(students.name_string).to eq "Bob Sue Greg Amanda Steve"
  end

  it 'can find a student older than a certain age' do
    actual = students.find_first_older_than(10)

    expect(actual).to eq({name: "Greg", age: 15})
  end

  it 'can find out if there are any old enough to drink' do
    expect(students.any_older_than?(21)).to eq true

    expect(students.any_older_than?(55)).to eq false
  end

  it 'can find a specific student' do
    actual = students.find_student({name: "Sue", age: 10})
    expect(actual).to eq({name: "Sue", age: 10})

    actual = students.find_student({name: "Homer", age: 30})
    expect(actual).to eq(nil)

  end
  #
  it 'can determine if a specific student is present' do
    expect(students.student_present?({name: "Sue", age: 10})).to eq true

    expect(students.student_present?({name: "Homer", age: 30})).to eq false
  end

  it 'can group students by age' do
    expected = {
        10 => ["Bob", "Sue"],
        15 => ["Greg"],
        8 => ["Amanda"],
        22 => ["Steve"],
    }
    expect(students.grouped_by_age).to eq expected
  end
end