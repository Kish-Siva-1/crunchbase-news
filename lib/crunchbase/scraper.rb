class Scraper
  
  def self.news_scrape
    html = open("https://news.crunchbase.com")
    doc = Nokogiri::HTML(html)
    binding.pry
  end 

end 