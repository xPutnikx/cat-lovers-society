<%@ page import="test.society.MessageItem" %>



<div class="fieldcontain ${hasErrors(bean: messageItemInstance, field: 'from', 'error')} ">
    <label for="from">
        <g:message code="messageItem.from.label" default="From" />

    </label>
    <g:textField name="from" value="${messageItemInstance?.from}" />
</div>

<div class="fieldcontain ${hasErrors(bean: messageItemInstance, field: 'text', 'error')} ">
    <label for="text">
        <g:message code="messageItem.text.label" default="Text" />

    </label>
    <g:textField name="text" value="${messageItemInstance?.text}" />
</div>

<div class="fieldcontain ${hasErrors(bean: messageItemInstance, field: 'time', 'error')} ">
    <label for="time">
        <g:message code="messageItem.time.label" default="Time" />

    </label>
    <g:datePicker name="time" precision="day" value="${messageItemInstance?.time}" />
</div>

<div class="fieldcontain ${hasErrors(bean: messageItemInstance, field: 'to', 'error')} ">
    <label for="to">
        <g:message code="messageItem.to.label" default="To" />

    </label>
    <g:textField name="to" value="${messageItemInstance?.to}" />
</div>

