class Students

  def all
    # @students =
    [
      {name: "Bob", age: 10},
      {name: "Sue", age: 10},
      {name: "Greg", age: 15},
      {name: "Amanda", age: 8},
      {name: "Steve", age: 22},
    ]
  end

  def average_age
    age = []
    all.each { |hash| age << hash[:age] }
    age.inject(:+)/(age.length)
  end

  def name_string
    name = []
    all.each { |hash| name << hash[:name] }
    name.join(" ")
  end

  def find_first_older_than(age)
    student = []
    all.sort_by { |hash| hash[:age] }.each do |hash|
      if hash[:age] > age
        student << hash
      end
    end
    student.first

  end

  def any_older_than?(age)
    all.any? { |hash| hash[:age] > age }
  end

  def find_student(student_hash)
    if all.any? { |hash| hash[:name] == student_hash[:name] && hash[:age] == student_hash[:age] }
      student_hash
    else
      nil
    end
  end

  def student_present?(student_hash)
    all.any? { |hash| hash == student_hash }
  end

  def grouped_by_age
    # all.map { |hash| Hash[hash[:name] => hash[:age]] }.group_by { |hash| hash[Integer]}
    all.group_by { |hash| hash[:age] }.each_pair {|key, value| value.map! {|hash| hash[:name]} }

  end

end