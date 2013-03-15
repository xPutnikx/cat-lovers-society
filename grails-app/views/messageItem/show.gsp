
<%@ page import="test.society.MessageItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'messageItem.label', default: 'MessageItem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-messageItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-messageItem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list messageItem">
			
				<g:if test="${messageItemInstance?.from}">
				<li class="fieldcontain">
					<span id="from-label" class="property-label"><g:message code="messageItem.from.label" default="From" /></span>
					
						<span class="property-value" aria-labelledby="from-label"><g:fieldValue bean="${messageItemInstance}" field="from"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageItemInstance?.text}">
				<li class="fieldcontain">
					<span id="text-label" class="property-label"><g:message code="messageItem.text.label" default="Text" /></span>
					
						<span class="property-value" aria-labelledby="text-label"><g:fieldValue bean="${messageItemInstance}" field="text"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageItemInstance?.time}">
				<li class="fieldcontain">
					<span id="time-label" class="property-label"><g:message code="messageItem.time.label" default="Time" /></span>
					
						<span class="property-value" aria-labelledby="time-label"><g:formatDate date="${messageItemInstance?.time}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${messageItemInstance?.to}">
				<li class="fieldcontain">
					<span id="to-label" class="property-label"><g:message code="messageItem.to.label" default="To" /></span>
					
						<span class="property-value" aria-labelledby="to-label"><g:fieldValue bean="${messageItemInstance}" field="to"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${messageItemInstance?.id}" />
					<g:link class="edit" action="edit" id="${messageItemInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
