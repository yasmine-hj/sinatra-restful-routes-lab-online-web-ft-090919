class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  # code actions here!
  get '/' do
    redirect to('/recipes')
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    recipe = Recipe.create(params)
    redirect to("/recipes/#{recipe.id}")
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :edit
  end

  patch '/recipes/:id' do

    Recipe.update(params[:id], params[:recipe])
    redirect to("/recipes/#{params[:id]}")
  end

  delete '/recipes/:id' do
    Recipe.destroy(params[:id])
    redirect to('/')
  end

end
