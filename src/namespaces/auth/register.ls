require! {
  'when': wn
}

module.exports = (params) ->
  wn.promise (resolve, reject) ->
    engino.auth.register(params.email, params.password)
    .then (result) ->
      resolve result