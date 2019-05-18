class Cli
  
  def call
    input = 0 
    page_number = nil
    
    until input == 'Exit' 
      
      puts "\n Welcome to the Crunchbase News scraper. Type 'Start' to start the scraper. To quit the program type 'Exit'." 
    
      input = gets.strip.capitalize #add some data validation rules
      
      if input == 'Start' 
        puts "\n The scraper is running. It will automatically extract the previous 10 pages of news items."
        
        Scraper.page_loop(10)

        puts "\n The Crunchase News scraper has finished running. News articles for the past 10 pages are available. The first page is displayed below. Choose one of these articles or choose another page you would like to see News articles for."
        
        puts "\n Press any button to continue"
        
        any_key = gets.strip #To slow down the text and allow the person to read the text
        
        display_page 
        
        until page_number.capitalize == 'Exit' 
          puts "\n If you would like to see a different page, type the page number in the format 'Page X', e.g. Page 3. Otherwise please choose the article you would like to read from the list above by typing the article number e.g. '1' for article 1. To quit type 'Exit'."
          
          page_number = gets.strip.capitalize
          
            if page_numberinclude?("Page") 
              display_page(page_numbersub("Page", "").strip.to_i)
            else
              display_article(page_number.to_i)
            end 
        end 
        
      end 
    
    end 
    
    puts "\n You have ended the program. Have a nice day :)."
    return
    
  end 

  def display_article(article_no = 1)
    article = NewsStory.all[article_no - 1]
    if article.content = []
      Scraper.content_news_scrape(article.url)
    end 
    puts "\nTitle: #{article.title}"
    puts "\nAuthor: #{article.author}" 
    puts "\nDate: #{article.date}" 
    puts "\nContent: #{article.content}"
  end 
  
  def display_page(page_number = 1)
    i=1
    display = NewsStory.all.select{|x| x.link == "https://news.crunchbase.com/page/#{page_number}"}
    display.each do |x|
      puts "\n#{i} Title: #{x.title}"
      puts "  Author: #{x.author}" 
      puts "  Date: #{x.date}" 
      i+=1
    end 
  end 
  
end 