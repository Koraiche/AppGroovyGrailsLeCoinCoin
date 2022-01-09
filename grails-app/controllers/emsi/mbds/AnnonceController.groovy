package emsi.mbds

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*


@Secured(['ROLE_ADMIN','ROLE_MODO'])
class AnnonceController {

    AnnonceService annonceService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    @Secured(['ROLE_CLIENT','ROLE_ADMIN','ROLE_MODO'])
    def index(Integer max, String mot) {
        //params.max = Math.min(max ?: 10, 100)
        System.out.println("-------------------------------------------")
        System.out.println(mot)
        System.out.println("-------------------------------------------")
        if(mot!=null){
            def l = annonceService.list()
            def l2 = new ArrayList<Annonce>()
            for (i in annonceService.list(params)){
                if(i.title.toLowerCase().contains(mot.toLowerCase())){
                    l2.add(i)
                    System.out.println("added")
                }
            }
            System.out.println(l2.toString())
            System.out.println("-------------------------------------------")
            System.out.println(l2.size())
            System.out.println("-------------------------------------------")
            respond l2, model:[annonceCount: l2.size()]
            return
        }
        params.max = Math.min(max ?: 10, 100)
        System.out.println(annonceService.list(params))
        System.out.println(annonceService.count())
        //respond annonceService.list(params), model:[annonceCount: annonceService.count()]
        respond annonceService.list(params), model:[annonceCount: annonceService.count()]
    }
    @Secured(['ROLE_CLIENT','ROLE_ADMIN','ROLE_MODO'])
    def show(Long id) {
        respond annonceService.get(id)
    }

    def create() {
        respond new Annonce(params)
    }

    def save(Annonce annonce) {
        if (annonce == null) {
            notFound()
            return
        }

        try {
            def a = annonce.getId()
            def b = annonce.getAuthor().getUsername()
            annonce.setRef("#" + a + ":" +b)
            def ann = annonceService.save(annonce)
            def aa = ann.getId()
            def bb = ann.getAuthor().getUsername()
            ann.setRef("#" + aa + ":" +bb)
            ann = annonceService.save(ann)

            def f = request.getFile('filename')
            if (f.empty) {
                System.out.println("file cannot be empty")
                flash.message = 'file cannot be empty'
                redirect action: 'create'
                return
            }


            String nomDeFichier = UUID.randomUUID().toString() + '.png'

            def file = new File(grailsApplication.config.exams_mbds.illustrations.path + nomDeFichier)
            System.out.println(grailsApplication.config.exams_mbds)
            System.out.println(grailsApplication.config.getProperty('exams_mbds'))

            while (file.exists()) {
                nomDeFichier = UUID.randomUUID().toString() + '.png';
                file = new File(grailsApplication.config.exams_mbds.illustrations.path + nomDeFichier)
            }
            System.out.println(nomDeFichier)
            f.transferTo(file)


            def illustrationInstance = new Illustration(filename: nomDeFichier)


            ann.addToIllustrations(illustrationInstance)


            annonceService.save(ann)
        } catch (ValidationException e) {
            respond annonce.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*' { respond annonce, [status: CREATED] }
        }
    }
    @Secured(['ROLE_CLIENT','ROLE_ADMIN','ROLE_MODO'])
    def edit(Long id) {
        respond annonceService.get(id)
    }
    @Secured(['ROLE_CLIENT','ROLE_ADMIN','ROLE_MODO'])
    def update(Annonce annonce) {
        if (annonce == null) {
            notFound()
            return
        }

        try {
            def f = request.getFile('filename')
            if (f.empty) {
                System.out.println("file cannot be empty")
                flash.message = 'file cannot be empty'
                redirect action: 'create'
                return
            }
            String nomDeFichier = UUID.randomUUID().toString() + '.png'

            def file = new File(grailsApplication.config.exams_mbds.illustrations.path + nomDeFichier)
            System.out.println(grailsApplication.config.exams_mbds)
            System.out.println(grailsApplication.config.getProperty('exams_mbds'))

            while (file.exists()) {
                nomDeFichier = UUID.randomUUID().toString() + '.png';
                file = new File(grailsApplication.config.exams_mbds.illustrations.path + nomDeFichier)
            }
            System.out.println(nomDeFichier)
            f.transferTo(file)


            def illustrationInstance = new Illustration(filename: nomDeFichier)


            ann.addToIllustrations(illustrationInstance)


            annonceService.save(ann)
        } catch (ValidationException e) {
            respond annonce.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*'{ respond annonce, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        annonceService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'annonce.label', default: 'Annonce'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'annonce.label', default: 'Annonce'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
