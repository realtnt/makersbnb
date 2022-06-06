class SpacesController < Sinatra::Base
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

  get '/spaces' do
    erb :spaces, locals: {
      spaces: Space.all,
      date_from: '',
      date_to: ''
    }
  end

  post '/spaces' do
    target = ''
    if params[:file]
      tempfile = params[:file][:tempfile]
      filename = params[:file][:filename]
      target = "public/uploads/#{filename}"
      File.open(target, 'wb') { |f| f.write tempfile.read }
    end

    server_path = target[6..]
    space = Space.new(
      title: params[:title], 
      price: params[:price].to_i,
      description: params[:description], 
      date_from: params[:date_from], 
      date_to: params[:date_to],
      image_url: params[:file] ? server_path : "/uploads/default.png",
      user_id: session[:user_id]
    )
    space.save
    redirect '/spaces'
  end

  get '/spaces/new' do
    erb :spaces_new
  end

  get '/spaces/:index' do
    space = Space.find_by(id: params[:index])
    erb :space_details, locals: { space: space }
  end

  post '/spaces/search' do
    date_from = params[:from]
    date_to = params[:to]
    erb :spaces, locals: {
      spaces: Space.all,
      date_from: date_from,
      date_to: date_to
    }
  end

end