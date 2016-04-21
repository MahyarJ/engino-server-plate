require! {
  'assert'
}

module.exports = updateDocument = (callback) ->
  collection = engino.mongo.collection 'documents'

  collection.updateOne {a: 2}, {$set: {b: 1}}, (err, result) ->
    assert.equal err, null
    assert.equal 1, result.result.n

    console.log 'Updated the document with the field `a` equal to 2'
    callback result