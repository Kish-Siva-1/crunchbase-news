class Cli
  
  def call
    input = 0 
    
    until input == 'Exit' 
      
      puts "Welcome to the Crunchbase News scraper. Type 'Start' to start the scraper. To quit the program type 'Exit'." 
    
      input = get.strip #add some data validation rules
      
      if input == 'Start' 
        "The scraper is running. It will automatically extract the previous 10 pages of news items."
        
        Scraper.page_loop(10)
        
        "The Crunchase News scraper has finished running. News articles for the past 10 pages are available. The first page is displayed below. Choose one of these articles or choose another page you would like to see News articles for."
        
        display_page 
        
        "If you would like to see the page type the page number. To choose another page type 'Page X' e.g. Page 3"
        page_number = get.strip 
        
        if page_number.include?("Page") 
          display_page(page_number)
        else
          display_article(page_number)
        end 
        
      end 
    
    end 
  
  end 
  
  def goodbye 
    "You have ended the program. Have a nice day :)."
    return
  end 
  
  def display_article(article_no = 1)
    article = NewsStory.all[article_no - 1]
    Scraper.content_news_scrape(article.url)
    puts "Title: #{article.title}"
    puts "Author: #{article.author}" 
    puts "Date: #{article.date}" 
    puts "Content: #{article.content}"
  end 
  
  def display_page(page_number = 1)
    i=1
    display = NewsStory.all.select{|x| x.link == "https://news.crunchbase.com/page/#{page_number}"}
    display.each do |x|
      puts "#{i} Title: #{x.title}"
      puts "  Author: #{x.author}" 
      puts "  Date: #{x.date}" 
      i+=1
    end 
  end 
  
end 