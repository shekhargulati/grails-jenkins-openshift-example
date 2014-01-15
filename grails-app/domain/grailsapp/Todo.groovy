package grailsapp

class Todo {

    String task
    String description
    String submittedBy

    static constraints = {
        description nullable: true,maxSize: 4000
        submittedBy email: true
    }
}
