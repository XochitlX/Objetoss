#require 'rubygems'
require 'nokogiri'
require 'open-uri'

class TwitterScrapper
  def initialize(url)
    @url = url
    @page = Nokogiri::HTML(open("#{@url}"))
  end

  def extract_username
    @profile_name = @page.search(".ProfileHeaderCard-name > a").first.inner_text
  end

   
  def extract_tweets
    #Mensaje
    msn = []
    @page.search(".tweet-text").each do |item|
      msn << [item.inner_text]
    end
    #msn
    
    # fecha
    date = []
    @page.search(".js-short-timestamp").children.each do |item|
      date << item.inner_text
    end
    #date
    
    #ret likes... todos
    all = []
    @page.search(".ProfileTweet-actionCount").children.each do |item|
      all << item.inner_text
    end
    p all
    all = all.join(" ").split(" ")
    all = all.reject { |item| item = "" if item == "gusta" }

    retweet = []
    favorites = []
    for item in 0..all.length
        if all[item + 1] == "retweets"
            retweet << all[item]
        elsif all[item + 1] == "Me"
            favorites << all[item]
        end
    end 

    @msn = msn
    @date = date
    @all = all
    @retweet = retweet
    @favorites = favorites
  end

  def extract_stats
    data=[]

    @page.search(".ProfileNav-list > li").each do |datos|
      data << datos.inner_text
    end
    data = data.join(" ").split(" ")

    @tweets = data[4]
    @following = data[7]
    @followers = data[10]
    @likes = data[15]
  end

  def imprimir_pantalla
    print "\nUsername: #{@profile_name}\n"
    print "----------------------------------------------------------------------------\n"
    print "Stats: Tweets: #{@tweets}, Siguiendo: #{@following}, Seguidores: #{@followers}, Favoritos: #{@likes}\n"
    print "----------------------------------------------------------------------------\n"
    print "Tweets:\n"

    for item in 0..@date.length
        print "   #{@date[item]}: #{@msn[item][0]}\n"
        print "   Retweets:#{@retweet[item]}, Favorites:#{@favorites[item]}\n\n"
    end  

  end
end

cantante = TwitterScrapper.new("https://twitter.com/LanaDelRey")
 cantante.extract_username
 cantante.extract_tweets
 cantante.extract_stats

 cantante.imprimir_pantalla
