class NewsStory
  #all the information about the story (description, author, articles information)
  attr_accessor :title, :author, :date, :category, :url, :link, :content
  
  @@all = []
  
  def initialize(news_hash)
    @title = news_hash[:title] if news_hash[:title] 
    @author = news_hash[:author] if news_hash[:author]
    @date = news_hash[:date] if news_hash[:date]
    @category = news_hash[:category] if news_hash[:category]
    @url = news_hash[:url] if news_hash[:url]
    @link = news_hash[:link] if news_hash[:link]
    @content = []
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
      NewsStory.find_or_create_by_url(x)
    end 
  end 
  
  def self.find_or_create_by_url(x)
    if !@@all.find{|y| y.url == x[:url]}
      self.new(x)
    end 
  end 
end