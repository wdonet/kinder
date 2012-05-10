<%@ page import="mx.com.kinder.Municipio; mx.com.kinder.Tutor" %>

<html>
<head>
    <script type="text/javascript">
        alert('hola');
    </script>
</head>

<body>
<fieldset class="embedded"><legend><g:message code="tutor.nombre.label" default="Nombre"/></legend>

    <div class="fieldcontain ${hasErrors(bean: tutorInstance, field: 'nombre.nombres', 'error')} required">
        <label for="nombre.nombres">
            <g:message code="tutor.nombre.nombres.label" default="Nombres"/>
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="nombres" maxlength="150" required="" value="${nombreInstance?.nombres}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: tutorInstance, field: 'nombre.paterno', 'error')} required">
        <label for="nombre.paterno">
            <g:message code="tutor.nombre.paterno.label" default="Paterno"/>
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="paterno" maxlength="80" required="" value="${nombreInstance?.paterno}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: tutorInstance, field: 'nombre.materno', 'error')} ">
        <label for="nombre.materno">
            <g:message code="tutor.nombre.materno.label" default="Materno"/>
        </label>
        <g:textField name="materno" maxlength="80" value="${nombreInstance?.materno}"/>
    </div>
</fieldset>
<fieldset class="embedded">
    <legend><g:message code="tutor.direccion.label" default="Direccion"/></legend>

    <div class="fieldcontain ${hasErrors(bean: tutorInstance, field: 'direccion.calle', 'error')} required">
        <label for="direccion.calle">
            <g:message code="tutor.direccion.calle.label" default="Calle"/>
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="calle" maxlength="80" required="" value="${direccionInstance?.calle}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: tutorInstance, field: 'direccion.numeroExterior', 'error')} required">
        <label for="direccion.numeroExterior">
            <g:message code="tutor.direccion.numeroExterior.label" default="Numero Exterior"/>
            <span class="required-indicator">*</span>
        </label>
        <g:textField name="numeroExterior" maxlength="10" required=""
                     value="${direccionInstance?.numeroExterior}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: tutorInstance, field: 'direccion.numeroInterior', 'error')} ">
        <label for="direccion.numeroInterior">
            <g:message code="tutor.direccion.numeroInterior.label" default="Numero Interior"/>

        </label>
        <g:textField name="numeroInterior" maxlength="10"
                     value="${direccionInstance?.numeroInterior}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: tutorInstance, field: 'direccion.referencias', 'error')} ">
        <label for="direccion.referencias">
            <g:message code="tutor.direccion.referencias.label" default="Referencias"/>

        </label>
        <g:textArea name="referencias" cols="40" rows="5" maxlength="500"
                    value="${direccionInstance?.referencias}"/>
    </div>
</fieldset>

<div class="fieldcontain ${hasErrors(bean: tutorInstance, field: 'estado', 'error')} required">
    <label for="estado">
        <g:message code="tutor.estado.label" default="Estado"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="estado" name="estado.id" from="${mx.com.kinder.Estado.findAllByActivo(true)}"
              optionKey="id" required="" class="many-to-one"
              value="${tutorInstance?.estado?.id}"
              noSelection="${['':"${message(code:'form.select.seleccione', default:'Escoja ...')}"]}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tutorInstance, field: 'municipio', 'error')} required">
    <label for="municipio">
        <g:message code="tutor.municipio.label" default="Municipio"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="municipio" name="municipio.id"
              from="${tutorInstance?.estado?.id == null ? [] : Municipio.findAllByEstado(tutorInstance?.estado)}"
              optionKey="id" required="" class="many-to-one"
              value="${tutorInstance?.municipio?.id}"
              noSelection="${['':'Seleccione ...']}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tutorInstance, field: 'postal', 'error')} required">
    <label for="postal">
        <g:message code="tutor.postal.label" default="Postal"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="postal" name="postal.id" from="${mx.com.kinder.Postal.list()}"
              optionKey="id" required="" class="many-to-one"
              value="${tutorInstance?.postal?.id}"
              noSelection="${['':'Seleccione ...']}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tutorInstance, field: 'fechaNacimiento', 'error')} required">
    <label for="fechaNacimiento">
        <g:message code="tutor.fechaNacimiento.label" default="Fecha Nacimiento"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="fechaNacimiento" precision="day" value="${tutorInstance?.fechaNacimiento}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tutorInstance, field: 'mail', 'error')} ">
    <label for="mail">
        <g:message code="tutor.mail.label" default="Mail"/>

    </label>
    <g:field type="email" name="mail" value="${tutorInstance?.mail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tutorInstance, field: 'telefonoCasa', 'error')} ">
    <label for="telefonoCasa">
        <g:message code="tutor.telefonoCasa.label" default="Telefono Casa"/>

    </label>
    <g:textField name="telefonoCasa" value="${tutorInstance?.telefonoCasa}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tutorInstance, field: 'telefonoOficina', 'error')} ">
    <label for="telefonoOficina">
        <g:message code="tutor.telefonoOficina.label" default="Telefono Oficina"/>

    </label>
    <g:textField name="telefonoOficina" value="${tutorInstance?.telefonoOficina}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tutorInstance, field: 'telefonoCelular', 'error')} ">
    <label for="telefonoCelular">
        <g:message code="tutor.telefonoCelular.label" default="Telefono Celular"/>

    </label>
    <g:textField name="telefonoCelular" value="${tutorInstance?.telefonoCelular}"/>
</div>
</body>
</html>

