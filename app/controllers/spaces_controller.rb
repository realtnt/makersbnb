require 'require_all'
require_all 'app/helpers'

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
      spaces: Space.all
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

    dates = DatesChecker.new(
      date_from: params[:date_from],
      date_to: params[:date_to]
    )

    if dates.check
      server_path = target[6..] # gets rid of public from the path
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
    else
      redirect '/failure'
    end
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
    if date_from == '' || date_to == ''
      redirect '/spaces'
    else
      erb :spaces, locals: {
        spaces: Space.where('date_from < ?', date_to).and(Space.where('date_to > ?', date_from))
      }
    end
  end

end
