class FiguresController < ApplicationController

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    unless params[:title][:name].empty?
      title = Title.create(params[:title])
      title.save
      @figure.titles << title
    end
    unless params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark])
      landmark.save
      @figure.landmarks << landmark
    end
    @figure.save
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    unless params[:title][:name].empty?
      title = Title.create(params[:title])
      title.save
      @figure.titles << title
    end
    unless params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark])
      landmark.save
      @figure.landmarks << landmark
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

end
