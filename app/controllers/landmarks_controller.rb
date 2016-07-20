class LandmarksController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/") }

  get '/landmarks' do
    @landmarks = Landmark.all 
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    if !params[:landmark][:name].empty?
      @landmark.name = Landmark.find_or_create_by(name: params[:landmark][:name])
    end
    if !params[:landmark][:year_completed].empty?
      @landmark.year_completed = Landmark.find_or_created_by(year_completed: params[:landmark][:year_completed])
    end
    if @landmark.save
      redirect to "/landmarks/#{@landmark.id}"
    end
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    if !params[:landmark][:name].empty?
      @landmark.name = Landmark.find_or_create_by(name: params[:landmark][:name]).name
    end
    if !params[:landmark][:year_completed].empty?
      @landmark.year_completed = Landmark.find_or_create_by(year_completed: params[:landmark][:year_completed]).year_completed
    end
    @landmark.save
    if @landmark.save
      redirect to "/landmarks/#{@landmark.id}"
    end
  end
end
