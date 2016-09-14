class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks/new' do
    @landmark = Landmark.create(name: params[:landmark][:name])
    if params[:landmark][:year_completed] != nil
        @landmark.year_completed = params[:landmark][:year_completed]
    end
  end


  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end


  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do

    @landmark = Landmark.find_by(id: params[:id])

    erb :'landmarks/edit'
  end


  patch '/landmarks/:id' do
    # binding.pry
    @landmark = Landmark.find_by(id: params[:id])
    @landmark.name = params[:landmark][:name]
    @landmark.year_completed = params[:landmark][:year_completed]
    @landmark.save

    redirect "/landmarks/#{@landmark.id}"

    # binding.pry


  end


end
