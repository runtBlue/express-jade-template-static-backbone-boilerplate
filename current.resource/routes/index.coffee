# GET home page.
exports.index = (req, res) ->
	res.render "index",
		title: "Express"





# Backbone sync tester

# Collection test start ->
####################


# Collectionのfetch
exports.foo2_get_all = (req, res) ->
	console.log '------GET: the collection ------'
	console.log 'query: ', req.query
	console.log 'params: ', req.params
	console.log 'body: ', req.body
	res.json 200,[
		{
			id: 1
			data: 'before'
		}
		{
			id: 2
			data: 'before'
		}
		{
			id: 3
			data: 'before'
		}
	]




exports.foo2_get = (req, res) ->
	console.log '------GET: a model in the collection ------'
	console.log 'query: ', req.query
	console.log 'params: ', req.params
	console.log 'body: ', req.body
	res.json 200,
		data: 'after'
		data2: 'add'

exports.foo_get_super = (req, res) ->
	console.log '------GET: the model------'
	console.log '------ yrlRoot を指定している場合 ------'
	res.json 200,
		test: 'the urlRoot exists. '

exports.foo2_post = (req, res) ->
	console.log '------POST: a model in the collection ------'
	console.log 'query: ', req.query
	console.log 'params: ', req.params
	console.log 'body: ', req.body
	res.json 201,
		id: 4


exports.foo2_put = (req, res) ->
	console.log '------PUT: a model in the collection ------'
	console.log 'query: ', req.query
	console.log 'params: ', req.params
	console.log 'body: ', req.body
	res.json 200, {}


exports.foo2_delete = (req, res) ->
	console.log '------DELETE: collection delete -----'
	console.log 'query: ', req.query
	console.log 'params: ', req.params
	console.log 'body: ', req.body
	res.json 200, {}





# <- Collection test end
####################


# Model test start ->
####################


exports.foo_post = (req, res) ->
	console.log "---post---"
	console.log 'query: ', req.query
	console.log 'params: ', req.params
	console.log 'body: ', req.body
	res.json 201,
		id: id? or id = 12314134
	return req
exports.foo_put = (req, res) ->
	console.log "---put---"
	console.log 'query: ', req.query
	console.log 'params: ', req.params
	console.log 'body: ', req.body
	res.json 201, {}
exports.foo_get = (req, res) ->
	console.log "---get---"
	console.log 'query: ', req.query
	console.log 'params: ', req.params
	console.log 'body: ', req.body
	res.json 200,
		bar: "bar"
		id: req.params.id + 0

exports.foo_delete = (req, res) ->
	console.log "---delete---"
	console.log 'query: ', req.query
	console.log 'params: ', req.params
	console.log 'body: ', req.body
	res.json 200, {}

# <- Model test end
####################



