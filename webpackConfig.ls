require! {
  'webpack-error-notification': WebpackErrorNotificationPlugin
  'webpack': webpack
  'path': path
}

module.exports = ({ projectDir, index }) ->
  entry: index
  target: \node
  devtool: \source-map

  externals:
    //
      ^
      (?!\@mahyarj\/engino\-server)
      [a-z\-0-9]+
    //
    ...

  plugins:
    new webpack.NoErrorsPlugin!
    new WebpackErrorNotificationPlugin!
    new webpack.BannerPlugin do
      'if (typeof window === "undefined") {require("source-map-support").install();}'
      {raw: true, entryOnly: false}

  resolve:
    extensions: ['', '.js', '.ls']
    fallback:
      [ path.join(__dirname, \node_modules) ]
    alias:
      '$ens': path.join __dirname, 'src/namespaces'
      '$engino': path.join __dirname, 'src'
      '$ns': path.join projectDir, 'src/namespaces'

  output:
    path: path.join projectDir, './dist'
    filename: 'index.dist.js'
    publicPath: '/dist/'  # shows the path from .html file till the .js files for script tag
    libraryTarget: \commonjs2

  resolveLoader:
    root:
      path.join __dirname, \node_modules
      path.join projectDir, \node_modules

  module:
    loaders:
      * loader: \livescript
        test: /\.ls$/

      * loader: \json
        test: /\.json$/
