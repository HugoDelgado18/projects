class AffirmationsController < ApplicationController
    def index 
        require 'net/http'
        require 'json'

        @url = 'https://zenquotes.io/api/random'
        @uri = URI(@url)
        @response = Net::HTTP.get(@uri)
        @affirmation = JSON.parse(@response)
    end 
end