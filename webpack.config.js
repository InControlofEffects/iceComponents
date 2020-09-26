////////////////////////////////////////////////////////////////////////////////
// FILE: webpack.config.js
// AUTHOR: David Ruvolo
// CREATED: 2020-09-26
// MODIFIED: 2020-09-26
// PURPOSE: load config based on environment
// DEPENDENCIES: see below & in env config
// STATUS: working
// COMMENTS: NA
////////////////////////////////////////////////////////////////////////////////

// load
const { merge } = require("webpack-merge");
const commonConfig = require("./config/webpack.common");

// load config based on environment
module.exports = (env) => {
    const config = require("./config/webpack." + env);
    return merge(commonConfig, config);
}