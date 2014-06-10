express = require("express")
http = require("http")
path = require("path")
favicon = require("static-favicon")
logger = require("morgan")
cookieParser = require("cookie-parser")
bodyParser = require("body-parser")
routes = require("./routes")
users = require("./routes/user")
hbs = require "hbs"
app = express()

# view engine setup
app.set "views", path.join(__dirname, "views")
app.set "view engine", "hbs"
hbs.registerPartials __dirname + "/views/partials"
app.use favicon()
app.use logger("dev")
app.use bodyParser.json()
app.use bodyParser.urlencoded()
app.use cookieParser()
app.use express.static(path.join(__dirname, "public"))
app.use app.router
app.get "/", routes.index
app.get "/users", users.list

#/ catch 404 and forwarding to error handler
app.use (req, res, next) ->
  err = new Error("Not Found")
  err.status = 404
  next err
  return


#/ error handlers

# development error handler
# will print stacktrace
if app.get("env") is "development"
  app.use (err, req, res, next) ->
    res.render "error",
      message: err.message
      error: err

    return


# production error handler
# no stacktraces leaked to user
app.use (err, req, res, next) ->
  res.render "error",
    message: err.message
    error: {}

  return

module.exports = app
