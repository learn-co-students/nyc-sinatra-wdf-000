class FiguresController < ApplicationController
    get '/figures' do
      erb :'figures/index'
    end

    get '/figures/new' do
      erb :'figures/new'
    end

    get '/figures/:id' do
      @figure = Figure.find_by(id:params[:id])
      erb :'figures/show'
    end

    get '/figures/:id/edit' do
      @figure = Figure.find_by(id:params[:id])
      erb :'figures/edit'
    end
    
    post '/figures/:id' do
      @figure = Figure.find_by(id:params[:id])
      @figure.update(params[:figure])
      @figure.landmarks << Landmark.create(params[:landmark]) unless params[:landmark].empty?
      @figure.titles << Title.create(params[:title]) unless params[:title].empty?
      @figure.save
      redirect "/figures/#{@figure.id}"
    end

    post '/figures' do
      @figure = Figure.create(params[:figure])
      @figure.landmarks << Landmark.create(params[:landmark]) unless params[:landmark].empty?
      @figure.titles << Title.create(params[:title]) unless params[:title].empty?
      @figure.save
      redirect '/figures'
    end
end
