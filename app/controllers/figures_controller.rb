require 'pry'
class FiguresController < ApplicationController

	get '/figures' do
		@figures = Figure.all  
		erb :'figures/index'
	end

	get '/figures/new' do 
		# binding.pry
		erb :'figures/new'
	end 

	post '/figures' do 
		@figure = Figure.create(name: params[:figure][:name])
		@figure.landmark_ids = params[:figure][:landmark_ids]
		@figure.title_ids = params[:figure][:title_ids]

		if params[:title][:name] != nil
			@title = Title.create(name: params[:title][:name])
			@figure.titles << @title
		end

		if params[:landmark][:name]!= nil

			@landmark = Landmark.create(name: params[:landmark][:name])
			@figure.landmarks << @landmark
		end
		@figure.save
	end

	get '/figures/:id' do 
		@figure = Figure.find_by(params[:id])
		erb :'figures/show'
		# binding.pry
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
