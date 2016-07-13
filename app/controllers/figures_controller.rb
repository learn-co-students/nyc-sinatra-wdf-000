class FiguresController < ApplicationController
	set :views, Proc.new { File.join(root, "../views/figure/") }

	get '/figures/new' do 
		erb :new
	end

	post '/figures' do 
		figure = Figure.new(params[:figure])
		
		if !params[:title][:name].empty?
			figure.titles << Title.create(name: params[:title][:name])
		elsif !params[:landmark][:name].empty?
			figure.landmarks << Landmark.create(name: params[:landmark][:name])
		end

		if figure.save
			redirect "/figures/#{figure.id}"
		else
			puts "failed to create a figure"
		end	
	end

	get '/figures' do 
		@figures = Figure.all
		erb :index
	end

	get '/figures/:id' do 
		@figure = Figure.find(params[:id])
		erb :show
	end

	get '/figures/:id/edit' do 
		@figure = Figure.find(params[:id])
		erb :edit
	end

	post '/figures/:id' do

		@figure = Figure.find(params[:id])
		@figure.update(params[:figure])

		if !params[:landmark][:name].empty?
			@figure.landmarks << Landmark.create(name: params[:landmark][:name])
		end

		redirect "/figures/#{@figure.id}"
	end
end
