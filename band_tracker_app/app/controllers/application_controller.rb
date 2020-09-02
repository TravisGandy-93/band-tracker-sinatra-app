require './config/environment'

class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'trackband'
  end

  get "/" do
     if logged_in?
      @user = current_user
      erb :'/users/show'
    else
    erb :hello
    end 
  end

 get '/signup' do
    if logged_in?
      session.clear
      erb :signup
    else
      erb :signup
    end
  end

  post '/signup' do
    @user = User.create(username: params[:username], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      
      redirect '/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/'
    else
      erb :login
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/'
    else
     
      redirect '/login'
    end
  end
  
  get '/logout' do
    session.clear
    redirect '/'
  end
  
  
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

  private

    def authenticate_user
      if !logged_in?
        flash[:message] = "You must be logged in to access this page"
        redirect '/'
      end
    end

end 
