package mx.com.kinder

class Grupo {

    String nombre
    Integer gradoEscolar

    static constraints = {
        nombre maxSize: 20, nullable: false, blank: false
        gradoEscolar range: 1..3, nullable: false
    }
}
