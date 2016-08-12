class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :'/landmarks/index' 
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    erb :'/landmarks/show'
  end
  
  patch '/landmarks/:id' do
    # binding.pry
    @landmark = Landmark.find_by(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save
    redirect("/landmarks/#{@landmarks.id}")
  end
end



