require! {
  'when': wn
}

module.exports = wn.promise (resolve, reject) ->
  enginoCore = require.context './core', yes, /\.ls$/
  enginoNamespaces = require.context './namespaces', yes, /\.ls$/
  resolve { enginoCore, enginoNamespaces }

