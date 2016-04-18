require! {
  'assert'
}

module.exports = findDocument = (db, callback) ->
  collection = db.collection 'documents'

  collection.find({}).toArray (err, result) ->
    assert.equal err, null
    assert.equal 2, result.length

    console.log 'Found the following records'
    console.dir result
    callback result
