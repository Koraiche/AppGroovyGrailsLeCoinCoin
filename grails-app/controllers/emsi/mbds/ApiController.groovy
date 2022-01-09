package emsi.mbds

import grails.converters.JSON
import grails.converters.XML
import grails.plugin.springsecurity.annotation.Secured

class ApiController {
    UserService userService
    AnnonceService annonceService
    /**
     * GET / PUT / PATCH / DELETE
     * Pour une note max : Gérer la notion de role en plus de l'utilisateur
     */
    @Secured('ROLE_ADMIN')
    def user() {

        switch (request.getMethod()) {
            case "GET":
                    if (!params.id)
                        return response.status = 400
                    def userInstance = User.get(params.id)
                    if (!userInstance)
                        return response.status = 404
                    response.withFormat {
                        xml { render userInstance as XML }
                        json { render userInstance as JSON }
                    }
                break;
            case "PUT":
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = 404

                def username = request.JSON.username
                userInstance.username = username

                def password = request.JSON.password
                userInstance.password = password

                def enabled = request.JSON.enabled
                userInstance.enabled = enabled

                userService.save(userInstance)

                response.withFormat {
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }

                }
                break
            case "PATCH":
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = 404
                if(request.JSON.username)
                    userInstance.setUsername(request.JSON.username)
                if(request.JSON.password)
                    userInstance.setUsername(request.JSON.password)
                if(request.JSON.enabled)
                    userInstance.setUsername(request.JSON.enabled)

                userInstance.save()
                response.withFormat {
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }
                }
                break;
            case "DELETE":
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = 404

                User.withTransaction {
                    status ->
                        UserRole.removeAll(userInstance)
                        userService.delete(userInstance.id)
                }
                return response.status = 200

                break
            default:
                return response.status = 405
                break;
        }
        return response.status = 406
    }

    /**
     * POST / GET
     */
    @Secured('ROLE_ADMIN')
    def users() {
        switch (request.getMethod()) {
            case "GET":

                def userInstance = User.getAll()
                if (!userInstance)
                    return response.status = 404
                response.withFormat {
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }
                }

                break
            case "POST":
                def userInstance = new User(
                        username: request.JSON.username,
                        password: request.JSON.password,
                )
                if (!userInstance.save(flush:true))
                    return response.status = 400
                if(request.JSON.role)
                    UserRole.create(userInstance, Role.get(request.JSON.role),true)
                else
                    UserRole.create(userInstance, Role.get('ROLE_CLIENT'),true)
                response.withFormat{
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }
                }

                break

        }

    }
    /**
     * GET / PUT / PATCH / DELETE
     */
    @Secured(['ROLE_ADMIN','ROLE_MODO'])
    def annonce()  {
        switch(request.getMethod()) {
            case "GET":
                if (!params.id)
                    return response.status = 400
                def annonceInstance = Annonce.get(params.id)
                if (!annonceInstance){
                    return response.status = 404
                }
                response.withFormat {
                    xml { render annonceInstance as XML}
                    json { render annonceInstance as JSON }
                }
                break
            case "PUT":
                if (!params.id)
                    return response.status = 400
                def annonceInstance = Annonce.get(params.id)
                if (!annonceInstance)
                    return response.status = 404

                def title = request.JSON.title
                annonceInstance.title = title

                def description = request.JSON.description
                annonceInstance.description = description

                def price = request.JSON.price
                annonceInstance.price = price

                annonceInstance.save(flush :true)

                response.withFormat {
                    xml { render annonceInstance as XML }
                    json { render annonceInstance as JSON }
                }
                break
            case "PATCH":
                if (!params.id)
                    return response.status = 400
                def annonceInstance = Annonce.get(params.id)
                if (!annonceInstance)
                    return response.status = 404
                if(request.JSON.title != null)
                    annonceInstance.title = request.JSON.title
                if(request.JSON.description != null)
                    annonceInstance.description = request.JSON.description
                annonceService.save(annonceInstance)
                response.withFormat {
                    xml { render annonceInstance as XML }
                    json { render annonceInstance as JSON }
                }
                break
            case "DELETE":
                if (!params.id)
                    return response.status = 400
                def annonceInstance = Annonce.get(params.id)
                if (!annonceInstance)
                    return response.status = 404
                def userInstance = annonceInstance.author
                userInstance.delete()
                return response.status = 200
            default:
                return response.status = 405
                break
        }
        return response.status = 406


    }

    /**
     * POST / GET
     * Pour une note maximale : gérer la notion d'illustration
     */
    @Secured(['ROLE_ADMIN','ROLE_MODO'])
    def annonces() {
        switch (request.getMethod()) {
            case "GET":
                def annonceInstance = Annonce.getAll()
                if (!annonceInstance)
                    return response.status = 404
                response.withFormat {
                    xml { render annonceInstance as XML }
                    json { render annonceInstance as JSON }

                }


                break

            case "POST":
                def annonceInstance = new Annonce(
                        title: request.JSON.title,
                        description: request.JSON.description,
                        price: request.JSON.price,
                        ref: request.JSON.ref
                )
                if (!annonceInstance)
                    return response.status = 404

                def id = request.JSON.author
                System.out.println("---------------------------------------")
                System.out.println(id)
                def userInstance = User.get(id)
                userInstance.addToAnnonces(annonceInstance)
                def ill = request.JSON.illustrations

                for(i in ill){
                    def a = Illustration.get(i["id"])
                    System.out.println(a)
                    if(a) {
                        annonceInstance.addToIllustrations(a)
                        System.out.println(a)
                    }
                }
                annonceInstance.save(flush: true)
                userInstance.save(flush: true)

                return response.status = 201

                break

        }
    }
}

