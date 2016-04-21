require! {
  'assert'
}

module.exports = deleteDocument = (callback) ->
  collection = engino.mongo.collection 'documents'

  collection.deleteOne {a: 3}, (err, result) ->
    assert.equal err, null
    assert.equal 1, result.result.n

    console.log 'Removed the document with the field `a` equal to 3'
    callback result