package mx.com.kinder

class Municipio {

    String nombre

    static belongsTo = [estado: Estado]

    static hasMany = [postales : Postal]

    static constraints = {
        nombre maxSize: 100, nullable: false, blank: false
        estado nullable: false
    }

    //Ayuda al despliegue de su valor en selects como valor por defecto
    @Override
    String toString() {
        return id + ' : ' + nombre
    }

}
