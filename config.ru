require 'rack'
require_relative 'app/application_controller.rb'

use Rack::Static, urls: ['/public']
run ApplicationController.new
# Rack::Handler::WEBrick.run(
#   ApplicationController.new,
#   Port: 9000
# )

# run lambda { |env|
#   [
#     200,
#     {
#       'Content-Type'  => 'text/html',
#       'Cache-Control' => 'public, max-age=86400'
#     },
#     [erb('index')]
#   ]
# }

