class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    landmark = Landmark.create(params[:landmark])
    # binding.pry
    redirect '/landmarks'
  end

end
