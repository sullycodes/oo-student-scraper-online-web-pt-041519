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
    
    #hash looks like: {:twitter=>"http://twitter.com/flatironschool", :linkedin=>"https://www.linkedin.com/in/flatironschool", :github=>"https://github.com/learn-co, :blog=>"http://flatironschool.com", :profile_quote=>"\"Forget safety. Live where you fear to live. Destroy your reputation. Be notorious.\" - Rumi", :bio=> "I'm a school"}
  
    # :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 
  def add_student_attributes(attributes_hash)
    attributes_hash.each do |k,v|
      if k == :twitter
        @twitter = v 
      elsif 
        k == :linkedin
        @linkedin = v
      end
  end

  def self.all
    @@all
  end

end

