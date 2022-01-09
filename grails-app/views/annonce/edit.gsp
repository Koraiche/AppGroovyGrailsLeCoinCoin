<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="" role="navigation">
            <div style="margin-top:10px" role="navigation">
                <ul>
                    <li><button class="px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"><g:link class="" action="index">Back</g:link></button></li>

                </ul>
            </div>
        </div>
        <div id="edit-annonce" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
            <g:form resource="${this.annonce}" enctype="multipart/form-data" method="POST" >
                <g:hiddenField name="version" value="${this.annonce?.version}"/>
            <!--   <form enctype="multipart/form-data" action="/annonce/update" method="PUT">-->
               <fieldset class="form">
                   <table class="table">
                       <tr>
                           <td style="font-size: medium;"><label for="title" class="inline-flex items-center text-gray-600 dark:text-gray-400">Titre :</label></td>
                           <td><input name="title" type="text" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" id="title" value="${annonce.title}"></td>
                        </tr>
                        <tr>
                            <td style="font-size: medium;"><label for="description" class="inline-flex items-center text-gray-600 dark:text-gray-400">Description :</label></td>
                            <td><input name="description" type="text" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" id="description"
                                       value="${annonce.description}"></td>
                        </tr>
                        <tr>
                            <td style="font-size: medium;"><label for="price" class="inline-flex items-center text-gray-600 dark:text-gray-400">Prix :</label></td>
                            <td><input name="price" type="text" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" id="price"
                             value="<g:formatNumber number="${annonce.price}" type="number" maxFractionDigits="4" />"></td>
                        </tr>
                        <tr><sec:ifAnyGranted roles="ROLE_ADMIN">
                            <td style="font-size: medium;"><label for="author" class="inline-flex items-center text-gray-600 dark:text-gray-400">Auteur:</label></td>

                            <td><g:select name="author" from="${emsi.mbds.User.list()}" optionKey="id" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                          optionValue="username"/></td>
                        </sec:ifAnyGranted>
                            <sec:ifAnyGranted roles="ROLE_CLIENT">
                                <td style="font-size: medium;"><label for="author" class="inline-flex items-center text-gray-600 dark:text-gray-400">Auteur:</label></td>

                                <td><input disabled name="author" type="text" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" id="author"
                                           value="${annonce.author.username}">
                                </td>
                            </sec:ifAnyGranted>

                        </tr>
                        %{--}<tr>
                            <td style="font-size: medium;"><label for="price">Image(s) sélectionnées :</label></td>
                            <td><g:each in="${saleAd.illustrations}" var="image">
                                <img style="height: 100px;"
                                     src="${grailsApplication.config.projet1_test.illustrations.url}${image.filename}"
                                     alt="Images"/>
                            </g:each></td>
                        </tr>--}%
                    </table>
                    <table class="table borderless">
                        <tr>
                            <td style="font-size: medium;"><label for="customFile" class="inline-flex items-center text-gray-600 dark:text-gray-400">Choisir une image :</label></td>
                            <td><input name="filename" type="file" class="custom-file-input" id="customFile"></td>
                        </tr>
                    </table>

                </fieldset>

                <div class="">
                    <input class="px-10 py-4 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple" type="submit" value="Update"/>
                </div>
                <!--</form>-->
            </g:form>
        </div>
    </body>
</html>
