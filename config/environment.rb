require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'require_all'
require_all 'app'
require 'bundler'

Bundler.require

# if ActiveRecord::Base.connection.migration_context.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

set :database_file, 'database.yml'

use Rack::MethodOverride
