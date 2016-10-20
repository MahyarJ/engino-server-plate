require! {
  'webpack-error-notification': WebpackErrorNotificationPlugin
  'webpack': webpack
  'path': path
}

module.exports =
  entry: './src/server.ls'
  target: \node
  devtool: \source-map

  # Warning: Don't remove this externals stuff
  # we don't have any idea what is it
  # but require will not work without it.
  externals:
    //
      ^
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
      '$ns': path.join __dirname, 'src/namespaces'
      '$engino': path.join __dirname, 'src'

  output:
    path: './dist'
    filename: 'index.dist.js'
    publicPath: '/dist/'  # shows the path from .html file till the .js files for script tag
    libraryTarget: \commonjs2

  resolveLoader:
    root:
      path.join __dirname, \node_modules

  module:
    loaders:
      * loader: \livescript
        test: /\.ls$/

      * loader: \json
        test: /\.json$/
