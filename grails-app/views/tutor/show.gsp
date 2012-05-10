
<%@ page import="mx.com.kinder.Tutor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tutor.label', default: 'Tutor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tutor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tutor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tutor">
			
				<g:if test="${tutorInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="tutor.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${tutorInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tutorInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="tutor.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${tutorInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tutorInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="tutor.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:link controller="estado" action="show" id="${tutorInstance?.estado?.id}">${tutorInstance?.estado?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tutorInstance?.municipio}">
				<li class="fieldcontain">
					<span id="municipio-label" class="property-label"><g:message code="tutor.municipio.label" default="Municipio" /></span>
					
						<span class="property-value" aria-labelledby="municipio-label"><g:link controller="municipio" action="show" id="${tutorInstance?.municipio?.id}">${tutorInstance?.municipio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tutorInstance?.postal}">
				<li class="fieldcontain">
					<span id="postal-label" class="property-label"><g:message code="tutor.postal.label" default="Postal" /></span>
					
						<span class="property-value" aria-labelledby="postal-label"><g:link controller="postal" action="show" id="${tutorInstance?.postal?.id}">${tutorInstance?.postal?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tutorInstance?.fechaNacimiento}">
				<li class="fieldcontain">
					<span id="fechaNacimiento-label" class="property-label"><g:message code="tutor.fechaNacimiento.label" default="Fecha Nacimiento" /></span>
					
						<span class="property-value" aria-labelledby="fechaNacimiento-label"><g:formatDate date="${tutorInstance?.fechaNacimiento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tutorInstance?.mail}">
				<li class="fieldcontain">
					<span id="mail-label" class="property-label"><g:message code="tutor.mail.label" default="Mail" /></span>
					
						<span class="property-value" aria-labelledby="mail-label"><g:fieldValue bean="${tutorInstance}" field="mail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tutorInstance?.telefonoCasa}">
				<li class="fieldcontain">
					<span id="telefonoCasa-label" class="property-label"><g:message code="tutor.telefonoCasa.label" default="Telefono Casa" /></span>
					
						<span class="property-value" aria-labelledby="telefonoCasa-label"><g:fieldValue bean="${tutorInstance}" field="telefonoCasa"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tutorInstance?.telefonoOficina}">
				<li class="fieldcontain">
					<span id="telefonoOficina-label" class="property-label"><g:message code="tutor.telefonoOficina.label" default="Telefono Oficina" /></span>
					
						<span class="property-value" aria-labelledby="telefonoOficina-label"><g:fieldValue bean="${tutorInstance}" field="telefonoOficina"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tutorInstance?.telefonoCelular}">
				<li class="fieldcontain">
					<span id="telefonoCelular-label" class="property-label"><g:message code="tutor.telefonoCelular.label" default="Telefono Celular" /></span>
					
						<span class="property-value" aria-labelledby="telefonoCelular-label"><g:fieldValue bean="${tutorInstance}" field="telefonoCelular"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tutorInstance?.id}" />
					<g:link class="edit" action="edit" id="${tutorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
