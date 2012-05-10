package mx.com.kinder

class Postal {

    String codigoPostal
    String colonia

    static belongsTo = [municipio: Municipio]

    static constraints = {
        codigoPostal minSize: 5, maxSize: 5, nullable: false, blank: false
        colonia maxSize: 100, nullable: false, unique: true, blank: false
        municipio nullable: false
    }

    //Ayuda al despliegue de su valor en selects como valor por defecto
    @Override
    String toString() {
        return codigoPostal + ' : ' + colonia
    }

}
