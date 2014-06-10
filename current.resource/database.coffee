mongoose = require "mongoose"
settings = require "./settings"

# Schema register
####################################
settings.dbCollections.forEach (collection, index) ->
	schema = new mongoose.Schema collection.schema
	mongoose.model collection.uName, schema, collection.dName

# Connection judge
####################################
mongoose.connection.on 'open', () ->
mongoose.connection.on 'close', () ->
mongoose.connect settings.dbUri[(process.env.NODE_ENV)or"development"]
# Model Use
####################################
module.exports = mongoose