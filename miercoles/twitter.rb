#require 'rubygems'
require 'nokogiri'
require 'open-uri'

class TwitterScrapper
  def initialize(url)
    @url = url
    @page = Nokogiri::HTML(open("#{@url}"))
  end

  def extract_username
    profile_name = @page.search(".ProfileHeaderCard-name > a")
    profile_name.first.inner_text
  end

   
  def extract_tweets
    # twits=[]
    # twits = @page.search(".tweet")
    # twits = twits.pop
    # twits.each do |tweet|
    #   #p text = tweet.css(".js-tweet-text-container > p").inner_text
    #   p retweet = tweet.search(".js-tweet-text").inner_text
    # end


    # #Mensaje
    # msn = []
    # @page.search(".tweet-text").each do |item|
    #   msn << [item.inner_text]
    #   #puts item.inner_text
    # end
    # p msn
    
    # # fecha
    # date = []
    # @page.search(".js-short-timestamp").children.each do |item|
    #   date << item.inner_text
    # end
    # p date
    
    # #ret likes... todos
    # all = []
    # @page.search(".ProfileTweet-actionCount").children.each do |item|
    #   all << item.inner_text
    # end
    # p all = all.join(" ").split(" ")
       

  end

  def extract_stats
    data=[]

    @page.search(".ProfileNav-list > li").each do |datos|
      data << datos.inner_text
    end
    p data.join(" ").split(" ")


    
    # @page.search(".ProfileNav-value").map do |datos|
    # data << datos.inner_text   
    # end
    # p "Hola, tengo #{data[3]} likes "
    # puts  "#{data[0].to_i}tweets"
    # puts "#{data[1]} following"
    # puts "#{data[2]} followers"
    
  end
end

cantante = TwitterScrapper.new("https://twitter.com/LanaDelRey")
 cantante.extract_username
 cantante.extract_tweets
 cantante.extract_stats
