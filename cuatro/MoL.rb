require 'bundler'
Bundler.require

set :azar => rand(0..42) 
get '/' do
	if settings.azar == 42
		 status 200 
	else
		 status 404 
	end
	settings.azar.to_s
end
