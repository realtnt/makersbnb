# This line ensures Ruby files in `lib` can be loaded in your server
# with `require` rather than `require_relative`
$:.unshift File.join(File.dirname(__FILE__), 'lib')

require_relative "./app"

# This line runs your server
run WebApplicationServer
