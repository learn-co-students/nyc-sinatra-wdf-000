class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])
    if params[:figure][:title_ids] != nil
      title = Title.find_by(id: params[:figure][:title_ids])
      @figure.titles << title
    end
    if params[:figure][:landmark_ids]
      landmark = Landmark.find_by(id: params[:figure][:landmark_ids])
      @figure.landmarks << landmark
    end


      if params[:title][:name] != nil
        # binding.pry
        new_title = Title.create(name: params[:title][:name])
        @figure.titles << new_title
      end

      if params[:landmark][:name] != nil
        new_landmark = Landmark.create(name: params[:landmark][:name])
        @figure.landmarks << new_landmark
      end

    # binding.pry
    # @figure.save
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/show'
  end

  get "/figures/:id" do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show_individual'
  end

  get "/figures/:id/edit" do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/edit_individual'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.name = params[:figure][:name]

    if params[:figure][:title_ids] != nil
      title = Title.find_by(id: params[:figure][:title_ids])
      @figure.titles << title
    end
    if params[:figure][:landmark_ids]
      landmark = Landmark.find_by(id: params[:figure][:landmark_ids])
      @figure.landmarks << landmark
    end
      if params[:title][:name] != nil
        new_title = Title.create(name: params[:title][:name])
        @figure.titles << new_title
      end
      if params[:landmark][:name] != nil
        new_landmark = Landmark.create(name: params[:landmark][:name])
        @figure.landmarks << new_landmark
      end
      @figure.save
    redirect to "/figures/#{@figure.id}"
  end

end
