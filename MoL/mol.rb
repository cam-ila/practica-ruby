# Implementa una app llamada mol de Rack que responda con un numero al azar
# entre 1 y 42, y que devuelva el status HTTP 200 solo en caso que el numero a
# devolver sea 42, en cualquier otro caso debe retornar un status 404
require 'bundler'

Bundler.require

def random
  @value = Random.rand(1..42).to_s
end

app = Proc.new do |env|
  random
  [@value == '42' ? '200' : '404', {'Content-Type' => 'text/html'}, [@value]]
 end

Rack::Handler::WEBrick.run app
