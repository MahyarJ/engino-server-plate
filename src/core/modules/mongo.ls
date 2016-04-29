MongoClient = require('mongodb').MongoClient
wn = require('when')

dbName = 'engino'
dbPort = '27017'

url = "mongodb://localhost:#{dbPort}/#{dbName}"

module.exports = wn.promise (resolve, reject) ->
  MongoClient.connect url, (err, db) ->
    if err?
      reject err
    console.log "DB Connected Successfully - #{dbPort}/#{dbName}"
    resolve db