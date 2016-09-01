class FiguresController < ApplicationController

	get '/figures' do
		@figures = Figure.all
		erb :'figures/index'
	end

	get '/figures/new' do
		@titles = Title.all
		@landmarks = Landmark.all
		erb :'figures/new'
	end

	post '/figures' do
		@figure = Figure.create(params[:figure])

		if !params[:title][:name].empty?
			@title = Title.create(params[:title])
			@figure.titles << @title
		end

		if !params[:landmark][:name].empty?
			@landmark = Landmark.create(params[:landmark])
			@figure.landmarks << @landmark
		end

		@figure.save
		redirect "/figures/#{@figure.id}"
	end

	get '/figures/:id' do
		@figure = Figure.find_by_id(params[:id])
		@titles = @figure.titles
		@landmarks = @figure.landmarks
		erb :'figures/show'
	end

	get '/figures/:id/edit' do 
		@figure = Figure.find_by_id(params[:id])
		@titles = Title.all
		@landmarks = Landmark.all
		erb :'figures/edit'
	end

	post '/figures/:id' do
		@figure = Figure.find_by_id(params[:id])
		@figure.update(params[:figure])
		
		if !params[:title][:name].empty?
			@title = Title.create(params[:title])
			@figure.titles << @title
		end

		if !params[:landmark][:name].empty?
			@landmark = Landmark.create(params[:landmark])
			@figure.landmarks << @landmark
		end

		@figure.save
		redirect "/figures/#{@figure.id}"
	end

end