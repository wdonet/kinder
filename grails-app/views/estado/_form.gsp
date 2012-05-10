<%@ page import="mx.com.kinder.Estado" %>



<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="estado.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="nombre" from="${estadoInstance.constraints.nombre.inList}" required="" value="${estadoInstance?.nombre}" valueMessagePrefix="estado.nombre"/>
</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="estado.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${estadoInstance?.activo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'municipios', 'error')} ">
	<label for="municipios">
		<g:message code="estado.municipios.label" default="Municipios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${estadoInstance?.municipios?}" var="m">
    <li><g:link controller="municipio" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="municipio" action="create" params="['estado.id': estadoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'municipio.label', default: 'Municipio')])}</g:link>
</li>
</ul>

</div>

