require! {
  'path'
  'fs'
  'when': wn
}

global.engino = {}

module.exports = wn.promise (resolve, reject) ->
  normalizedPath = path.join __dirname, "modules"

  allModulePromises = []

  fs
  .readdirSync normalizedPath
  .forEach (file) ->
    filename = file.split('.')[0]
    modulePromise = require "./modules/#{filename}"
    allModulePromises.push modulePromise
    modulePromise.then (moduleInstance) ->
      global.engino[filename] = moduleInstance
      console.log "available engino modules: ", Object.keys(global.engino)
    
  wn.all allModulePromises
  .then ->
    resolve!