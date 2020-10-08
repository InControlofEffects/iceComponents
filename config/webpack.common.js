////////////////////////////////////////////////////////////////////////////////
// FILE: webpack.common.js
// AUTHOR: David Ruvolo
// CREATED: 2020-09-26
// MODIFIED: 2020-10-07
// PURPOSE: webpack common config
// DEPENDENCIES: see below
// STATUS: working
// COMMENTS: NA
////////////////////////////////////////////////////////////////////////////////

// load plugins
const { CleanWebpackPlugin } = require("clean-webpack-plugin");
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const webpack = require("webpack");
const path = require("path");

// config
module.exports = {
    entry: "./src/index.js",
    output: {
        filename: "iceComponents.min.js",
        path: path.join(__dirname, "..", "inst/iceComponents/public/"),
    },
    plugins: [
        new webpack.ProgressPlugin(),
        new CleanWebpackPlugin(),
        new MiniCssExtractPlugin({
            filename: "iceComponents.min.css",
            ignoreOrder: false,
        }),
    ],
    module: {
        rules: [
            {
                test: /\.js$/,
                use: "babel-loader",
                exclude: /node_modules/,
            },
            {
                test: /\.s[ac]ss$/i,
                use: [
                    // write to file
                    {
                        loader: MiniCssExtractPlugin.loader,
                        options: {
                            publicPath: "./inst/iceComponents/public/",
                        }
                    },
                    'css-loader',
                    "postcss-loader",
                    'sass-loader'
                ]
            }
        ]
    }
}