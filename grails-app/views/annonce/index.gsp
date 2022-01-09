<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <style>
            a{

            }
        </style>
    </head>
    <body>
        <a href="#list-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <!--
    <div class="" >
        <ul>
            <li>
                <button class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
                    <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
                </button>
            </li>
            <li>
                <button class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
                    <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
                </button>
            </li>
        </ul>
    </div> -->

    <div id="list-annonce" class="content scaffold-list" role="main" style="display:inline-block">
        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <div class="w-full mb-8 overflow-hidden rounded-lg shadow-xs">
            <div class="w-full overflow-x-auto">
                <table class="w-full whitespace-no-wrap">
            <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
            <th class="px-3 py-2">title</th>
            <th class="px-3 py-2">Description</th>
            <th class="px-3 py-2">Price</th>
            <th class="px-3 py-2"> Reference</th>
            <th class="px-3 py-2">status</th>
            <th class="px-3 py-2">Illustrations</th>
            <th class="px-3 py-2">Author</th>
                <th class="px-3 py-2">Edit</th>
                <th class="px-3 py-2">Show</th>
                <th class="px-3 py-2">Delete</th>
            </tr>
                    <tbody
                            class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                    >
            <g:each in="${annonceList}">
                <tr class="text-gray-700 dark:text-gray-400">
                    <td class="px-3 py-2">${it.title}</td>
                    <td class="px-3 py-2">${it.description}</td>
                    <td class="px-3 py-2">${it.price}</td>
                    <td class="px-3 py-2">${it.ref}</td>
                    <td class="px-3 py-2">${it.status}</td>
                    <td class="px-3 py-2">
                        <g:each in="${it.illustrations}" var="image">
                            <img style="height: 100px;" src="${grailsApplication.config.exams_mbds.illustrations.url}${image.filename}" alt="Images" />
                        </g:each>

                    </td>
                    <td class="px-3 py-2">${it.author.username}</td>
                    <td class="px-3 py-2">
                        <g:if test="${it.author.username.equals(sec.loggedInUserInfo(field: 'username').toString()) || sec.loggedInUserInfo(field: 'username') == 'admin' || sec.loggedInUserInfo(field: 'username') == 'modo'}">
                            <g:link controller='annonce' action='edit' id='${it.id}'                                                  class="btn btn-success">
                            <span class="fa fa-pencil"></span></g:link>


                        </g:if>
                    </td>
                    <td class="px-3 py-2"><g:link controller='annonce' action='show' id='${it.id}'
                                                  class="btn btn-primary"><span class="fa fa-eye"></span></g:link></td>
                    <td class="px-3 py-2">
                        <sec:ifLoggedIn>
                            <sec:ifAnyGranted roles="ROLE_ADMIN">
                        <g:form resource="${it}" method="DELETE">
                            <button class="btn btn-danger" type="submit"
                                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Êtes-vous sur ?')}');">
                                <span class="fa fa-trash"></span>
                            </button>
                        </g:form>
                            </sec:ifAnyGranted>
                        </sec:ifLoggedIn>

                    </td>
                </tr>
            </g:each>
                    </tbody>
        </table>
            </div>
        </div>


    </div>
        <div class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800 flex col-span-4 mt-2 sm:mt-auto sm:justify-end ">
            <g:paginate total="${annonceCount ?: 0}" />
        </div>

    </body>
</html>