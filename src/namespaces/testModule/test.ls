require! {
  'when': wn
  '../../lib'
}

module.exports = (str) ->
  wn.promise (resolve, reject) ->
    console.log engino
    console.log lib 
    resolve str + ':)'
