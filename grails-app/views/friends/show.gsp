
<%@ page import="test.society.Friends" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'friends.label', default: 'Friends')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-friends" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-friends" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list friends">
			
				<g:if test="${friendsInstance?.friend}">
				<li class="fieldcontain">
					<span id="friend-label" class="property-label"><g:message code="friends.friend.label" default="Friend" /></span>
					
						<span class="property-value" aria-labelledby="friend-label"><g:link controller="user" action="show" id="${friendsInstance?.friend?.id}">${friendsInstance?.friend?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${friendsInstance?.isBlocked}">
				<li class="fieldcontain">
					<span id="isBlocked-label" class="property-label"><g:message code="friends.isBlocked.label" default="Is Blocked" /></span>
					
						<span class="property-value" aria-labelledby="isBlocked-label"><g:formatBoolean boolean="${friendsInstance?.isBlocked}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${friendsInstance?.id}" />
					<g:link class="edit" action="edit" id="${friendsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
