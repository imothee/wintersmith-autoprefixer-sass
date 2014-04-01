child_process = require 'child_process'
path = require 'path'
fs = require 'fs'
wintersmith_sass = require 'wintersmith-sass'
autoprefixer = require 'autoprefixer'

module.exports = (wintersmith, callback) ->
  options   = wintersmith.config.sass or {}
  exec_opts = options.exec_opts or {}

  # Possibly dodgy usage to register the old plugin to access the plugin class through the wintersmith plugins array
  wintersmith_sass wintersmith, () =>

    SassPlugin = wintersmith.plugins['SassPlugin']

    class AutoprefixerSassPlugin extends SassPlugin

      constructor: (@_filename, @_source) ->

      getFilename: ->
        @_filename.relative.replace /sass|scss$/g, 'css'

      getView: ->
        sass = super()
        return (env, locals, contents, templates, callback) =>
          sass(env, locals, contents, templates, (err, buffer) ->
            if buffer?
              stdout = autoprefixer.process(buffer).css
              callback null, new Buffer stdout
            else
              callback null
          )
        
          
    AutoprefixerSassPlugin.fromFile = (filename, callback) ->
      fs.readFile filename.full, (error, buffer) ->
        if error
          callback error
        else
          callback null, new AutoprefixerSassPlugin filename, buffer.toString()


    wintersmith.registerContentPlugin 'styles', '**/*.*(scss|sass)', AutoprefixerSassPlugin
    callback()