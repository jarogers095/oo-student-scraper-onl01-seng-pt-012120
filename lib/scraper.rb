require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))
    cards = page.css(".student-card")
    students_array = []
    cards.each do |card|
      student_hash = {
        name: card.css()
      }
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

