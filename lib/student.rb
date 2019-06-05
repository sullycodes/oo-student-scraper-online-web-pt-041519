class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    student_hash.each do |k,v|
      if k == :name
        @name = v 
      elsif 
        k == :location
        @location = v
      end
      @@all << self
    end
  end

    #array looks like => [ {name => "John Doe", location => "Boston, MA", profile_url => "students/johndoe.html"}, {etc....} ]
  def self.create_from_collection(students_array)
    students_array.each do |e|
        student = Student.new(e)
      end
  end
    #hash looks like
  def add_student_attributes(attributes_hash)
    
  end

  def self.all
    @@all
  end

end

