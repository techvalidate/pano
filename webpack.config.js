const webpack = require('webpack')
const UglifyJsPlugin = require('uglifyjs-webpack-plugin')

module.exports = {
  entry: {
   app: __dirname + '/app/javascripts/src/app/index.js',
   global: __dirname + '/app/javascripts/src/global/index.js'
  },
  output: {
    filename: '[name].js',
    path: __dirname + '/javascript/dist'
  },
  plugins: [
    new webpack.ProvidePlugin({
      _: 'lodash',
      $: 'jquery',
      jQuery: 'jquery',
      jquery: 'jquery'
    }),
    new UglifyJsPlugin({
      test: /\.js$/,
      exclude: /node_modules/,
      sourceMap: true
    })
  ],
  resolve: {
    alias: {
      '$': 'jquery',
      'sticky-kit': 'sticky-kit/dist/sticky-kit',
      dropzone: 'dropzone/src/dropzone'
    }
  }
}