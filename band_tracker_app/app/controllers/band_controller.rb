class BandsController < ApplicationController
   
 get '/bands' do
    authenticate_user
    @bands = Band.all.sort_by &:name
    erb :'/bands/index'
  end

get '/bands/:slug' do
    authenticate_user
      @band = Band.find_by_slug(params[:slug])
      erb :'/bands/show'
  end
  
  get '/bands/:slug/edit' do
    authenticate_user
    @band = Band.find_by_slug(params[:slug])
    erb :'/bands/edit'
  end

  post '/bands/:slug/edit' do
    @band = Band.find_by_slug(params[:slug])
    if !params[:track_name].empty?
      Track.create(name: params[:track_name], band: @band, user: current_user)

      flash[:message] = "The song is successfully added."
      redirect "/bands/#{@band.slug}"
    else
      flash[:message] = "Enter the song name."
      redirect "/bands/#{@band.slug}/edit"
    end
  end


end 