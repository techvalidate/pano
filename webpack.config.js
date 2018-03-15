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
  devtool: 'inline-source-map',
  plugins: [
    new webpack.ProvidePlugin({
      _: 'lodash',
      $: 'jquery',
      jQuery: 'jquery',
      jquery: 'jquery'
    }),
    new UglifyJsPlugin({
      test: /\.js$/,
      exclude: /node_modules/
    })
  ],
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['env']
          }
        }
      },
      {
        test: require.resolve('jquery'),
        use: [{
          loader: 'expose-loader',
          options: '$'
        },
        {
          loader: 'expose-loader',
          options: 'jquery'
        },
        {
          loader: 'expose-loader',
          options: 'jQuery'
        }]
      }
    ]
  },
  resolve: {
    alias: {
      'sticky-kit': 'sticky-kit/dist/sticky-kit',
      dropzone: 'dropzone/src/dropzone'
    }
  }
}