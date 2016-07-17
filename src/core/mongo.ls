require! {
  'when': wn
  'mongodb'
}

dbHostname = process.env.MONGO_HOSTNAME #'localhost'
dbName = process.env.MONGO_DB_NAME #'engino'
dbPort = process.env.MONGO_PORT #'27017'

url = "mongodb://#{dbHostname}:#{dbPort}/#{dbName}"

module.exports = wn.promise (resolve, reject) ->
  mongodb.MongoClient.connect url, (err, db) ->
    if err?
      reject err
    else
      console.log "DB Connected Successfully - #{url}"
      resolve db