class Cli
  
  def call
    input = 0 
    
    Scraper.page_loop(10)
    
    loop do |x|
      
      puts "Welcome to the Crunchbase News scraper. Type 'Start' to start the scraper. To quit the program type 'Exit'." 
    
      input = get.strip
      
      if input == 'Start' 
        "The scraper is running. It will automatically extract the previous 10 pages of news items."
        #Saves the list of news items and article numbers in news_story 
        #news_story information will be stored here
        "The Crunchase News scraper has finished running. News articles between for the past 10 pages are available. Please type the page you would like to see News articles for."
        "Page Number:"
        page_number = get.strip 
      elsif input == 'Exit'  
        goodbye
      end 
    
    end 
  end 
  
    def goodbye 
      "You have ended the program. Have a nice day :)."
    end 
  
end 