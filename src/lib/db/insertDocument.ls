require! {
  'assert'
}

module.exports = insertDocument = (db, callback) ->
  collection = db.collection 'documents'

  collection.insertMany do
    * a: 1
    * a: 2
    * a: 3
    , (err, result) ->
      assert.equal err, null
      assert.equal 3, result.result.n
      assert.equal 3, result.ops.length

    console.log 'Inserted 3 documents into the documents collection'
    callback result