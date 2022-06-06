class RequestsController < Sinatra::Base
  configure do
    set :session_secret, ENV['SESSION_KEY'] || 'top-secret'
    set :views, "app/views"
    set :public_dir, "public"
  end
  
  configure :development do
    register Sinatra::Reloader
  end
  
  configure :test do
  end
  
  get '/spaces/request/:index' do
    space = Space.find_by(id: params[:index])
    erb :space_request, locals: { space: space }
  end

  get '/requests' do
    requests = Request.all
    spaces = Space.all.select { |space| space.user_id == session[:user_id] }
    space_ids = []
    spaces.each do |space|
      space_ids.push(space.id)
    end

    erb :requests, locals: { 
      requests: requests,
      spaces: spaces,
      space_ids: space_ids
    }
  end

  post '/requests' do
    request = Request.new(
      date: params[:date],
      user_id: session[:user_id],
      space_id: params[:space_id]
    )
    request.save
    redirect '/requests'
  end

end
