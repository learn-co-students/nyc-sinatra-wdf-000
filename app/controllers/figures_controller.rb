class FiguresController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/") }

  get '/figures' do
    @figures = Figure.all 
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:figure][:title])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:figure][:landmark])
    end
    if @song.save
      redirect to "/figures/#{@figure.id}"
    end
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:figure][:title])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:figure][:landmark])
    end
    if @song.save
      redirect to "/figures/#{@figure.id}"
    end  
   end 



end