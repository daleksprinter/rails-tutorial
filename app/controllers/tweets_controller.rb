require 'dotenv'
Dotenv.load
class TweetsController < ApplicationController
    def index
        @tweets = getTweets
    end

    def show
        @tweet = getTweetbyId(params[:id])
    end

    def add_like
        tweet = Tweet.find(params[:id])
        tweet.good = tweet.good.to_i + params[:like_count].to_i
        tweet.save
        redirect_to action: 'index'
    end

    def create
        url = params[:tweet_url] + '/'
        m = url.match(/https:\/\/twitter.com\/(.+?)\/status\/(.+?)\//)

        user_id = m[1]
        tweet_id = m[2]

        tweet = Tweet.find_by(tweet_id: tweet_id)
        if tweet
            redirect_to action: 'show', id: tweet.id
        else 
            new_tweet = Tweet.new(user: user_id, tweet_id: tweet_id, good: 0)
            new_tweet.save
            redirect_to action: 'show', id: new_tweet.id
        end
    end

    private

    def c
        api_key = ENV['APIKEY']
        api_secret_key = ENV['APISECRETKEY']
        access_token = ENV['ACCESSTOKEN']
        access_token_secret = ENV['ACCESSTOKENSECRET']

        ret = Twitter::REST::Client.new do |config|
            config.consumer_key        = api_key
            config.consumer_secret     = api_secret_key
            config.access_token        = access_token
            config.access_token_secret = access_token_secret
        end

        return ret
    end

    def getTweets
        client = c
        tweets = Tweet.all
        arr = []
        tweets.each do |tweet|
            tweet_object = client.status(tweet.tweet_id)
            arr.push({tweet_object: tweet_object, tweet_model: tweet})
        end
        
        return arr
    end

    def getTweetbyId(id)
        client = c
        tweet = Tweet.find(id)
        tweet_object = client.status(tweet.tweet_id)
        return {tweet_object: tweet_object, tweet_model: tweet}
    end

end
