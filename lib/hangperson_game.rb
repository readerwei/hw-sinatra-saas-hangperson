class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end
  
  attr_accessor :word, :guesses, :wrong_guesses
  
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end
  
  def guess(origin_letter)
    if origin_letter == NIL or origin_letter.size == 0 or origin_letter =~ /\W/
      raise ArgumentError
    end
    letter = origin_letter.downcase
    if @guesses[letter] or @wrong_guesses[letter]
      return false
    end
    if @word[letter] and !(@guesses[letter])
      @guesses += letter
    else
      @wrong_guesses += letter
    end
  end
  
  def word_with_guesses
    word_w_guesses = @word
    if @guesses.size == 0 
      for i in 0...word_w_guesses.size
        word_w_guesses[i] = '-'
      end
      return word_w_guesses
    end
    
    for i in 0...word_w_guesses.size
      if word_w_guesses[i] =~ /[^#{@guesses}]/
         word_w_guesses[i] = '-'
      end
    end
    return word_w_guesses
  end

  def check_win_or_lose
    if @wrong_guesses.size >= 7 
      return :lose
    end
    if self.word_with_guesses =~ /-/
      return :play
    end
    return :win
  end
end
