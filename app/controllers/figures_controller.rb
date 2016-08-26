class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  get '/figures/new' do
    erb :"figures/new"
  end

  post '/figures' do
    @figure = Figure.create(params["figure"])
    @figure.update(params[:figure])


    if !params["landmark"]["name"].empty?
      @landmark = Landmark.create(params["landmark"])
      @figure.landmarks << @landmark
    end

    if !params["title"]["name"].empty?
      # params.values.any? {|value| value.blank?} #blank checks for nil and empty
      # binding.pry
      @title = Title.create(params["title"])
      @figure.titles << @title
    end

    # @landmarks = Landmark.find_by(:name => params["figure"]["landmark_ids"])
    # @figure.landmarks << @landmarks
    # @figure.title_ids = params["title_ids"]
    @figure.save
    erb :"/figures"
  end

  get '/figures/:id' do
    @figure = Figure.find_by(:id => params[:id])
    erb :"/figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(:id => params[:id])
    erb :"/figures/edit"
  end

  post '/figures/:id' do
    @figure = Figure.find_by(:id => params[:id])

    if !params["figure"]["landmark_ids"].empty?
      @landmark = Landmark.new(:name => params["figure"]["landmark_ids"])
      @figure.landmarks << @landmark
    end

    if !params["figure"]["name"].empty?
      @figure.update(:name => params["figure"]["name"])
    end

    @figure.save
    erb :"/figures/show"
  end


end
