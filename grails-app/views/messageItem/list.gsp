
<%@ page import="test.society.MessageItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'messageItem.label', default: 'MessageItem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-messageItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-messageItem" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="from" title="${message(code: 'messageItem.from.label', default: 'From')}" />
					
						<g:sortableColumn property="text" title="${message(code: 'messageItem.text.label', default: 'Text')}" />
					
						<g:sortableColumn property="time" title="${message(code: 'messageItem.time.label', default: 'Time')}" />
					
						<g:sortableColumn property="to" title="${message(code: 'messageItem.to.label', default: 'To')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${messageItemInstanceList}" status="i" var="messageItemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${messageItemInstance.id}">${fieldValue(bean: messageItemInstance, field: "from")}</g:link></td>
					
						<td>${fieldValue(bean: messageItemInstance, field: "text")}</td>
					
						<td><g:formatDate date="${messageItemInstance.time}" /></td>
					
						<td>${fieldValue(bean: messageItemInstance, field: "to")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${messageItemInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
