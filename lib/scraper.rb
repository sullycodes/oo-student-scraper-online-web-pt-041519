require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)

  html = open(index_url)
  doc = Nokogiri::HTML(html)

  profiles = []

  doc.css(".student-card").each do |e|
      hash = {}
      name = e.css(".student-name").text
      location = e.css(".student-location").text
      profile_url = e.css("a @href").text
      hash[:name] = name
      hash[:location] = location
      hash[:profile_url] = profile_url
      profiles << hash
    end
  profiles
    
  end #scrape_index


  #returns a hash of attributes describing an individual 
  # twitter
  # linkedin
  # github
  # blog
  # profile_quote
  # bio  
  def self.scrape_profile_page(profile_url)
    
    html = open(profile_url)
    doc = Nokogiri::HTML(html)
    # puts doc.css('.social-icon-container').text
    bio = doc.css('.description-holder p').text
    blog = "http://flatironschool.com"
    profile_quote = doc.css('.profile-quote').text
    # social_links = doc.css('.vitals-container a @href').text
    
    social_links = []

    doc.css('.social-icon-container a @href').each do |e|
      social_links << e
    end
    
    # puts social_links[2]
    
    
      # hash = {}
      social_links.each do |e|
        e.include?("facebook.com")
        puts e
        # hash[:facebook] = e
      end
        
    
  end #scrape_profile_page

end

puts Scraper.scrape_profile_page('./fixtures/student-site/students/aaron-enser.html')