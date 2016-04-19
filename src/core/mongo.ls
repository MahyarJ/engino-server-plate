MongoClient = require('mongodb').MongoClient
wn = require('when')

dbName = 'engino'
dbPort = '27017'

# The command below in the command prompt
# mongod --dbpath data
# starts the db service on the data directory of server
# and in windows and linux are the same
url = "mongodb://localhost:#{dbPort}/#{dbName}"

module.exports = wn.promise (resolve, reject) ->
  MongoClient.connect url, (err, db) ->
    if err?
      reject db
    console.log "DB Connected Successfully - #{dbPort}/#{dbName}"
    resolve db