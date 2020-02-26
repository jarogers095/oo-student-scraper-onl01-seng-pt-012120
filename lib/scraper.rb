require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))
    cards = page.css(".student-card")
    students_array = []
    cards.each do |card|
      student_hash = {
        name: card.css("a .card-text-container .student-name").text,
        location: card.css("a .card-text-container .student-location").text,
        profile_url: card.css("a").attribute("href").value
      }
      students_array << student_hash
    end
    
    return students_array
  end

  def self.scrape_profile_page(profile_url)
    profile_hash = {
      twitter: nil,
      linkedin: nil,
      github: nil,
      blog: nil,
      profile_quote: nil,
      bio: nil
    }
    
    page = Nokogiri::HTML(open(profile_url))
    
    profile_hash[:bio] = page.css(".bio-block .bio-content .description-holder p").text
    profile_hash[:profile_quote] = page.css(".profile-quote").text
    
    socials = page.css(".social-icon-container a")
    socials.each do |social|
      url = social.attribute("href").value
    end
      
  end

end

