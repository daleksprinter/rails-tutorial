require 'dotenv'
Dotenv.load
class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all
        getTweet


    end

    private

    def getTweet
        api_key = ENV['APIKEY']
        api_secret_key = ENV['APISECRETKEY']
        access_token = ENV['ACCESSTOKEN']
        access_token_secret = ENV['ACCESSTOKENSECRET']

        @client = Twitter::REST::Client.new do |config|
            config.consumer_key        = api_key
            config.consumer_secret     = api_secret_key
            config.access_token        = access_token
            config.access_token_secret = access_token_secret
        end

        tweet_object = @client.status("1100643999193260032")
        p tweet_object.full_text
    end

end
