const { environment } = require('@rails/webpacker')

environment.config.set('watchOptions', { ignored: [/node_modules([\\]+|\/)+(?!\pano-js)/]})

module.exports = environment
