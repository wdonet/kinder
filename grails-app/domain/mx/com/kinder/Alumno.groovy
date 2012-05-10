package mx.com.kinder

import mx.com.kinder.dto.Nombre
import mx.com.kinder.dto.Direccion

class Alumno {

    Nombre nombre
    Date fechaNacimiento
    Grupo grupo
    Tutor papa
    Tutor mama
    Direccion direccion
    Estado estado
    Municipio municipio
    Postal postal
    //todo foto

    static embedded = ['nombre', 'direccion']

    static constraints = {
        nombre()
        grupo()
        fechaNacimiento()
        papa (nullable: true, validator: {Tutor tutor, Alumno obj ->
            if (null == tutor && null == obj.getMama()) {
                return 'Alumno.required.unTutor'
            }
            return true
        })
        mama (nullable: true, validator: {Tutor tutor, Alumno obj ->
            if (null == tutor && null == obj.getPapa()) {
                return 'Alumno.required.unTutor'
            }
            return true
        })
        direccion(nullable: false)
        estado(nullable: false)
        municipio(nullable: false)
        postal(nullable: false)
    }

}
