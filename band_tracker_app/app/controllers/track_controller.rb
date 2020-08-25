class TracksController <  ApplicationController
 
 get '/tracks' do
    authenticate_user
    @tracks = Track.all.sort_by &:name
    erb :'/tracks/index'
  end
  
   get '/tracks/new' do
    authenticate_user
    @bands = Band.all
    erb :'/tracks/new'
  end

  post '/tracks/new' do
    authenticate_user
    params[:track][:band] = params[:track][:selected_band] if !params[:track][:selected_band].empty?
    if !params[:track][:name].empty? && !params[:track][:band].empty?
      band = Band.find_or_create_by(name: params[:track][:band])
      @track = Track.create(name: params[:track][:name], band: band, user_id: current_user.id)

     
      redirect "/tracks/#{@track.slug}"
    else
      flash[:message] = "Both fields must be filled in. Please complete the form."
      redirect '/tracks/new'
    end
  end
  
  get '/tracks/:slug' do
    authenticate_user
    @track = Track.find_by_slug(params[:slug])
    if @track
      erb :'/tracks/show'
    else
      flash[:message] = "This track does not exist"
      redirect '/tracks'
    end
  end
  

end 