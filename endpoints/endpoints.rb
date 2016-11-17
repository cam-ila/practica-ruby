# 5. Utilizando Sinatra, desarrollá una aplicación web que tenga los siguientes *endpoints*:
# * `GET /` lista todos los endpoints disponibles (sirve a modo de documentación)
# * `GET /mcm/:a/:b` calcula y presenta el mínimo común múltiplo de los valores numéricos `:a` y `:b`
# * `GET /mcd/:a/:b` calcula y presenta el máximo común divisor de los valores numéricos `:a` y `:b`
# * `GET /sum/*` calcula la sumatoria de todos los valores numéricos recibidos como parámetro en el *splat*
# * `GET /even/*` presenta la cantidad de números pares que hay entre los
# valores numéricos recibidos como parámetro en el *splat*
# * `POST /random` presenta un número al azar
# * `POST /random/:lower/:upper` presenta un número al azar entre `:lower` y `:upper` (dos valores numéricos)
require 'bundler'
Bundler.require

get '/' do
'
GET /mcm/:a/:b calcula y presenta el mínimo común múltiplo de los valores numéricos :a y :b 
GET /mcd/:a/:b calcula y presenta el máximo común divisor de los valores numéricos :a y :b
GET /sum/* calcula la sumatoria de todos los valores numéricos recibidos como parámetro en el splat
GET /even/* presenta la cantidad de números pares que hay entre los valores numéricos recibidos como parámetro en el splat
POST /random presenta un número al azar
POST /random/:lower/:upper presenta un número al azar entre :lower y :upper (dos valores numéricos)
'
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
  s = params['splat']
  s.first.split('/').inject(0) {|a, b| a= b.to_i + a }.to_s
  
end

get '/even/*' do
  s = params['splat']
  s.first.split('/').inject(0) { |c, d| c = d.to_i.even? ? c+1 : c }.to_s
 end

post '/random' do
	Random.rand(0..1000).to_s
# Para probarlo
# curl -d '' -X POST http://localhost:4567/random/
end

post '/random/:lower/:upper' do
#POST /random/:lower/:upper presenta un número al azar entre :lower y :upper (dos valores numéricos)
 a = params['lower'].to_i
 b = params['upper'].to_i
 Random.rand(a..b).to_s
end


