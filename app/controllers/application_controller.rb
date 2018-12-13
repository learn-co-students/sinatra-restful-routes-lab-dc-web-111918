require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #index
  get "/recipes" do
    @recipes = Recipe.all
    erb :index
  end

  #new
  get "/recipes/new" do
    erb :new
  end

  #create
  post "/recipes" do
    @recipe = Recipe.create(params)
    # binding.pry
    redirect "/recipes/#{@recipe.id}"
  end

  #show
  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  #edit
  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  #update
  patch "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{@recipe.id}"
  end

  #delete
  delete "/recipes/:id" do
    Recipe.destroy(params[:id])
    redirect "/recipes"
  end

end
