require 'dotenv'
Dotenv.load
class TweetsController < ApplicationController
    def index
        @tweets = getTweet
    end

    private

    def getTweet
        api_key = ENV['APIKEY']
        api_secret_key = ENV['APISECRETKEY']
        access_token = ENV['ACCESSTOKEN']
        access_token_secret = ENV['ACCESSTOKENSECRET']

        client = Twitter::REST::Client.new do |config|
            config.consumer_key        = api_key
            config.consumer_secret     = api_secret_key
            config.access_token        = access_token
            config.access_token_secret = access_token_secret
        end

        tweets = Tweet.all
        arr = []
        tweets.each do |tweet|
            tweet_object = client.status(tweet.tweet_id)
            arr.push(tweet_object)
        end
        
        return arr
    end

end
