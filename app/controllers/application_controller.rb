class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  # index action
  get '/' do
    @recipes = Recipe.all
    erb :index
  end

  # create action 1: make new recipe
  get '/recipes/new' do
    erb :new
  end

  # create action 2: show new recipe
  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
    erb :show
  end

  # show action 1: show any recipe based on id
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  # edit action 1: load edit form
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  # edit action 2: update article, show it
  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end

  # delete action: delete entry from db, redirect to index page
  delete '/recipes/:id' do
    Recipe.destroy(params[:id])
    @recipes = Recipe.all
    erb :index
  end

end
