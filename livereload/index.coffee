_mime = require 'mime'
_livereload = require 'livereload'

exports.silkyPlugin = true

_defaultConfig =
  "exts": ['less', 'coffee', 'hbs', 'html', 'css', 'js', 'htm', 'handlebars', 'scss']
  port: "14423"


extend = (source, dest)->
  for key, value of dest
    source[key] = value
  source

exports.registerPlugin = (silky, options)->
  return if not options
  config = extend _defaultConfig, options
  silky.registerHook('route:initial', ->
    llServer = _livereload.createServer(config)
    llServer.watch process.cwd()
  )

  silky.registerHook('route:willResponse', (data)->
    return if _mime.extension(data.mime) isnt 'html'
    script = "    <script src='http://localhost:#{_defaultConfig.port}/livereload.js'></script>\n$1"
    data.content = data.content.replace /(<\/\s*head>)/i, script
  )