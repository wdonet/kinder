package mx.com.kinder

class Estado {

    String nombre
    Boolean activo

    static hasMany = [municipios : Municipio]

    static constraints = {
        nombre maxSize: 100, nullable: false, blank: false, inList:
        ["Aguascalientes", "Baja California", "Baja California Sur", "Campeche",
                "Coahuila de Zaragoza", "Colima", "Chiapas", "Chihuahua", "Distrito Federal",
                "Durango", "Guanajuato", "Guerrero", "Hidalgo", "Jalisco", "Mexico",
                "Michoacan de Ocampo", "Morelos", "Nayarit", "Nuevo Leon", "Oaxaca", "Puebla",
                "Queretaro de Arteaga", "Quintana Roo", "San Luis Potosi", "Sinaloa", "Sonora",
                "Tabasco", "Tamaulipas", "Tlaxcala", "Veracruz", "Yucatan", "Zacatecas"]
        activo nullable: false
    }

    //Ayuda al despliegue de su valor en selects como valor por defecto
    @Override
    String toString() {
        return id + ' : ' + nombre
    }

}
