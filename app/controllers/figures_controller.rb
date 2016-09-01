class FiguresController < ApplicationController

	get '/figures/new' do
		@titles = Title.all
		@landmarks = Landmark.all
		erb :'/figures/new'
	end

	post '/figures' do
		@figure = Figure.create(params[:figure])

		if params[:figure][:title_ids] != nil && params[:title][:name] != ""
			@title = Title.create(params[:title])
			params[:figure][:title_ids] << @title.id
			@figure.title_ids = params[:figure][:title_ids]
		elsif params[:figure][:title_ids] != nil
			@figure.title_ids = params[:figure][:title_ids]
		elsif params[:title][:name] != ""
			@title = Title.create(params[:title])
			@figure.titles << @title
		end

		if params[:figure][:landmark_ids] != nil && params[:landmark][:name] != ""
			@landmark = Landmark.create(params[:landmark])
			params[:figure][:landmark_ids] << @landmark.id
			@figure.landmark_ids = params[:figure][:landmark_ids]
		elsif params[:figure][:landmark_ids] != nil
			@figure.landmark_ids = params[:figure][:landmark_ids]
		elsif params[:landmark][:name] != ""
			@landmark = Landmark.create(params[:landmark])
			@figure.landmarks << @landmark
		end

		@figure.save
		redirect "/figures/#{@figure.id}"
	end

	get '/figures' do
		@figures = Figure.all
		erb :'/figures/index'
	end

	get '/figures/:id' do
		@figure = Figure.find_by_id(params[:id])
		@titles = @figure.titles
		@landmarks = @figure.landmarks
		erb :'/figures/show'
	end

	get '/figures/:id/edit' do 
		@figure = Figure.find_by_id(params[:id])
		@titles = Title.all
		@landmarks = Landmark.all
		erb :'/figures/edit'
	end

	post '/figures/:id' do
		@figure = Figure.find_by_id(params[:id])
		@figure.update(params[:figure])

		if params[:figure][:title_ids] != nil && params[:title][:name] != ""
			@title = Title.create(params[:title])
			params[:figure][:title_ids] << @title.id
			@figure.title_ids = params[:figure][:title_ids]
		elsif params[:figure][:title_ids] != nil
			@figure.title_ids = params[:figure][:title_ids]
		elsif params[:title][:name] != ""
			@title = Title.create(params[:title])
			@figure.titles << @title
		end

		if params[:figure][:landmark_ids] != nil && params[:landmark][:name] != ""
			@landmark = Landmark.create(params[:landmark])
			params[:figure][:landmark_ids] << @landmark.id
			@figure.landmark_ids = params[:figure][:landmark_ids]
		elsif params[:figure][:landmark_ids] != nil
			@figure.landmark_ids = params[:figure][:landmark_ids]
		elsif params[:landmark][:name] != ""
			@landmark = Landmark.create(params[:landmark])
			@figure.landmarks << @landmark
		end

		@figure.save
		redirect "/figures/#{@figure.id}"
	end

end