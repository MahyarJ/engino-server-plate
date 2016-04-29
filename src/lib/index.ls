require! {
  'path'
  'fs'
}

fs
.readdirSync path.join __dirname
.forEach (entity) ->
  if fs.statSync(path.join __dirname, entity).isDirectory()
    normalizedPath = path.join __dirname, entity
    console.log "Engino Lib Modules:"
    fs
    .readdirSync normalizedPath
    .forEach (file) ->
      filename = file.split('.')[0]
      console.log "\t #{entity}.#{filename}"

      fileObject = {}
      fileObject[filename] = require "./#{entity}/#{filename}"

      exports[entity] ?= {}
      exports[entity] <<< fileObject