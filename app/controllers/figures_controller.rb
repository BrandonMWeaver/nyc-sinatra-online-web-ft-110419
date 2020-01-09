class FiguresController < ApplicationController
  
  get "/figures" do
    @figures = Figure.all
    erb :"/figures/index"
  end
  
  post "/figures" do
    figure = Figure.create(params[:figure])
    figure.titles << Title.find_or_create_by(params[:title])
    figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    figure.save
    redirect "/figures/#{figure.id}"
  end
  
  get "/figures/new" do
    erb :"/figures/new"
  end
  
  get "/figures/:id" do
    erb :"/figures/show"
  end
  
end
