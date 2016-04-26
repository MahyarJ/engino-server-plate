require! {
  'when': wn
  '../../lib'
}

module.exports = (params) ->
  wn.promise (resolve, reject) ->
    engino.mongo.collection('products').count!.then (count) ->
      if count is 0
        engino.mongo.collection('products').insert({number: 0})

    if params.inc?
      engino.mongo.collection('products').update({}, {$inc: {number: 1}}).then ->
        resolve {success: true}