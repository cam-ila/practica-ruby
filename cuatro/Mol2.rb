require 'bundler'
Bundler.require
set(:azar) { |value| condition { rand(0..42) == value } }

get '/', :azar => 42 do
  status 200
end

get '/' do
	status 404
end
