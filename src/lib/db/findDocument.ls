require! {
  'assert'
}

module.exports = findDocument = (callback) ->
  collection = engino.mongo.collection 'documents'

  collection.find({}).toArray (err, result) ->
    assert.equal err, null
    assert.equal 2, result.length

    console.log 'Found the following records'
    console.dir result
    callback result
