class NewsStory
  #all the information about the story (description, author, articles information)
  attr_accessor :title, :author, :date, :category, :url, :link
  
  @@all = []
  
  def initialize(news_hash)
    @title = news_hash[:title] if news_hash[:title] 
    @author = news_hash[:author] if news_hash[:author]
    @date = news_hash[:date] if news_hash[:date]
    @category = news_hash[:category] if news_hash[:category]
    @url = news_hash[:url] if news_hash[:url]
    @link = news_hash[:link] if news_hash[:link]
    @@all << self
  end 
  
  def self.all
    @@all
  end 
  
  def self.clear_all
    @@all.clear
  end
  
  def self.extract_crunch_news(news_store_array)
    news_store_array.each do |x|
      self.new(x)
    end 
  end 
  
end