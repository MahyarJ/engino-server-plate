require! {
  'when': wn
  '../../lib'
}

module.exports = (params) ->
  wn.promise (resolve, reject) ->
    engino.mongo.collection('products').find!.toArray!.then (data) ->
     resolve data.pop!.number