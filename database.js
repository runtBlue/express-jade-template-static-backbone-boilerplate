(function() {
  var mongoose, settings;

  mongoose = require("mongoose");

  settings = require("./settings");

  settings.dbCollections.forEach(function(collection, index) {
    var schema;
    schema = new mongoose.Schema(collection.schema);
    return mongoose.model(collection.uName, schema, collection.dName);
  });

  mongoose.connection.on('open', function() {});

  mongoose.connection.on('close', function() {});

  mongoose.connect(settings.dbUri[process.env.NODE_ENV || "development"]);

  module.exports = mongoose;

}).call(this);
