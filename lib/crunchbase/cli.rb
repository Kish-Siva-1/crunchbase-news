class Cli
  
  def call
    input = 'na' 
    page_number = 'na'
    article_page = 1
    
    until input.capitalize == 'Exit' 
      
      puts "\n Welcome to the Crunchbase News scraper. Type 'Start' to start the scraper. To quit the program type 'Exit'." 
      
      input = gets.strip.capitalize
      
      until (input == 'Start') || (input == 'Exit')
         
        if (input != 'Start') && (input != 'Exit')
          begin
            raise PartnerError1
          rescue PartnerError1 => error
              puts error.message
          end
          input = gets.strip.capitalize
        end

      end 
      
      if input == 'Start' 
        puts "\n The scraper is running. It will automatically extract the latest 10 pages of news items."
        
        Scraper.page_loop(10)

        puts "\n The Crunchase News scraper has finished running. News articles for the past 10 pages are available. The first page is displayed below. Choose one of these articles or choose another page you would like to see News articles for."
        
        puts "\n Press any button to continue"
        
        any_key = gets.strip #To slow down the text and allow the person to read the text
        
        display_page 
        
        until page_number == 'Exit' 
          puts "\n If you would like to see a different page, type the page number in the format 'Page X', e.g. Page 3. Otherwise please choose the article you would like to read from the list above by typing the article number e.g. 'Article 1' for article 1. To quit type 'Exit'."
          
          page_number = gets.strip.capitalize

          if page_number.include?('Page') && page_number.sub("Page", "").strip.to_i.between?(1,10)
            article_page = page_number.sub("Page", "").strip.to_i
          end 
          
          until (page_number.include?('Page') && page_number.sub("Page","").strip.to_i.between?(1,10)) || page_number == 'Exit' || ((page_number.include?('Article') && page_number.sub("Article","").strip.to_i.between?(1,NewsStory.all.select{|x| x.link == "https://news.crunchbase.com/page/#{article_page}"}.count)))  
          
            if page_number.include?('Page') == true && page_number.sub("Page", "").strip.to_i.between?(1,10)==false
              begin
                raise PartnerError1
              rescue PartnerError1 => error
                  puts error.message2
              end
              page_number = gets.strip.capitalize
              if page_number.include?('Page') && page_number.sub("Page","").strip.to_i.between?(1,10)
                article_page = page_number.sub("Page", "").strip.to_i
              end 
            elsif page_number.include?('Article') == true && page_number.sub("Article","").strip.to_i.between?(1,NewsStory.all.select{|x| x.link == "https://news.crunchbase.com/page/#{article_page}"}.count) == false
              begin
                raise PartnerError1
              rescue PartnerError1 => error
                  puts error.message3
              end
              page_number = gets.strip.capitalize
              if page_number.include?('Page') && page_number.sub("Page","").strip.to_i.between?(1,10)
                article_page = page_number.sub("Page", "").strip.to_i
              end 
            
            else
              
              begin
                raise PartnerError1
              rescue PartnerError1 => error
                  puts error.message4
              end
              page_number = gets.strip.capitalize
              if page_number.include?('Page') && page_number.sub("Page","").strip.to_i.between?(1,10)
                article_page = page_number.sub("Page", "").strip.to_i
              end 
            
            end
          
          end
          
          if page_number.include?("Page") 
            display_page(page_number.sub("Page", "").strip.to_i)
          else
            display_article(page_number.sub("Article", "").strip.to_i, article_page)
          end 
          
        end 
        
      end 
    
    end 
    
    puts "\n You have ended the program. Have a nice day :)."
    return
    
  end 

  def display_article(article_no = 1, page_number=1)
    
    article = NewsStory.all.select{|x| x.link == "https://news.crunchbase.com/page/#{page_number}"}
    article = article[article_no - 1]
    if article.content == []
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

class PartnerError1 < StandardError
  def message 
    "Input Error: Please type 'Start' to continue or 'Exit' to quit the program."
  end
  
  def message2 
    "Input Error: Please type 'Exit' to end the program or a page number between 0 and 10 to move to a specific page."
  end
  
  def message3 
    "Input Error: Please type 'Exit' to end the program or 'Article X' to move to a specific article out of the ones provided."
  end
  
  def message4 
    "Input Error: Please type 'Exit' to end the program or 'Page X' to move to a specific page or 'Article X' to move to a specific article."
  end
end