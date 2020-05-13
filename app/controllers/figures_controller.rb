class FiguresController < ApplicationController
  # add controller methods

  get '/figures/new' do 
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'figures/new'
  end

  get '/figures' do
    @figures = Figure.all 
    erb :'figures/index'
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
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    
    erb :'figures/edit'
  end

  patch '/figures/:id' do 
    @figure = Figure.update(params[:id], params[:figure])
    if !params[:title][:name].empty?
      @title = Title.create(params[:title])
      @figure.titles << @title
    end

    if !params[:landmark][:name].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end
    @figure.save
    redirect "figures/#{@figure.id}"

  end


end
