 class BandsController <  ApplicationController
 get '/bands' do
    authenticate_user
    @bands = Band.all.sort_by &:name
    erb :'/bands/index'
  end



end 