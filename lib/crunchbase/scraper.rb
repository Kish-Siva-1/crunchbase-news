class Scraper
  
  def self.news_scrape
    html = open("https://news.crunchbase.com")
    doc = Nokogiri::HTML(html)

  end 

end 