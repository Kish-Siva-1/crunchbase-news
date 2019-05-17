class Scraper
  
  attr_accessor :news_scraper
  
  def self.page_loop(number_of_pages=1)
    i = 1
    @news_scraper = []
    until i == number_of_pages do 
      crunch_link = "https://news.crunchbase.com/page/#{i}"
      self.page_news_scrape(crunch_link)
      i+=1
    end
    NewsStory.extract_crunch_news(@news_scraper)
  end 
  
  def self.page_news_scrape(crunch_link)
    
    html = open(crunch_link)
    doc = Nokogiri::HTML(html)
      #everything should be beneath the entry-header tag title tag  = entry-title h3, author tag = fn, content tag entry-content, date tag is updated, url href "fn a"
        doc.css(".entry-header").each do |x|
          crunch_title = x.css(".entry-title").text
          crunch_author = x.css(".vcard a").collect{|x| x.children[0].text}.compact.join(", ") #adjustment made to include multiple authors
          crunch_date = x.css(".updated").text
          if crunch_date.empty?
            crunch_date = "N/A"
          else
            crunch_date
          end
          crunch_category = x.css(".meta-category").text
          crunch_url = x.css(".entry-title a").attr("href").text 
          crunch_link = crunch_link
          @news_scraper << {title: crunch_title, author: crunch_author, date: crunch_date, category: crunch_category, url: crunch_url, link: crunch_link}      
        end 
    
  end 

  def self.content_news_scrape(news_article_link)
    html = open(news_article_link)
    doc = Nokogiri::HTML(html)
    news_story = NewsStory.all.select{|x| x.url == news_article_link}[0]
    news_story.content = doc.css(".entry-content p").collect do |x|
        x.text if x.children[0].name =="text"
    end.compact.join("\n \n") 
  end
  
end 