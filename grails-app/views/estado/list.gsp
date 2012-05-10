
<%@ page import="mx.com.kinder.Municipio; mx.com.kinder.Estado" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'estado.label', default: 'Estado')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <r:script disposition='head'>
            $(document).ready(function() {
                alert('Si funciona mi script con jQuery!')
                console.log('si puedo logear en firefox!')
            })
        </r:script>
	</head>
	<body>
		<a href="#list-estado" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-estado" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="nombre" title="${message(code: 'estado.nombre.label', default: 'Nombre')}" />
						<g:sortableColumn property="activo" title="${message(code: 'estado.activo.label', default: 'Activo')}" />
                        <th class="sortable">
                            ${message(code: 'estado.totalMunicipios.label', default: 'Total Municipios')}
                        </th>
					</tr>
                </thead>
                <tbody>
                <g:each in="${estadoInstanceList}" status="i" var="estadoInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><g:link action="show" id="${estadoInstance.id}">${fieldValue(bean: estadoInstance, field: "nombre")}</g:link></td>
                        <td><g:formatBoolean boolean="${estadoInstance.activo}" /></td>
                        <td>${Municipio.countByEstado(Estado.findById(estadoInstance.id))}</td>
                    </tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${estadoInstanceTotal}" next="&gt;" prev="&lt;"/>
			</div>
		</div>
	</body>
</html>
