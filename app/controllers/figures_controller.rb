class FiguresController < ApplicationController

  use Rack::MethodOverride

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

    get '/figures/new' do
      erb :'/figures/new'
    end

    post '/figures' do
      figure = Figure.find_or_create_by(:name => params[:figure][:name])
      if !params[:figure][:title_ids].nil?
        params[:figure][:title_ids].each do |id|
          title = Title.find(id)
          figure.figure_titles.build(:title => title)
        end
      end
      if params[:title][:name] != ""
        title = Title.find_or_create_by(:name => params[:title][:name])
        figure.figure_titles.build(:title => title)
      end
      figure.save

      if !params[:figure][:landmark_ids].nil?
        params[:figure][:landmark_ids].each do |id|
          landmark = Landmark.find(id)
          landmark.figure = figure
          landmark.save
        end
      end
      if params[:landmark][:name] != ""
        landmark = Landmark.find_or_create_by(:name => params[:landmark][:name])
        landmark.figure = figure
        landmark.save
      end
      figure.save
      redirect "/figures/#{figure.id}"
    end

    get '/figures/:id' do
      @figure = Figure.find(params[:id])
      erb :'/figures/show'
    end

    get "/figures/:id/edit" do
      @figure = Figure.find(params[:id])
      erb :'/figures/edit'
    end

    patch "/figures/:id" do
      figure = Figure.update(params[:id], :name => params[:figure][:name])
      if !params[:figure][:landmark_ids].nil?
        params[:figure][:landmark_ids].each do |id|
          landmark = Landmark.find(id)
          landmark.figure = figure
          landmark.save
        end
      end
      if params[:landmark][:name] != ""
        landmark = Landmark.find_or_create_by(:name => params[:landmark][:name], :year_completed => params[:landmark][:year_completed])
        landmark.figure = figure
        landmark.save
      end

        # binding.pry
      new_title_ids = params[:figure][:title_ids]
      if !new_title_ids.nil?
          new_title_ids.each do |id|
          assoc = FigureTitle.where(:figure_id => figure.id, :title_id => id)
          if assoc.empty?  #only build associations if they are not already there
            title = Title.find(id)
            figure.figure_titles.build(:title => title)
          end
        end
      end

      #remove unneeded associations:
      assoc_old = FigureTitle.where(:figure_id => figure.id)
      assoc_old.each do |old_assoc|
        if !new_title_ids.include?(old_assoc.title_id)
          FigureTitle.destroy(old_assoc.id)
        end
      end

      if params[:title][:name] != ""
        title = Title.find_or_create_by(:name => params[:title][:name])
        figure.figure_titles.build(:title => title)
      end
      figure.save
      # binding.pry
      redirect "/figures/#{figure.id}"
    end

end
