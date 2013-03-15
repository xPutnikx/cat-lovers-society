<%--
  Created by IntelliJ IDEA.
  User: v.hudnitsky
  Date: 12.03.13
  Time: 7:53
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="test.society.User" %>
<html>
<head>
    <meta name="layout" content="main" />
  <title>Home Page</title>
</head>
<body>
<div class="body">
    <h1>Welcome to Cat Lovers Society</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
</div>
<g:if test="${userInstance==null}">
<div class="registrationForm" style="float: right">
    <h1>Login</h1>
    <g:form action="authenticate" method="post" >
        <div class="dialog">
            <table>
                <tbody>
                <tr class="prop">
                    <td class="name">
                        <label for="login">Login:</label>
                    </td>
                    <td>
                        <input type="text" id="login" name="login"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td class="name">
                        <label for="password">Password:</label>
                    </td>
                    <td>
                        <input type="password" id="password" name="password"/>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="buttons">
            <span class="button">
                <input class="save" type="submit" value="Login" />
            </span>
        </div>
    </g:form>
    <div>
        <a href="registration">Registration</a>
    </div>
</div>
</g:if>
<g:if test="${userInstance?.login}">
    <div>
        ${userInstance.firstName}
        ${userInstance.lastName}
        ${userInstance.login}
        ${userInstance.nickName}
    </div>
</g:if>
</body>
</html>