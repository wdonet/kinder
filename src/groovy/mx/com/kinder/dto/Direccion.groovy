package mx.com.kinder.dto

import mx.com.kinder.Estado
import mx.com.kinder.Municipio
import mx.com.kinder.Postal

/**
 * Created by IntelliJ IDEA.
 * User: wdonet
 * Date: 4/27/12
 * Time: 1:58 PM
 * To change this template use File | Settings | File Templates.
 */
class Direccion {

    private static final char ESPACIO = ' '
    private static final char SIGNO_NUMERO = '#'
    private static final char GUION_MEDIO = '-'
    private static final String COMA = ", "

    String calle
    String numeroExterior
    String numeroInterior
    String referencias

    String obtenerPorCalle(Estado estado, Municipio municipio, Postal postal,
                           conReferencias) {
        StringBuilder builder = new StringBuilder(calle)
        .append(ESPACIO)
        .append(SIGNO_NUMERO).append(numeroExterior)
        if (null != numeroInterior) {
            builder.append(GUION_MEDIO).append(numeroInterior)
        }
        builder.append(postal.getColonia()).append(COMA).append(postal.getCodigoPostal())
        .append(COMA)
        .append(municipio.getNombre())
        .append(COMA)
        .append(estado.getNombre())
        if (conReferencias) {
            builder.append(COMA).append(referencias)
        }

        return builder.toString()
    }

    static constraints = {
        calle nullable:false, blank: false, maxSize: 80
        numeroExterior nullable:false, blank: false, maxSize: 10
        numeroInterior nullable:true, blank: false, maxSize: 10
        referencias nullable:true, blank: false, maxSize: 500
    }

    static mapping = {
        calle column: 'calle'
        numeroExterior column: 'num_ext'
        numeroInterior column: 'num_int'
        referencias column: 'dir_referencias'
    }

}
