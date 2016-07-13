class LandmarksController < ApplicationController
	set :views, Proc.new { File.join(root, "../views/landmarks/") }

	get '/landmarks/new' do 
		erb :new
	end
	post '/landmarks' do 
		landmark = Landmark.create(params[:landmark])
		redirect '/landmarks'
	end
	get '/landmarks' do

		erb :index
	end
	get '/landmarks/:id' do 
		@landmark = Landmark.find(params[:id])
		erb :show
	end
	get '/landmarks/:id/edit' do 
		@landmark = Landmark.find(params[:id])
		erb :edit
	end
	post '/landmarks/:id' do 
		@landmark = Landmark.find(params[:id])
		@landmark.update(params[:landmark])
		erb :show
	end
end
