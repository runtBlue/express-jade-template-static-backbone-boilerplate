# mongoose load
db = require "../database"
apple = db.model "apple"
# GET users listing.
exports.list = (req, res) ->
	res.send "アクセス応答を書きましょう。"
	return
