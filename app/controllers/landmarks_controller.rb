class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    Landmark.create(params[:landmark])
  end

  get '/landmarks' do
    erb :'landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by(params[:id])
    @landmark.update(params[:landmark])
    redirect "/landmarks/#{@landmark.id}"
  end


  # patch '/figures/:id' do
  #   @figure = Figure.find_by(params[:id])
  #   @figure.update(params[:figure])
  #   @figure.landmarks = params[:figure][:landmark_ids].map{|id| Landmark.find(id)} if params[:figure][:landmark_ids]
  #   @figure.titles = params[:figure][:title_ids].map{|id| Title.find(id)} if params[:figure][:title_ids]
  #   if !params[:title][:name].empty?
  #     @figure.titles << Title.create(name: params[:title][:name])
  #   end
  #   if !params[:landmark][:name].empty?
  #     @figure.landmarks << Title.create(name: params[:landmark][:name])
  #   end
  #   @figure.save
  # end


end
