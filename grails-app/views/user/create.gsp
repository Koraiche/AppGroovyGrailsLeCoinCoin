<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>

        <div id="create-user" class="content scaffold-create px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800" role="main">
            <h1>In this section you can add a new user</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.user}" method="POST">
                <!--<fieldset class="form">
                    <f:all bean="user"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>-->


                    <div class="form-group required">
                        <label for="username">Username
                            <span class=""></span>
                        </label><input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" type="text" name="username" value="" r
                                       id="username">
                    </div>

                    <div class="form-group ">
                        <label for="password">Password
                            <span class=""></span>
                        </label><input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" type="password" name="password"  value=""
                                       id="password">
                    </div>


                <div class="form-group">
                    <label for="role">Rôle
                        <span class="required-indicator">*</span>
                    </label>
                    <g:select class="form-control" from="${emsi.mbds.Role.list()}"
                              name="role" optionKey="id" optionValue="authority"/>
                </div>

                <g:submitButton class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple" name="create"
                                value="${message(code: 'default.button.create.label', default: 'Create')}"/>
            </g:form>
        </div>
    </body>
</html>
