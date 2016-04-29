require! {
  'when': wn
  '../../lib'
}

module.exports = (params) ->
  wn.promise (resolve, reject) ->
    engino.auth.register(params.name, params.email, params.pass, params.confirm)
    .then (result) ->
      resolve result