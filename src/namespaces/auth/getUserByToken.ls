require! {
  'when': wn
}

module.exports = (params, cookie) ->
  wn.promise (resolve, reject) ->
    engino.auth.getUserByToken(cookie.token)
    .then (result) ->
      if result?
        delete result.user.password
        delete result.user._id
      resolve result