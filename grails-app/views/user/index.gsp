<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="list-user" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="w-full mb-8 overflow-hidden rounded-lg shadow-xs">
                <div class="w-full overflow-x-auto">
                    <table class="w-full whitespace-no-wrap">
                        <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                            <th class="px-3 py-2">Username</th>
                            <th class="px-3 py-2">Account Expired</th>
                            <th class="px-3 py-2">Account Locked</th>
                            <th class="px-3 py-2">Password Expired</th>
                            <th class="px-3 py-2">Enabled</th>
                            <th class="px-3 py-2">Edit</th>
                            <th class="px-3 py-2">Show</th>
                            <th class="px-3 py-2">Delete</th>

                        </tr>
                        <tbody
                                class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                        >
                        <g:each in="${userList}">
                            <tr class="text-gray-700 dark:text-gray-400">
                                <td class="px-3 py-2">${it.username}</td>
                                <td class="px-3 py-2">${it.accountExpired}</td>
                                <td class="px-3 py-2">${it.accountLocked}</td>
                                <td class="px-3 py-2">${it.passwordExpired}</td>
                                <td class="px-3 py-2">${it.enabled}</td>
                                <td class="px-3 py-2"><g:link controller='user' action='edit' id='${it.id}'
                                                                  class="btn btn-success">
                                    <span class="fa fa-pencil"></span></g:link></td>
                                <td class="px-3 py-2"><g:link controller='user' action='show' id='${it.id}'
                                                              class="btn btn-primary"><span class="fa fa-eye"></span></g:link></td>
                                <td class="px-3 py-2">
                                    <g:form resource="${it}" method="DELETE">
                                        <button class="btn btn-danger" type="submit"
                                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Êtes-vous sur ?')}');">
                                            <span class="fa fa-trash"></span>
                                        </button>
                                    </g:form>

                                </td>

                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800 flex col-span-4 mt-2 sm:mt-auto sm:justify-end ">>
                <g:paginate total="${userCount ?: 0}" />
            </div>
        </div>
    </body>
</html>