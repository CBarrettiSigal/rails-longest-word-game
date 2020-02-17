class GamesController < ApplicationController
  def new
    @letters = []
    alphabet = ('A'..'Z').to_a
    10.times do
      @letters << alphabet.sample
    end
  end

  def score
    @word = params[:word]
    @message = "Placeholder"
    @letters = params[:letters].split(' ')
    params[:word].split("").each do |l|
      if @letters.include?(l)
      else
        return @message = "Sorry, your word #{@word} is not inside #{@letters}"
      end
    end
  end

  def english_word?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    response = open(url)
    json = JSON.parse(response.read)
    json["found"]
  end

  if english_word?(@word)
          return @message = "Your word is an English word"
end
