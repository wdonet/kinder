package mx.com.kinder

import mx.com.kinder.dto.Nombre
import mx.com.kinder.dto.Direccion

class Tutor {

    Nombre nombre
    Estado estado
    Municipio municipio
    Postal postal
    Direccion direccion
    //para embeber los tres campos de nombres, paterno y materno en un DTO o Pojo
    // o todos los campos de la direccion en un solo DTO
    static embedded = ['nombre', 'direccion']
    Date fechaNacimiento
    String mail
    String telefonoCasa
    String telefonoOficina
    String telefonoCelular
    //, hijosDeMama: Alumno, hijosDePapa: Alumno]
//    static mappedBy = [hijosDeMama: "mama", hijosDePapa: "papa"]
    //todo foto
    //todo cuenta


    //el orden aquí declarado define el orden de los elementos en la vista
    static constraints = {
        nombre()
        direccion(nullable: false)
        estado(nullable: false)
        municipio(nullable: false)
        postal(nullable: false)
        fechaNacimiento nullable: false
        mail email: true, blank: false, nullable: true
        telefonoCasa(nullable: true, blank: false, validator: { String phone, Tutor obj ->
            if (null == phone && null == obj.getTelefonoCelular()
                    && null == obj.getTelefonoOficina()) {
                return 'Tutor.required.unTelefono'
            }
            return true
        })
        telefonoOficina(nullable: true, blank: false, validator: { String phone, Tutor obj ->
            if (null == phone && null == obj.getTelefonoCelular()
                    && null == obj.getTelefonoCasa()) {
                return 'Tutor.required.unTelefono'
            }
            return true
        })
        telefonoCelular(nullable: true, blank: false, validator: { String phone, Tutor obj ->
            if (null == phone && null == obj.getTelefonoCasa()
                    && null == obj.getTelefonoOficina()) {
                return 'Tutor.required.unTelefono'
            }
            return true
        })
    }

}
