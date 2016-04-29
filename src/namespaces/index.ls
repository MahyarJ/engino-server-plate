require! {
  'path'
  'fs'
}

fs
.readdirSync path.join __dirname
.forEach (entity) ->
  if fs.statSync(path.join __dirname, entity).isDirectory()
    normalizedPath = path.join __dirname, entity
    console.log 'Engino Namespaces:\t'
    fs
    .readdirSync normalizedPath
    .forEach (file) ->
      filename = file.split('.')[0]
      console.log "./#{entity}/" + filename
      exports["#{entity}/#{filename}"] = require "./#{entity}/" + filename