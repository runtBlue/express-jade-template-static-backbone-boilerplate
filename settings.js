(function() {
  module.exports = {
    dbUri: {
      development: "mongodb://localhost/apple",
      production: ""
    },
    dbCollections: [
      {
        uName: "apple",
        dName: "apple",
        schema: {
          name: String,
          age: Number
        }
      }, {
        uName: "model2",
        dName: "model2",
        schema: {
          title: String,
          price: Number
        }
      }
    ]
  };

}).call(this);
