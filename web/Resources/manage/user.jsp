<%--
  Created by IntelliJ IDEA.
  User: Joshua_123
  Date: 25/11/2017
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="inner-content container-fluid">
        <div id="user-table" class="display-tab">
            <div class="col-md-12">
                <ul class="search-tab nav nav-pills navbar-right">
                    <li>
                        <form id="search-user" class="form-inline" action="" method="post">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <select name="select-role" id="select-role">
                                        <option value="admin">Admin</option>
                                        <option value="cashier">Cashier</option>
                                    </select>
                                </span>
                                <input id="search-user-name" name="search-user" class="form-control" type="text" placeholder="search-user">
                                <div class="input-group-btn">
                                    <button class="search-btn btn btn-default">
                                        <i class="glyphicon glyphicon-search"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </li>
                    <li><a href="#" data-toggle="modal" data-target="#add-user"><span class="glyphicon glyphicon-plus"></span> Add User</a></li>
                </ul>
            </div>

            <table id="user-body" class="table head table-striped table-responsive">
                <thead>
                <tr>
                    <th class="col-sm-3">Full Name</th>
                    <th class="col-sm-2">Username</th>
                    <th class="col-sm-2">Last login</th>
                    <th class="col-sm-2">Role</th>
                    <th class="col-sm-3">Action</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>

            <div class="col-md-12">
                <ul class="pager">
                    <li id="user-previous" class="previous"><a href="">Previous</a></li>
                    <li id="user-count" class="count"></li>
                    <li id="user-next" class="next"><a href="">Next</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div id="add-user" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h3 class="modal-title">User form</h3>
                </div>
                <div class="modal-body">
                    <div class="form-center form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-offset-2 col-sm-2" for="input-user-name">Fullname:</label>
                            <div class="col-sm-6">
                                <input class="form-control" id="input-user-name" type="text" placeholder="Fullname">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-offset-2 col-sm-2" for="input-username">Username:</label>
                            <div class="col-sm-6">
                                <input class="form-control" id="input-username" type="text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-offset-2 col-sm-2" for="input-password">Password:</label>
                            <div class="col-sm-6">
                                <input class="form-control" id="input-password" type="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-offset-2 col-sm-2" for="input-role">Role:</label>
                            <div class="col-sm-4">
                                <select class="form-control" id="input-role">
                                    <option value="admin">Admin</option>
                                    <option value="cashier">Cashier</option>
                                </select>
                            </div>
                        </div>

                        <input class="hidden csrftoken" name="csrftoken" type="text" value="${csrftoken}" >
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="user-submit" class="btn btn-success">Submit</button>
                </div>
            </div>
        </div>
    </div>

    <div id="change-password" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h3 class="modal-title">Change password</h3>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="form-center form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-sm-offset-2 col-sm-2" for="input-user-name">New Password:</label>
                                <div class="col-sm-6">
                                    <input class="form-control" id="input-change" type="password" placeholder="Password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-offset-2 col-sm-2" for="input-username">Confirm Password:</label>
                                <div class="col-sm-6">
                                    <input class="form-control" id="input-confirmation" type="password">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="update-password-submit" class="btn btn-success">Submit</button>
                </div>
            </div>
        </div>
    </div>


    <script>
        setTimeout(getdata("/api/user/getall?page=0",0, 10), 5000);

        $("#user-submit").click(function () {
            var data={};
            var url="/api/user/insert";
            data.id=null;
            data.fullname= $("#input-user-name").val();
            data.username= $("#input-username").val();
            data.password= $("#input-password").val();
            data.log_time=null;
            data.user_role= $("#input-role").val();
            console.log(data);
            insertdata(url, JSON.stringify(data));
        });

        $("#search-user").on('change keyup', function () {
            console.log($(this).serialize());
            getdata('/api/user/search?'+$(this).serialize()+"&page=0",0,10);
        });

        $("tbody").on('click', '.password-btn', function () {
            $("#update-password-submit").attr('data-info', $(this).closest('tr').data('id'));
        });

        $("#update-password-submit").click(function () {
            var data={};
            data.id= $(this).data('info');
            data.password= $('#input-change').val();
            changePassword("/api/user/update/password", data);
        });

    </script>

</body>
</html>