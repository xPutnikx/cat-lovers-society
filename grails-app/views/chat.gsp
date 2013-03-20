<%--
  Created by IntelliJ IDEA.
  User: v.hudnitsky
  Date: 20.03.13
  Time: 1:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="test.society.User"%>
<html>
<head>
    <g:javascript plugin="jquery" library="jquery"></g:javascript>
    <meta name="layout" content="main">
    <title></title>
    <g:javascript >
        var user="${((User)session.user).firstName}";
    </g:javascript>

    <style>
    * {
        font-family: tahoma;
        font-size: 12px;
        padding: 0px;
        margin: 0px;
    }

    p {
        line-height: 18px;
    }

    div {
        width: 500px;
        margin-left: auto;
        margin-right: auto;
    }

    #detect {
        padding: 5px;
        background: #ffc0cb;
        border-radius: 5px;
        border: 1px solid #CCC;
        margin-top: 10px;
    }

    #content {
        padding: 5px;
        background: #ddd;
        border-radius: 5px;
        border: 1px solid #CCC;
        margin-top: 10px;
    }

    #header {
        padding: 5px;
        background: #f5deb3;
        border-radius: 5px;
        border: 1px solid #CCC;
        margin-top: 10px;
    }

    #input {
        border-radius: 2px;
        border: 1px solid #ccc;
        margin-top: 10px;
        padding: 5px;
        width: 400px;
    }

    #status {
        width: 88px;
        display: block;
        float: left;
        margin-top: 15px;
    }
    </style>
</head>

<body>
<atmosphere:resources/>

<div id="content"></div>
<div>
    <span id="status">Connected</span>
    <input type="text" id="input"/>
</div>

</body>
</html>