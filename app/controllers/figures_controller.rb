class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'figures/new'
  end


  post '/figures/new' do

    @new_figure = Figure.create(name: params[:figure][:name])
      if params[:figure][:title_ids] != nil
        title = Title.find_by(id: params[:figure][:title_ids])
        @new_figure.titles << title
      end
      if params[:figure][:landmark_ids] != nil
        landmark = Landmark.find_by(id: params[:figure][:landmark_ids])
        @new_figure.landmarks << landmark
      end
      if params[:title][:name] != nil
        new_title = Title.create(name: params[:title][:name])
        @new_figure.titles << new_title
      end
      if params[:landmark][:name] != nil
        new_landmark = Landmark.create(name: params[:landmark][:name])
        @new_figure.landmarks << new_landmark
      end
      @new_figure.save
  end



  get '/figures' do
    @figure = Figure.all
    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])

    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    erb :'figures/edit'

  end

  patch '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    if params[:figure][:name] != nil
      @figure.name = (params[:figure][:name])
    end
    if params[:landmark][:name] != nil
      landmark = Landmark.find_or_create_by(name: params[:landmark][:name])
      @figure.landmarks.clear
      @figure.landmarks << landmark
    end
    if params[:title][:name] != nil
      title = Title.find_or_create_by(name: params[:title][:name])
      @figure.titles.clear
      @figure.titles << title
    end
    if params[:figure][:title_ids] != nil
      title = Title.find_by(id: params[:figure][:title_ids])
      @figure.titles.clear
      @figure.titles << title
    end
    if params[:figure][:landmark_ids] != nil
      landmark = Landmark.find_by(id: params[:figure][:landmark_ids])
      @figure.landmarks.clear
      @figure.landmarks << landmark
    end
    @figure.save
    redirect "/figures/#{@figure.id}"

  end










end
