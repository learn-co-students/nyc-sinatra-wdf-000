class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  post '/landmarks' do
    landmark = Landmark.create(params[:landmark])
    if !params[:figure][:name].empty?
      figure = Figure.create(params[:landmark])
      landmark.figure == figure
      landmark.save
    end 
  end

  get '/landmarks/new' do
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  post '/landmarks/:id' do
    landmark = Landmark.find(params[:id])
    landmark.update(params[:landmark])
    redirect to "/landmarks/#{landmark.id}"
  end
  
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    @figures = Figure.all
    @titles = Title.all
    erb :'landmarks/edit'
  end
end
