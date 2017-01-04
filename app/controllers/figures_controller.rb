class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    new_figure = Figure.new(params[:figure])
    if !params[:title][:name].empty?
      title = Title.create(name: params[:title][:name])
      new_figure.titles << title
    end
    if !params[:landmark][:name].empty?
      landmark = Landmark.create(name: params[:landmark][:name])
      new_figure.landmarks << landmark
    end
    new_figure.save
  end

  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    @figure.update(params[:figure])
    @figure.landmarks = params[:figure][:landmark_ids].map{|id| Landmark.find(id)} if params[:figure][:landmark_ids]
    @figure.titles = params[:figure][:title_ids].map{|id| Title.find(id)} if params[:figure][:title_ids]
    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Title.create(name: params[:landmark][:name])
    end
    @figure.save
  end




end
