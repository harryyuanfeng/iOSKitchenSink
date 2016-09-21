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

AV.Cloud.define('cqlInPointerSearch', function(request, response) {
    var cql = 'select include category, * from _User where category in (select * from category where name = "fiona") and gender = "1" limit 1,10';
    AV.Query.doCloudQuery(cql).then(function (data) {
        var results = data.results;
        response.success(results);
    }, function (error) {
    });
});

AV.Cloud.define('checkError', function(request, response) {
    var query = new AV.Query('forbidenClass');
    query.find().then(function (todos) {
        response.success(todos);
    }, function (error) {
        response.error(error);
    });
});

AV.Cloud.define('saveModel', function(request, response) {
    var model = request.params.object;
    console.log(model);
    var Todo = AV.Object.extend('Todo');
    var todo = new Todo();
    todo.save(model).then(function (todo) {
        response.success(todo);
    }, function (error) {
        response.error(error);
    });
});

function parseJsonToAVObject(json,className){
    var todo = AV.Object.createWithoutData(className, json.objectId);
    return todo;
}

AV.Cloud.define('saveModelWithPointer', function(request, response) {
    console.log('saveModelWithPointer');
    var Todo = request.params.Todo;
    var category = request.params.category;
    var MyTodo = AV.Object.extend('Todo');
    var mytodo = new MyTodo();
    mytodo.save(Todo).then(function (todo) {
        mytodo.set('category',parseJsonToAVObject(category,"category"));
        mytodo.save().then(function(result){
            response.success(result);
        },function(error){
            response.error(error);
        })

    }, function (error) {
        response.error(error);
    });
});

module.exports = AV.Cloud;
