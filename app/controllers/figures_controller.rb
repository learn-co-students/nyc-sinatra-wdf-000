class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  post '/figures' do
    figure = Figure.find_or_create_by(name: params[:figure][:name])

    if !params[:landmark][:name].empty?
      landmark = Landmark.find_or_create_by(name: params[:landmark][:name])
      figure.landmarks << landmark
    end

    if !params[:title][:name].empty?
      title = Title.find_or_create_by(params[:title])
      figure.titles << title
    end

    redirect "/figures/#{figure.id}"
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(params[:figure])

    if !params[:landmark][:name].empty?
      landmark = Landmark.find_or_create_by(params[:landmark])
      figure.landmarks << landmark
    end

    redirect "/figures/#{figure.id}"    
  end 
end
