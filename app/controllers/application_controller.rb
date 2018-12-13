require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
  	@recipes = Recipe.all
  	erb :index
  end

  get '/recipes/new' do
  	@recipes = Recipe.new
  	erb :new
  end

  post '/recipes' do
  	name = params[:name]
  	ingredients = params[:ingredients]
  	cook_time = params[:cook_time]
  	@recipe = Recipe.create(name: name, ingredients: ingredients, cook_time: cook_time)
    # binding.pry
    redirect "/recipes/#{@recipe.id}"
  end


end
