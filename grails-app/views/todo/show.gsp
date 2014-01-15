
<%@ page import="grailsapp.Todo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'todo.label', default: 'Todo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-todo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-todo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list todo">
			
				<g:if test="${todoInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="todo.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${todoInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${todoInstance?.submittedBy}">
				<li class="fieldcontain">
					<span id="submittedBy-label" class="property-label"><g:message code="todo.submittedBy.label" default="Submitted By" /></span>
					
						<span class="property-value" aria-labelledby="submittedBy-label"><g:fieldValue bean="${todoInstance}" field="submittedBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${todoInstance?.task}">
				<li class="fieldcontain">
					<span id="task-label" class="property-label"><g:message code="todo.task.label" default="Task" /></span>
					
						<span class="property-value" aria-labelledby="task-label"><g:fieldValue bean="${todoInstance}" field="task"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:todoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${todoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
