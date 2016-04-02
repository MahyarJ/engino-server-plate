require! {
  'when': wn
}

module.exports = (str) ->
  wn.promise (resolve, reject) ->
    resolve str + ':)'
