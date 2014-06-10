(function() {
  var app, bodyParser, cookieParser, express, favicon, hbs, http, logger, path, routes, users;

  express = require("express");

  http = require("http");

  path = require("path");

  favicon = require("static-favicon");

  logger = require("morgan");

  cookieParser = require("cookie-parser");

  bodyParser = require("body-parser");

  routes = require("./routes");

  users = require("./routes/user");

  hbs = require("hbs");

  app = express();

  app.set("views", path.join(__dirname, "views"));

  app.set("view engine", "hbs");

  hbs.registerPartials(__dirname + "/views/partials");

  app.use(favicon());

  app.use(logger("dev"));

  app.use(bodyParser.json());

  app.use(bodyParser.urlencoded());

  app.use(cookieParser());

  app.use(express["static"](path.join(__dirname, "public")));

  app.use(app.router);

  app.get("/", routes.index);

  app.post("/foo", routes.foo_post);

  app.put("/foo/:id", routes.foo_put);

  app.get("/foo/:id", routes.foo_get);

  app["delete"]("/foo/:id", routes.foo_delete);

  app.get("/foo2", routes.foo2_get_all);

  app.get("/foo2/:id", routes.foo2_get);

  app.post("/foo2", routes.foo2_post);

  app.put("/foo2/:id", routes.foo2_put);

  app["delete"]("/foo2/:id", routes.foo2_delete);

  app.use(function(req, res, next) {
    var err;
    err = new Error("Not Found");
    err.status = 404;
    next(err);
  });

  if (app.get("env") === "development") {
    app.use(function(err, req, res, next) {
      res.render("error", {
        message: err.message,
        error: err
      });
    });
  }

  app.use(function(err, req, res, next) {
    res.render("error", {
      message: err.message,
      error: {}
    });
  });

  module.exports = app;

}).call(this);
