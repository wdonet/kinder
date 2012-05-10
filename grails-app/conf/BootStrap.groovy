import mx.com.kinder.Estado
import mx.com.kinder.Municipio
import mx.com.kinder.Postal

class BootStrap {

    def init = { servletContext ->
        environments {
            development {
                List activos = ["Distrito Federal", "Mexico"]
                if (!Estado.count()) {
                    ["Aguascalientes", "Baja California", "Baja California Sur", "Campeche",
                            "Coahuila de Zaragoza", "Colima", "Chiapas", "Chihuahua", "Distrito Federal",
                            "Durango", "Guanajuato", "Guerrero", "Hidalgo", "Jalisco", "Mexico",
                            "Michoacan de Ocampo", "Morelos", "Nayarit", "Nuevo Leon", "Oaxaca", "Puebla",
                            "Queretaro de Arteaga", "Quintana Roo", "San Luis Potosi", "Sinaloa", "Sonora",
                            "Tabasco", "Tamaulipas", "Tlaxcala", "Veracruz", "Yucatan", "Zacatecas"].each {
                        new Estado(nombre: it, activo: activos.contains(it))
                        .save(failOnError: true)
                    }
                }
                if (!Municipio.count()) {
                    //las del DF
                    Estado estado = Estado.findByNombre("Distrito Federal")
                    ["Alvaro Obregon", "Azcapotzalco","Benito Juarez","Coyoacan","Cuajimalpa de Morelos",
                            "Cuauhtemoc","Gustavo A. Madero","Iztacalco","Iztapalapa",
                            "La Magdalena Contreras","Miguel Hidalgo","Milpa Alta","Tlahuac","Tlalpan",
                            "Venustiano Carranza","Xochimilco"].each {
                        new Municipio(nombre: it, estado: estado).save(failOnError: true)
                    }
                    //las de Mexico (faltan)
                    estado = Estado.findByNombre("Mexico")
                    ["Acambay", "Acolman"].each {
                        new Municipio(nombre: it, estado: estado).save(failOnError: true)
                    }
                }
                if (!Postal.count()) {
                    //las de Iztapalapa (faltan)
                    Municipio municipio = Municipio.findByNombre("Iztapalapa")
                    [["09720","La Era"],["09800","Pueblo Culhuacan"],
                     ["09850","San Nicolas Tolentino"],["09850","Vikingos"]].each {
                        new Postal(codigoPostal: it[0], colonia: it[1], municipio: municipio)
                        .save(failOnError: true)
                    }
                    //las de Iztacalco (faltan)
                    municipio = Municipio.findByNombre("Iztacalco")
                    [["08010","Ex-Ejido de la Magadalena Mixiuhca"],["08910","Santa Cruz"],
                     ["08000","Gabriel Ramos Millan Seccion Bramadero"]].each {
                        new Postal(codigoPostal: it[0], colonia: it[1], municipio: municipio)
                        .save(failOnError: true)
                    }
                    //las de Acambay (faltan)
                    municipio = Municipio.findByNombre("Acambay")
                    [["50314","Santa Maria las Arenas"],["50315","Las Palomas"]].each {
                        new Postal(codigoPostal: it[0], colonia: it[1], municipio: municipio)
                        .save(failOnError: true)
                    }
                    //las de Acolman (faltan)
                    municipio = Municipio.findByNombre("Acolman")
                    [["55870","Santa Agustin Acolman de Nezahualcoyotl"]].each {
                        new Postal(codigoPostal: it[0], colonia: it[1], municipio: municipio)
                        .save(failOnError: true)
                    }
                }
            }
        }
    }
    def destroy = {}
}
