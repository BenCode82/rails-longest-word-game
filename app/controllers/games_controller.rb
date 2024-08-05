require 'json'


class GamesController < ApplicationController
  # LETTERS = []
  def new
    # L’action new servira à afficher une nouvelle grille aléatoire et un formulaire.

    @letters = []
    i = 0
    while i < 5
      i += 1
      @letters << "aeiouy".upcase!.split("").shuffle.first
      @letters << "bcdfghjklmnpqrstvwxyz".upcase!.split("").shuffle.first
    end


  end

  def score
    # Le formulaire sera envoyé (avec POST) à l’action score.
    @letters = params[:tirage]
    @user_letters = params[:user_input]
    @word_valid = false

    @user_letters.split("") do |letter|
      if (@letters.include?(letter))
        @word_valid = true
        
      else
        @word_valid = false
        return
      end
    end

  end
end

# start_time = Time.now
# attempt = gets.chomp
# end_time = Time.now
