fs            = require 'fs'
path          = require 'path'

# {print}       = require 'util'
which         = require 'which'
{spawn, exec} = require 'child_process'
stitch        = require 'stitch'
uglify        = require 'uglify-js'

# ANSI Terminal Colors
bold  = '\x1B[0;1m'
red   = '\x1B[0;31m'
green = '\x1B[0;32m'
reset = '\x1B[0m'

log = (message, color, explanation) -> console.log color + message + reset + ' ' + (explanation or '')

###
Tasks
###

build = (callback) ->
  cp = (ipath, opath, cb) ->
    readStream = fs.createReadStream ipath
    readStream.pipe(fs.createWriteStream opath).on "close", cb

  options = ['-c','-b', '-o', 'dist', 'src'] # 'build', 'src' ]
  cmd = which.sync 'coffee'
  coffee = spawn cmd, options
  coffee.stdout.pipe process.stdout
  coffee.stderr.pipe process.stderr
  coffee.on 'exit', (status) -> callback?() if status is 0
 
  ### 
  cp "#{__dirname}/node_modules/adt.js/dist/adt.js", "#{__dirname}/vendor/adt.js", ->
      pkg = stitch.createPackage paths: ["#{__dirname}/build", "#{__dirname}/vendor"]
      pkg.compile (err, source) ->
        fs.writeFile "dist/parameterize-adt.complete.js", source, (err) ->
          if err
            throw err
          console.log "Stitched parameterize-adt.complete.js"
          #ast = uglify.parser.parse source
          #ast = uglify.uglify.ast_squeeze ast
          #uglified_source = uglify.uglify.gen_code ast
          #shasum = crypto.createHash("sha1")
          #shasum.update(uglified_source)
          #fs.writeFileSync libAssetPath, uglified_source
          #fs.writeFileSync libAssetPath, source
  ###

clean = (callback) ->
  exec "rm -rf build"
  callback()

task 'build', "Build the client-side js version of this library", ->
  clean -> build -> log ":)", green

task 'all', "Build all distribution files", -> 
  clean -> build -> log ":)", green

