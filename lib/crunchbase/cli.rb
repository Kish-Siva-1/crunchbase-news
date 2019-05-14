class Cli
  
  def call
    puts "Today's Date:"
    Scraper.news_scrape
  end 
  
end 