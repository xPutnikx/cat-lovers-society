<%@ page import="test.society.Friends" %>



<div class="fieldcontain ${hasErrors(bean: friendsInstance, field: 'friend', 'error')} ">
	<label for="friend">
		<g:message code="friends.friend.label" default="Friend" />
		
	</label>
	<g:select id="friend" name="friend.id" from="${test.society.User.list()}" optionKey="id" required="" value="${friendsInstance?.friend?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: friendsInstance, field: 'isBlocked', 'error')} ">
	<label for="isBlocked">
		<g:message code="friends.isBlocked.label" default="Is Blocked" />
		
	</label>
	<g:checkBox name="isBlocked" value="${friendsInstance?.isBlocked}" />
</div>

