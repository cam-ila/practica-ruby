
# TTPS opción Ruby

# Práctica 4

En esta práctica veremos ejercicios para comprender el funcionamiento de las gemas en Ruby, el uso de Bundler y
comenzaremos a utilizar la herramienta para desarrollo de aplicaciones web en Ruby [Sinatra](http://sinatrarb.com/).

## Gemas y Bundler

1. ¿Qué es una gema? ¿Para qué sirve? ¿Qué estructura tienen?

> - Las gemas vendrian a ser bibliotecas. 

> - RubyGems es la herramienta para distribuir codigo. 

> - Por lo general, las gemas tienen enlaces hacia la documentacion e informacion
  sobre los desarrolladores.


> Cada gema tiene un nombre, una version y plataforma.

> - Una gema contiene los siguientes componentes
>    -  codigo (incluyendo test y soporte )
>    -  Documentacion
>    -  Gemspec

> - Cada gema sigue una estructura estandar de organizacion del codigo.
>     - El directorio lib contiene el codigo de la gema
>     - El directorio test o spec contiene test.
>     - Rakefile 
>     - un archivo ejecutable en el directorio bin
>     - La documentacion generalmente es incluida en el README

>    Gemspec contiene informacio sobre la gema. los archivos de la gema, la
>    informacion del test, plataforma, numero de version y toda la informacion
>    sobre el creador.

>    http://guides.rubygems.org/what-is-a-gem/

2. ¿Cuáles son las principales diferencias entre el comando `gem` y Bundler? ¿Hacen lo mismo?

>   bundler provides a consistent environment for Ruby projects by tracking
>   and installing the exact gems and versions that are needed. 

>   bundler is an exit from dependency hell, and ensures that the gems you need
>   are present in development, staging, and production. 

>   starting work on a project is as simple as bundle install.

>   -  **gem** es para instalar gemas desde el manejador de gemas RubyGems. A
>      su vez Bundler utiliza gem,  para instalar las gemas que necesitas, y
>      tenerlas en una version especificas, vos podes con gem instalar muchas
>      versiones de una gema, pero con bundler en tu proyecto elegis cual
>      queres usar y toda la bola.

3. ¿Dónde instalan las gemas los comandos `gem` y `bundle`?

   > Tip: `gem which` y `bundle show`.

   >  ➜  seis  gem which colorputs
   >  /home/camila/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/colorputs-0.2.3/lib/colorputs.rb
  
   >  ➜  seis  bundle show colorputs
   >  /home/camila/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/colorputs-0.2.3
  
> ##  Preguntar  

4. ¿Para qué sirve el comando `gem server`? ¿Qué información podés obtener al
usarlo?

     > The server command starts up a web server that hosts the RDoc for your
     > installed gems and can operate as a server for installation of gems on
     > other machines.


5. Investigá un poco sobre *Semantic Versioning* (o *SemVer*). ¿Qué finalidad tiene? ¿Cómo se compone una versión? ¿Ante
   qué situaciones debería cambiarse cada una de sus partes?

6. Creá un proyecto para probar el uso de Bundler:
  1. Inicializá un proyecto nuevo en un directorio vacío con el comando `bundle
  init`
  2. Modificá el archivo `Gemfile` del proyecto y agregá la gema `colorputs`
  3. Creá el archivo `prueba.rb` y agregale el siguiente contenido:

     ```ruby
     require 'colorputs'
     puts "Hola!", :rainbow_bl
     ```

  4. Ejecutá el archivo anterior de las siguientes maneras:
    * `ruby prueba.rb`
    * `bundle exec ruby prueba.rb`
  5. Ahora utilizá el comando `bundle install` para instalar las dependencias del proyecto
  6. Volvé a ejecutar el archivo de las dos maneras enunciadas en el paso **4**.
  7. Creá un nuevo archivo `prueba_dos.rb` con el siguiente contenido:

     ```ruby
     Bundler.require
     puts "Chau!", :red
     ```

   8. Ahora ejecutá este nuevo archivo:
     * `ruby prueba.rb`
     * `bundle exec prueba.rb`

> Si ejecuta 'ruby prueba_dos.rb' tira el error que no esta inicializa la
> constante Bundler, en cambio si ejecuto 'bundle exec ruby prueba_dos.rb' is
> work 

7. Utilizando el proyecto creado en el punto anterior como referencia, contestá las siguientes preguntas:
  1. ¿Qué finalidad tiene el archivo `Gemfile`?

>   El archivo gemfile sirve para declarar las gemas a utilizar.
>   "Gemfile - A format for describing gem dependencies for Ruby programs"

>    * [manual gemfile](http://bundler.io/man/gemfile.5.html)

  2. ¿Para qué sirve la directiva `source` del `Gemfile`? ¿Cuántas pueden haber en un mismo archivo?

> Sirve para especificar una fuente especifica de donde se debe descargar
> las gemas.
       
>   - Se pueden agregar multiples fuente, siempre y cuando sean repositorio
>     de RubyGems valido.

>   - Se puede usando bloques
>      
>      /**********Preguntar*********/

  3. Acorde a cómo agregaste la gema `colorputs`, ¿qué versión se instaló de la
  misma? Si mañana se publicara la versión `7.3.2`, ¿esta se instalaría en tu
  proyecto? ¿Por qué? ¿Cómo podrías limitar esto y hacer que sólo se instalen
  *releases* de la gema en las que no cambie la *versión mayor* de la misma?

>     - Si se publica una nueva version creo que no se instalaria en el proyecto
>     - Si haces git add Gemfile Gemfile.lock. -> esto agrega el archivo
>       Gemfile.lock al repositorio. 
>       Y asegura que otros desarroladors al trabajar con tu aplicacion
>       utilicen la misma version de la gema.


>     - "Declare the gems that you need, including version numbers. 
>        Specify versions using the same syntax that RubyGems supports for dependencies.
>       gem 'nokogiri'
>       gem 'rails', '3.0.0.beta3'
>       gem 'rack',  '>=1.0'
>       gem 'thin',  '~>1.1'
>       Most of the version specifiers, like >= 1.0, are self-explanatory. 
>       The specifier ~> has a special meaning, best shown by example.
>        ~> 2.0.3 is identical to >= 2.0.3 and < 2.1. ~> 2.1 is identical to >= 2.1 and < 3.0. 
>        ~> 2.2.beta will match prerelease versions like 2.2.beta.12."

  4. ¿Qué ocurrió la primera vez que ejecutaste `prueba.rb`? ¿Por qué?

>       Tiro ese error porque la gema  `colorputs` no estaba instalada.
>     
>       seis  ruby prueba.rb 
>       /home/camila/.rbenv/versions/2.2.3/lib/ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require': cannot load such file -- colorputs (LoadError)
>         from /home/camila/.rbenv/versions/2.2.3/lib/ruby/2.2.0/rubygems/core_ext/kernel_require.rb:54:in `require'
>         from prueba.rb:1:in `<main>'


  5. ¿Qué cambió al ejecutar `bundle install`?

>     Al ejecutar `bundle install` se instalaron las gemas declaras en el
>     Gemfile.

>     Bundle install: Make sure all dependencies in your Gemfile are available
>     to your application. http://bundler.io/bundle_install.html

>     Gems will be installed to your default system location for gems.
>     While installing gems, Bundler will check vendor/cache and then your
>     system's gems. 
>     If a gem isn't cached or installed, Bundler will try to install it from
>     the sources you have declared in your Gemfile.

  6. ¿Qué diferencia hay entre `bundle install` y `bundle update`?

>   Uno instala y otro actualiza todo dependiendo de como la gema haya sido
>   declarada en el gemfile (?).

  7. ¿Qué ocurrió al ejecutar `prueba_dos.rb` de las distintas formas
  enunciadas? ¿Por qué? ¿Cómo modificarías el archivo `prueba_dos.rb` para que
  funcione correctamente?

>     Al Ejecutar ruby prueba_dos.rb, tiraba el error prueba_dos.  `rb:2:in
>       `<main>`: uninitialized constant Bundler (NameError)`
>     Porque Bundler no estaba especificado en ningun lado, solucionamos el
>     error escribiendo `require 'bundler'`
>     Bundler configura pero los require son explicitos.


## Sinatra

1. ¿Qué es Rack? ¿Qué define? ¿Qué requisitos impone?

   > Rack proporciona una interface entre los servidores web que soportan ruby
   > y Ruby frameworks.

   > Para utilizar Rack, hay pasarle a la app: un objeto que responda a la
   > llamada al metodo, tomando el entorno del hash como parametro, y retorne
   > un Array con 3 elementos.
   >    - The HTTP response code (El codigo de respuesta de HTTP)
   >    - A Hash of headers (Un hash de cabeceras)
   >    - The response body, which must respond to each (El cuerpo de la respuesta, que debe responder a cada uno)


2. Implementá una *app* llamada "MoL" de Rack que responda con un número al azar entre `1` y `42`, y que devuelva el
   *status* HTTP `200` sólo en caso que el número a devolver sea `42`, en cualquier otro caso debe retornar un *status*
   `404`.

 [Ejercicio resuelto](https://github.com/cam-ila/practica-ruby/blob/master/MoL/mol.rb)
 

3. Sinatra se define como "*DSL para crear aplicaciones web*". ¿Qué quiere
decir esto? ¿Qué es un *DSL*?

    > DSL, Domain-Specific Language (lenguaje específico del dominio) es un
    > lenguaje de programación o especificación dedicado a resolver un problema
    > en particular, representar un problema específico y proveer una técnica
    > para solucionar una situación particular. 


4. Implementá la misma *app* "MoL" de antes, ahora utilizando Sinatra para
obtener el mismo resultado.
  [Ejercicio resuelto](https://github.com/cam-ila/practica-ruby/blob/master/cuatro/Mol2.rb)
   



5. Utilizando Sinatra, desarrollá una aplicación web que tenga los siguientes
*endpoints*:
  * `GET /` lista todos los endpoints disponibles (sirve a modo de documentación)
  * `GET /mcm/:a/:b` calcula y presenta el mínimo común múltiplo de los valores numéricos `:a` y `:b`
  * `GET /mcd/:a/:b` calcula y presenta el máximo común divisor de los valores numéricos `:a` y `:b`
  * `GET /sum/*` calcula la sumatoria de todos los valores numéricos recibidos como parámetro en el *splat*
  * `GET /even/*` presenta la cantidad de números pares que hay entre los valores numéricos recibidos como parámetro en
    el *splat*
  * `POST /random` presenta un número al azar
  * `POST /random/:lower/:upper` presenta un número al azar entre `:lower` y `:upper` (dos valores numéricos)

  [Ejercicio resuelto](https://github.com/cam-ila/practica-ruby/blob/master/endpoints/endpoints.rb)

6. Implementá un *middleware* para Sinatra que modifique la respuesta del web server y "tache" cualquier número que
   aparezca en el *body* de la respuesta, cambiando cada dígito por un caracter `X`. Utilizalo en la aplicación anterior
   para corroborar su funcionamiento.

7. Implementá otro *middleware* para Sinatra que agregue una cabecera a la respuesta HTTP, llamada `X-Xs-Count`, cuyo
   valor sea la cantidad de caracteres `X` que encuentra en el *body* de la respuesta. ¿Cómo debés incluirlo en tu *app*
   Sinatra para que este *middleware* se ejecute **antes** que el desarrollado en el punto anterior?

8. Desarrollá una aplicación Sinatra para jugar al ahorcado. La aplicación internamente debe manejar una lista de
   palabras (cada una asociada a algún identificador de tu elección y a información sobre los intentos realizados para
   adivinar esa palabra), donde cada una representa una partida de ahorcado que puede ser jugada una sóla vez por
   ejecución del servidor de la aplicación web.  
   La misma debe poseer las siguientes URLs:
  * `POST /` inicia una partida. Internamente tomará una palabra al azar de entre las de la lista, y luego debe
    redirigir (con un *redirect* HTTP) a la URL propia de la partida (utilizando el identificador de la palabra elegida)
    para que el jugador pueda comenzar a adivinar.
  * `GET /partida/:id` muestra el estado actual de la partida (letras adivinadas, intentos fallidos y cantidad de
    intentos restantes). Si se adivinó la palabra o no quedan más intentos, deberá reflejarse también en la
  * `PUT /partida/:id` acepta un parámetro por `PUT` llamado `intento` que debe contener la letra que el jugador intenta
    para adivinar la palabra. Internamente la aplicación chequeará si se pueden hacer más intentos en la partida, en
    caso afirmativo actualizará el estado de la partida, y en respuesta deberá hacer un *redirect* HTTP a la partida (a
    `/partida/:id`) para mostrar al jugador el estado de su partida.

## Referencias

A la hora de aprender un nuevo lenguaje, una herramienta o un framework, es fundamental que te familiarices con sus
APIs. Sea conocer clases base del lenguaje o parte de la herramienta que estés comenzado a utilizar, las APIs que te
provea serán la forma de sacarle provecho. Si además disponés de guías o *tutoriales* para complementar y guiarte en el
aprendizaje (como ocurre en el caso de Sinatra y Rails), ¡mejor aún!

Por eso, te dejamos en esta sección los links para que puedas consultar la documentación de las herramientas que ves en
esta práctica:

* Rubygems - https://rubygems.org
  * [Guías](http://guides.rubygems.org/)
* Bundler - http://bundler.io
  * [Motivación y breve ejemplo](http://bundler.io/rationale.html)
  * [Gemfile](http://bundler.io/v1.10/gemfile.html)
* Sinatra - http://sinatrarb.com/
  * [APIs](http://www.rubydoc.info/gems/sinatra)
  * Guía rápida [en inglés](http://www.sinatrarb.com/intro.html) y [en español](http://www.sinatrarb.com/intro-es.html)
  * [Índice de documentación](http://www.sinatrarb.com/documentation.html)
  * [Presentación en español](http://www.slideshare.net/godfoca/sinatra-1282891)
