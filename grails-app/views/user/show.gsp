
<%@ page import="test.society.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/user/home')}"><g:message code="default.home.label"/></a></li>
				<li><a class="friends" href="${createLink(uri: '/user/friends')}">Friends</a></li>
				<li><a class="friends" href="${createLink(uri: '/user/list')}">Search</a></li>
				<li><a class="logout" href="${createLink(uri: '/user/logout')}">Logout</a></li>
				%{--<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
			
				<g:if test="${userInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="user.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="user.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${userInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				%{--<g:if test="${userInstance?.isActive}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="isActive-label" class="property-label"><g:message code="user.isActive.label" default="Is Active" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="isActive-label"><g:formatBoolean boolean="${userInstance?.isActive}" /></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			
				<g:if test="${userInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="user.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${userInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.login}">
				<li class="fieldcontain">
					<span id="login-label" class="property-label"><g:message code="user.login.label" default="Login" /></span>
					
						<span class="property-value" aria-labelledby="login-label"><g:fieldValue bean="${userInstance}" field="login"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.nickName}">
				<li class="fieldcontain">
					<span id="nickName-label" class="property-label"><g:message code="user.nickName.label" default="Nick Name" /></span>
					
						<span class="property-value" aria-labelledby="nickName-label"><g:fieldValue bean="${userInstance}" field="nickName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="user.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="user.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${userInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				%{--<g:if test="${userInstance?.status}">--}%
				%{--<li class="fieldcontain">--}%
					%{--<span id="status-label" class="property-label"><g:message code="user.status.label" default="Status" /></span>--}%
					%{----}%
						%{--<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${userInstance}" field="status"/></span>--}%
					%{----}%
				%{--</li>--}%
				%{--</g:if>--}%
			
			</ol>
			<g:form>
				<fieldset class="buttons">
                    <g:if test="${session.user?.id==userInstance?.id}">

					<g:hiddenField name="id" value="${userInstance?.id}" />
					<g:link class="edit" action="edit" id="${userInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					%{--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%

                    </g:if>
                    <g:if test="${session.user?.id!=userInstance?.id}">
                        <g:link class="addFriend" action="addFriend" id="${userInstance.id}"><g:message code="default.button.add.friend" default="addFriend" /></g:link>
                    </g:if>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
