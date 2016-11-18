require 'bundler'
Bundler.require

helpers do
 def random(a,b) 
   Random.rand(a..b).to_s
 end
end
get '/' do
  erb :index
end

get '/mcm/:a/:b' do
  a = params['a']
  b = params['b']
  
   a.to_i.lcm(b.to_i).to_s
  
end

get '/mcd/:a/:b' do
  a = params['a']
  b = params['b']
  
   a.to_i.gcd(b.to_i).to_s
  
end

get '/sum/*' do
  params['splat'].first.split('/').inject(0) {|a, b| a= b.to_i + a }.to_s
  
end

get '/even/*' do
  params['splat'].first.split('/').inject(0) { |c, d| c = d.to_i.even? ? c+1 : c }.to_s
 end

post '/random' do
  random(0,1000)
end

post '/random/:lower/:upper' do
 random(params['lower'].to_i, params['upper'].to_i)
end


