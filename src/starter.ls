require! {
  'when': wn
}

module.exports = (context, fn) ->
  modules = context.keys!.map context
  fnIndex = context.keys!.indexOf('./' + fn + '.ls')

  modules[fnIndex]

