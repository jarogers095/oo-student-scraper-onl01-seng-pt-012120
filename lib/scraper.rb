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
    page = Nokogiri::HTML(open(profile_url))
    
  end

end

