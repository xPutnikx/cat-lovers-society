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
    <link rel="stylesheet" href="${resource(dir: 'css/slider', file: 'reset.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/slider', file: 'home.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/slider', file: 'refineslide-theme-dark.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/slider', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/slider', file: 'refineslide.css')}" type="text/css">
    <g:javascript src="jquery.js"/>
    <g:javascript src="slider/modernizr.js"/>
    <g:javascript src="slider/jquery.refineslide.js"/>
    <g:javascript src="slider/ios-orientation-change-fix.js"/>
    <g:javascript src="slider/home.js"/>
</head>
<body>
<div class="body" style="width: 1000px;">
    <h1>Welcome to Cat Lovers Society</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
</div>
<div style="width: 1000px;height: 800px">
<ul id="images" class="rs-slider">
    <li >
        <a href="#" class="slide-parent">
            <img src="${resource(dir: 'images/slider', file: 'form.jpg')}" alt="Grails"/>
        </a>

    </li>
    <li>
        <img src="${resource(dir: 'images/slider', file: 'greenbut.jpg')}" alt="Grails"/>
    </li>
    <li>
        <a href="#">
            <img src="${resource(dir: 'images/slider', file: 'wood6.jpg')}" alt="Grails"/>
        </a>
    </li>
    <li><img src="${resource(dir: 'images/slider', file: 'red.jpg')}" alt="Grails"/>
    </li>
    <li><img src="${resource(dir: 'images/slider', file: '6.jpg')}" alt="Grails"/></li>
</ul>
<ul id="forms" class="rs-slider">
    <li class="form-wrap">
        <g:form action="authenticate" controller="user" method="post" id="login-form">
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
        </g:form>                   </li>
    <li>
        <div class="form-wrap">
            <a href="registration">Registration</a>
        </div>
    </li>
    <li>
        <img src="${resource(dir: 'images/slider', file: 'form.jpg')}" alt="Grails"/>
    </li>
    <li><img src="${resource(dir: 'images/slider', file: 'red.jpg')}" alt="Grails"/>
    </li>
    <li><img src="${resource(dir: 'images/slider', file: '6.jpg')}" alt="Grails"/></li>
</ul>
</div>
</body>
</html>