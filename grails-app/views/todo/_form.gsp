<%@ page import="grailsapp.Todo" %>



<div class="fieldcontain ${hasErrors(bean: todoInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="todo.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="4000" value="${todoInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: todoInstance, field: 'submittedBy', 'error')} ">
	<label for="submittedBy">
		<g:message code="todo.submittedBy.label" default="Submitted By" />
		
	</label>
	<g:field type="email" name="submittedBy" value="${todoInstance?.submittedBy}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: todoInstance, field: 'task', 'error')} ">
	<label for="task">
		<g:message code="todo.task.label" default="Task" />
		
	</label>
	<g:textField name="task" value="${todoInstance?.task}"/>
</div>

