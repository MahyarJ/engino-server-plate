require! {
  'when': wn
  '../../lib'
}

module.exports = (params) ->
  wn.promise (resolve, reject) ->
    engino.auth.login(params.email, params.pass)
    .then (result) ->
      resolve result