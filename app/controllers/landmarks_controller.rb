class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :"landmarks/new"
  end

  post '/landmarks' do
    @landmark = Landmark.create(params["landmark"])
    redirect :"/landmarks/#{@landmark.id}"
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find_by(:id => params[:id])
    erb :"/landmarks/show"
  end

  get "/landmarks" do
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find_by(:id => params[:id])
    erb :"/landmarks/edit"
  end


  post "/landmarks/:id/edit" do
    @landmark = Landmark.find_by(:id => params[:id])
    if !params["landmark"]["name"].empty?
      @landmark.update(:name => params["landmark"]["name"])
    end

    if !params["landmark"]["year_completed"].empty?
      @landmark.update(:year_completed => params["landmark"]["year_completed"])
    end

    redirect :"/landmarks/#{@landmark.id}"
  end



end
