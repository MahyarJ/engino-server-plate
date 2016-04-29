require! {
  'when': wn
  '../../lib'
}

module.exports = (params) ->
  wn.promise (resolve, reject) ->
    if params.inc?
      engino.mongo
      .collection \products
      .update {}, {$inc: {number: 1}}
      .then ->
        resolve {success: true}