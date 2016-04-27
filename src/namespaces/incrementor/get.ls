require! {
  'when': wn
  '../../lib'
}

engino.mongo.collection('products').count!.then (count) ->
  if count is 0
    engino.mongo.collection('products').insert({number: 0}).then ->
      console.log "products collection created"

module.exports = (params) ->
  wn.promise (resolve, reject) ->
    engino.mongo.collection('products').find!.toArray!.then (data) ->
      resolve data.pop!.number