<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-annonce" class="content scaffold-create px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.annonce}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.annonce}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <!--<g:form resource="${this.annonce}" method="POST"> -->
                <form enctype="multipart/form-data" action="/annonce/save" method="post">
                <fieldset class="form">
                    <table class="table">
                        <tbody>
                        <tr>
                            <td style="font-size: medium;"> <label for="title" class="inline-flex items-center text-gray-600 dark:text-gray-400">Titre :</label> </td>
                            <td><input name="title" type="text" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" id="title" placeholder=""></td>
                        </tr>
                        <tr>
                            <td style="font-size: medium;"> <label for="description" class="inline-flex items-center text-gray-600 dark:text-gray-400">Description :</label></td>
                            <td> <input name="description" type="text" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" id="description" placeholder=""></td>
                        </tr>

                        <tr>
                            <td style="font-size: medium;"> <label for="price" class="inline-flex items-center text-gray-600 dark:text-gray-400">Prix :</label> </td>
                            <td> <input name="price" type="text"  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" id="price" placeholder=""></td>
                        </tr>
                        <tr style="display: none">
                            <td style="font-size: medium;"> <label for="ref" class="inline-flex items-center text-gray-600 dark:text-gray-400">Ref :</label> </td>
                            <td> <input name="ref" type="text" disabled class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" id="ref" value="reference" ></td>

                        </tr>
                        <tr>
                            <sec:ifAnyGranted roles="ROLE_ADMIN">
                                <g:link controller="saleAd">
                                    <td style="font-size: medium;"> <label for="author" class="inline-flex items-center text-gray-600 dark:text-gray-400">Auteur:</label> </td>
                                    <td><g:select class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" name="author" from="${emsi.mbds.User.list()}" optionKey="id" optionValue="username"/></td>
                                </g:link>
                            </sec:ifAnyGranted>



                        </tr>
                        <tr>
                            <td> <input name="filename" type="file" class="custom-file-input" id="customFile"></td>
                            <td><img src="${grailsApplication.config.exams_mbds.illustrations.url}/${filename}"/></td>
                        </tr>
                        </tbody>
                    </table>




                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="Créer"/>
                </fieldset>
                </form>
            <!--</g:form>-->
        </div>
    </body>
</html>
