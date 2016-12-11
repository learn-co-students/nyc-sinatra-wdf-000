class FiguresController  < ApplicationController

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do

    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title].empty?
    @figure.titles << Title.find_or_create_by(params[:title])
    end
    if !params[:landmark].empty?
    @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    if !params[:landmark].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    if !params[:title].empty?
      @figure.titles << Title.create(params[:title])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end
