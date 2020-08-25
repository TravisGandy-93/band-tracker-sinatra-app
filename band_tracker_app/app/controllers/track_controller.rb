class TracksController <  ApplicationController
 get '/tracks' do
    authenticate_user
    @tracks = Track.all.sort_by &:name
    erb :'/tracks/index'
  end



end 