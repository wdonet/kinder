package mx.com.kinder.dto

/**
 * Created by IntelliJ IDEA.
 * User: wdonet
 * Date: 4/27/12
 * Time: 1:51 PM
 * To change this template use File | Settings | File Templates.
 */
class Nombre {

    private static final char ESPACIO = ' ';

    String nombres
    String paterno
    String materno

    static constraints = {
        nombres maxSize: 150, nullable: false, blank: false
        paterno maxSize: 80, nullable: false, blank: false
        materno maxSize: 80, nullable: true, blank: false
    }
    static mapping = {
        nombres column: 'nombres'
        paterno column: 'paterno'
        materno column: 'materno'
    }

    String obtenerPorNombre() {
        return nombres + ESPACIO + paterno + ESPACIO + materno
    }

    String obtenerPorPaterno() {
        return paterno + ESPACIO + materno + ESPACIO + nombres
    }


}
