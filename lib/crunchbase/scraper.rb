class Scraper
  
  def self.overall_news_scrape
    #extract the overall news articles 
    #extract article_title, author, date and article text summary  
    crunch_link = "https://news.crunchbase.com"
    html = open(crunch_link)
    doc = Nokogiri::HTML(html)
    
      doc.css(".entry-content p").text
      doc.css(".herald-read-more").attr("title").text
      #everything should be beneath the entry-header tag title tag  = entry-title h3, author tag = fn, content tag entry-content, date tag is updated, url href "fn a"
        doc.css(".entry-header").each do |x|
          x.css(".meta-category").text
        end 
          binding.pry
    
  end 

  def self.detailed_news_scrape(news_article_link)
    #extract the detail of the news article 
    html = open("https://news.crunchbase.com")
    doc = Nokogiri::HTML(html)

  end
  
end 