MongoClient = require('mongodb').MongoClient

dbName = 'engino'
dbPort = '27017'

# The command below in the command prompt
# mongod --dbpath data
# starts the db service on the data directory of server
# and in windows and linux are the same
url = "mongodb://localhost:#{dbPort}/#{dbName}"

MongoClient.connect url, (err, db) ->
  console.log "DB Connected Successfully - #{dbPort}/#{dbName}"

