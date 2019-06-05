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
    
    social_links = doc.css('.vitals-container a @href').text
    
    social_links = []

      #if you dont do .text here you have to use it when you add it to the hash below ( e is still XML element, not a string) or you can use .to_str when adding using include => e.to_str.include? and then again when putting in hash (e.to_str)
    
    doc.css('.social-icon-container a @href').each do |e|
      social_links << e.text  
    end
    
    hash = {}
    
    social_links.each do |e|
      if e.include?("twitter") 
         hash[:twitter] = e
      elsif e.include?("github") 
         hash[:github] = e
      elsif e.include?("linkedin") 
         hash[:linkedin] = e
      else
          hash[:blog] = e
      end
    
      # hash = {}
      social_links.each do |e|
        if e.include?("facebook.com")
        puts e
      end
        # hash[:facebook] = e
      end
    end
    
    hash[:profile_quote] = doc.css('.profile-quote').text
    hash[:bio] = doc.css('.description-holder p').text
    
    hash
        
  end #scrape_profile_page

end
