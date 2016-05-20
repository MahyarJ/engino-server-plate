require! {
  'when': wn
  '../../lib'
}

module.exports = (params) ->
  wn.promise (resolve, reject) ->
    engino.auth.register(params.email, params.password)
    .then (result) ->
      resolve result