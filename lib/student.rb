class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    #assigns values to students from create_from_collection initialize prompt 
    self.send("name=", student_hash[:name])
    self.send("location=", student_hash[:location])
    self.send("profile_url=", student_hash[:profile_url])
    @@all << self 
  end

  def self.create_from_collection(students_array)
    #iterates over an array created by scrape_index_page class method in scraper class
    students_array.each do |student_hash|
      Student.new(student_hash)
  end

  def add_student_attributes(attributes_hash)
    #takes in the result of the scrape_profile_page class method in scraper class 
    self.send("twitter=", attributes_hash[:twitter])
    self.send("linkedin=", attributes_hash[:linkedin])
    self.send("github=", attributes_hash[:github])
    self.send("blog=", attributes_hash[:blog])
    self.send("profile_quote=", attributes_hash[:profile_quote])
    self.send("bio=", attributes_hash[:bio])
  end

  def self.all
    @@all 
  end
end

