package grailsapp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TodoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Todo.list(params), model:[todoInstanceCount: Todo.count()]
    }

    def show(Todo todoInstance) {
        respond todoInstance
    }

    def create() {
        respond new Todo(params)
    }

    @Transactional
    def save(Todo todoInstance) {
        if (todoInstance == null) {
            notFound()
            return
        }

        if (todoInstance.hasErrors()) {
            respond todoInstance.errors, view:'create'
            return
        }

        todoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'todoInstance.label', default: 'Todo'), todoInstance.id])
                redirect todoInstance
            }
            '*' { respond todoInstance, [status: CREATED] }
        }
    }

    def edit(Todo todoInstance) {
        respond todoInstance
    }

    @Transactional
    def update(Todo todoInstance) {
        if (todoInstance == null) {
            notFound()
            return
        }

        if (todoInstance.hasErrors()) {
            respond todoInstance.errors, view:'edit'
            return
        }

        todoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Todo.label', default: 'Todo'), todoInstance.id])
                redirect todoInstance
            }
            '*'{ respond todoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Todo todoInstance) {

        if (todoInstance == null) {
            notFound()
            return
        }

        todoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Todo.label', default: 'Todo'), todoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'todoInstance.label', default: 'Todo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
