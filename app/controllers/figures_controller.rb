class FiguresController < ApplicationController

  get '/figures' do
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end
  
  get '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(params[:id])
    erb :'/figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])    
    if !params[:title][:name].empty?
      @figure.titles << Title.find_or_create_by(params[:title]) 
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.find_or_create_by(params[:landmark]) 
    end
    redirect '/figures'
  end


  patch '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    @figure.update(params[:figure])
    @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    @figure.save
    redirect("/figures/#{@figures.id}")
  end
end
