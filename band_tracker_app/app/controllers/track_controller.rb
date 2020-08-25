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
      redirect '/tracks/new'
    end
  end
  
  get '/tracks/:slug' do
    authenticate_user
    @track = Track.find_by_slug(params[:slug])
    if @track
      erb :'/tracks/show'
    else
      redirect '/tracks'
    end
  end
  
  get '/tracks/:slug/edit' do
    authenticate_user
    @track = Track.find_by_slug(params[:slug]) 
    if @track && @track.user == current_user
      erb :'/tracks/edit'
    elsif @track && !@track.user == current_user
     
      redirect to "/tracks/#{@track.slug}"
    else
     
      redirect to "/tracks"
    end
  end

  patch '/tracks/:slug/edit' do
    authenticate_user
    @track = Track.find_by_slug(params[:slug])
    if !params[:track][:band].empty? && !params[:track][:name].empty?
      if band ||= Band.find_by(name: params[:track][:band])
        @track.update(name: params[:track][:name], band: band)
      else band = Band.create(name: params[:track][:band], user_id: current_user.id)
        @track.update(name: params[:track][:name], band: band)
      end
      
      redirect to "/tracks/#{@track.slug}"
    else
      
      redirect to "/tracks/#{@track.slug}/edit"
    end
  end

  get '/tracks/:slug/delete' do
    authenticate_user
    @track = Track.find_by_slug(params[:slug])
    @band = @track.band
    if @track.user == current_user
      @track.destroy

     
      redirect "/bands/#{@band.slug}"
    else
      
      redirect to "/tracks/#{@track.slug}"
    end
  end
end
  
