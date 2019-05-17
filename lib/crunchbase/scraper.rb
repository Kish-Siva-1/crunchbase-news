class Scraper
  
  def self.page_loop(number_of_pages=1)
    i = 1
    news_scraper = []
    until i == number_of_pages do 
      crunch_link = "https://news.crunchbase.com/page/#{i}"
      Scraper.page_news_scrape(crunch_link)
      i+=1
    end
  end 
  
  def self.page_news_scrape(crunch_link)
    
    #extract the overall news articles 
    #extract article_title, author, date and article text summary  
    html = open(crunch_link)
    doc = Nokogiri::HTML(html)
    
      doc.css(".entry-content p").text
      doc.css(".herald-read-more").attr("title").text
      #everything should be beneath the entry-header tag title tag  = entry-title h3, author tag = fn, content tag entry-content, date tag is updated, url href "fn a"
        doc.css(".entry-header").each do |x|
          crunch_title = x.css(".entry-title").text
          crunch_author = x.css(".fn").text
          crunch_date = x.css(".updated").text
          crunch_category = x.css(".meta-category").text
          crunch_url = x.css(".entry-title a").attr("href").text 
          news_scraper << {title: crunch_title, author: crunch_author, date: crunch_date, category: crunch_category, url: crunch_url}      
        end 
    
  end 

  def self.content_news_scrape(news_article_link)
    #extract the detail of the news article 
    html = open(news_article_link)
    doc = Nokogiri::HTML(html)
    storage = []
    storage = doc.css(".entry-content p").text
    #need to reformat the text to have a new line for every paragraph 
  end
  
end 