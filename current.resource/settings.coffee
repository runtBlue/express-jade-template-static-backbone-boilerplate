# settings by Hiroki Takagishi
# dbUri is now mongodb access uri
# if production, please insert the uri
# dbCollection are for mongoose Schema and this setting
# the uName is "useName", to use at routes
# the dName is "databaseName" or CollectionName, to read, save at database
####################################################



module.exports =
	dbUri:
		development: "mongodb://localhost/apple"
		production: ""
	dbCollections: [
		{
			uName: "apple"
			dName: "apple"
			schema:
				name: String
				age: Number
		}
		{
			uName: "model2"
			dName: "model2"
			schema:
				title: String
				price: Number
		}
	]