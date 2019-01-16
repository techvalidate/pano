const { environment } = require('@rails/webpacker')
const devMode = process.env.NODE_ENV !== 'production'
const babelLoader = environment.loaders.get('babel')

babelLoader.test = /\.js(\.erb)?$/
babelLoader.use = {
  loader: 'babel-loader',
  options: {
    presets: ["env"],
    plugins: ["transform-class-properties"]
  }
}
babelLoader.exclude = (/(node_modules\/(?![dropzone])|rails-ujs|pano-js)/)

environment.loaders.insert('sass', {
  test: /\.sass$/,
  use: [
    { loader: 'style-loader', options: { sourceMap: true } },
    { loader: 'css-loader', options: { sourceMap: true } },
    { loader: 'postcss-loader', options: { sourceMap: true } },
    { loader: 'sass-loader', options: { sourceMap: true } }
  ]
})


environment.config.set('watchOptions', { ignored: [/node_modules([\\]+|\/)+(?!\pano-js)/]})
environment.config.set('resolve', {
  modules: [
    'pano/app/frontend'
  ]
})



module.exports = environment
