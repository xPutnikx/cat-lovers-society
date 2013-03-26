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
    <meta name="layout" content="main"/>
    <title>Home Page</title>
    <link rel="stylesheet" href="${resource(dir: 'css/slider', file: 'reset.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/slider', file: 'home.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/slider', file: 'refineslide-theme-dark.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/slider', file: 'refineslide.css')}" type="text/css">
    <g:javascript src="jquery.js"/>
    <g:javascript src="slider/modernizr.js"/>
    <g:javascript src="slider/jquery.refineslide.js"/>
    <g:javascript src="slider/ios-orientation-change-fix.js"/>
    <g:javascript src="slider/home.js"/>
</head>

<body>
<div style="width: 1000px;height: 800px">
    <ul id="images" class="rs-slider">
        <li>
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
            <g:form action="authenticate" controller="user" method="post" id="login-form" class="auth">
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
                        <input class="save" type="submit" value="Login"/>
                    </span>
                </div>
            </g:form></li>
        <li class="form-wrap">
            <div id="create-user" class="content scaffold-create" role="main">
                <g:hasErrors bean="${userInstance}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${userInstance}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                    error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>
                <g:form action="saveUser" class="registration">
                    <fieldset class="form">
                        <g:render template="form"/>
                    </fieldset>
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="save"
                                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                    </fieldset>
                </g:form>
            </div>
        </li>
        <li class="form-wrap">
            <g:form action="recovery" controller="user" method="get" id="recovery-form" class="auth">
                <div class="dialog">
                    <table>
                        <tbody>
                        <tr class="prop">
                            <td class="name">
                                <label for="login">Login:</label>
                            </td>
                            <td>
                                <input type="text" name="login"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td class="name">
                                <label for="email">Email:</label>
                            </td>
                            <td>
                                <input type="email" id="email" name="email"/>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="buttons">
                    <span class="button">
                        <input class="restore" type="submit" value="Restore"/>
                    </span>
                </div>
            </g:form></li>
    </ul>
</div>
</body>
</html>