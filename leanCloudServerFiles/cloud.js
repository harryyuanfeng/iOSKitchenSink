var AV = require('leanengine');

/**
 * 一个简单的云代码方法
 */
AV.Cloud.define('getTodo', function(request, response) {
    var query = new AV.Query('Todo');
    query.include("category");
    query.find().then(function (todos) {

        todos.forEach(function(result){
            result.set('category', result.get('category') ?  result.get('category').toJSON() : null);
        });
        console.log(todos);
        response.success(todos);
    }, function (error) {
    });
});


AV.Cloud.define('rpcGetTodo', function(request, response) {
    var query = new AV.Query('Todo');
    query.include("category");
    query.find().then(function (todos) {
        response.success(todos);
    }, function (error) {
    });
});

module.exports = AV.Cloud;
