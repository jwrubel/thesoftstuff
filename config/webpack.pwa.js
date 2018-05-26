const Merge = require('webpack-merge');
const ProdConfig = require('./webpack.prod.js');
const path = require('path');
const webpack = require('webpack');
const WebpackPwaManifest = require('webpack-pwa-manifest');

module.exports = Merge(ProdConfig, {
  plugins: [
    new WebpackPwaManifest({
      name: 'the-soft-stuff',
      short_name: 'The Soft Stuff',
      description: 'Openly-licensed job descriptions, interview questions, career ladders, tools and resources.

      Like npm, but for technical managers and leaders.',
      orientation: "portrait",
      display: "standalone",
      start_url: "/",
      theme_color: "#d6e2f3",
      background_color: "#ffffff",
      icons: [
        {
          src: path.resolve('icon.png'),
          sizes: [96, 128, 192, 256, 384, 512]
        },
      ]
    })
  ]
});
