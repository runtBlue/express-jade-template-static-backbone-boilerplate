(function() {
  exports.index = function(req, res) {
    return res.render("index", {
      title: "Express"
    });
  };

  exports.foo2_get_all = function(req, res) {
    console.log('------GET: the collection ------');
    console.log('query: ', req.query);
    console.log('params: ', req.params);
    console.log('body: ', req.body);
    return res.json(200, [
      {
        id: 1,
        data: 'before'
      }, {
        id: 2,
        data: 'before'
      }, {
        id: 3,
        data: 'before'
      }
    ]);
  };

  exports.foo2_get = function(req, res) {
    console.log('------GET: a model in the collection ------');
    console.log('query: ', req.query);
    console.log('params: ', req.params);
    console.log('body: ', req.body);
    return res.json(200, {
      data: 'after',
      data2: 'add'
    });
  };

  exports.foo_get_super = function(req, res) {
    console.log('------GET: the model------');
    console.log('------ yrlRoot を指定している場合 ------');
    return res.json(200, {
      test: 'the urlRoot exists. '
    });
  };

  exports.foo2_post = function(req, res) {
    console.log('------POST: a model in the collection ------');
    console.log('query: ', req.query);
    console.log('params: ', req.params);
    console.log('body: ', req.body);
    return res.json(201, {
      id: 4
    });
  };

  exports.foo2_put = function(req, res) {
    console.log('------PUT: a model in the collection ------');
    console.log('query: ', req.query);
    console.log('params: ', req.params);
    console.log('body: ', req.body);
    return res.json(200, {});
  };

  exports.foo2_delete = function(req, res) {
    console.log('------DELETE: collection delete -----');
    console.log('query: ', req.query);
    console.log('params: ', req.params);
    console.log('body: ', req.body);
    return res.json(200, {});
  };

  exports.foo_post = function(req, res) {
    var id;
    console.log("---post---");
    console.log('query: ', req.query);
    console.log('params: ', req.params);
    console.log('body: ', req.body);
    res.json(201, {
      id: (typeof id !== "undefined" && id !== null) || (id = 12314134)
    });
    return req;
  };

  exports.foo_put = function(req, res) {
    console.log("---put---");
    console.log('query: ', req.query);
    console.log('params: ', req.params);
    console.log('body: ', req.body);
    return res.json(201, {});
  };

  exports.foo_get = function(req, res) {
    console.log("---get---");
    console.log('query: ', req.query);
    console.log('params: ', req.params);
    console.log('body: ', req.body);
    return res.json(200, {
      bar: "bar",
      id: req.params.id + 0
    });
  };

  exports.foo_delete = function(req, res) {
    console.log("---delete---");
    console.log('query: ', req.query);
    console.log('params: ', req.params);
    console.log('body: ', req.body);
    return res.json(200, {});
  };

}).call(this);
