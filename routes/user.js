(function() {
  var apple, db;

  db = require("../database");

  apple = db.model("apple");

  exports.list = function(req, res) {
    res.send("アクセス応答を書きましょう。");
  };

}).call(this);
