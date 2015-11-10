require 'sinatra/base'
require 'sinatra/flash'
require './lib/hangperson_game.rb'

class HangpersonApp < Sinatra::Base

  
#  enable :sessions
#  register Sinatra::Flash
  
#  before do
#    @game = session[:game] || HangpersonGame.new('')
#  end
  
#  after do
#    session[:game] = @game
#  end
  
  def initialize(new_word)
    @word = new_word
    @guesses = ''
    @wrong_guesses = ''
  end
  
#  def word
#    @word
#  end
  
  attr_accessor :word
  #attr_accessor :guesses
  #attr_accessor :wrong_guesses
  
  # These two routes are good examples of Sinatra syntax
  # to help you with the rest of the assignment

end

testg = HangpersonGame.new('glorp')
puts testg.word