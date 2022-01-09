<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <div class="" role="navigation">
        <div style="margin-top:10px" role="navigation">
            <ul>
                <li><button class="px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"><g:link class="" action="index">Back</g:link></button></li>

            </ul>
        </div>
    </div>
        <div id="edit-user" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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


            <g:form resource="${this.user}" method="PUT">
                <g:hiddenField name="version" value="${this.user?.version}" />

                <div class="form-group required">
                    <label for="username">Username
                        <span class=""></span>
                    </label><input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" type="text" name="username"  r
                                   id="username" value="${user.username}">
                </div>

                <div class="form-group ">
                    <label for="password">Password
                        <span class=""></span>
                    </label><input class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" type="password" name="password"  value=""
                                   id="password">
                </div>

                <div class="form-group ">
                    <label for="accountExpired">Account Expired
                        <span class=""></span>
                    </label>
                    <g:checkBox id="accountExpired" name="accountExpired" value="${user.accountExpired}" class="text-purple-600 form-checkbox focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" />
                </div>
                <div class="form-group ">
                    <label for="accountLocked">Account Locked
                        <span class=""></span>
                    </label>
                    <g:checkBox id="accountLocked" name="accountLocked" value="${user.accountLocked}" class="text-purple-600 form-checkbox focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" />
                </div>
                <div class="form-group ">
                    <label for="passwordExpired">Password Expired
                        <span class=""></span>
                    </label>
                    <g:checkBox id="passwordExpired" name="passwordExpired" value="${user.passwordExpired}" class="text-purple-600 form-checkbox focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" />
                </div>
                <div class="form-group ">
                    <label for="enabled">Enabled
                        <span class=""></span>
                    </label>
                    <g:checkBox id="enabled" name="enabled" value="${user.enabled}" class="text-purple-600 form-checkbox focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" />
                </div>
                <div class="form-group">
                    <label for="role">Rôle
                        <span class="required-indicator">*</span>
                    </label>
                    <g:select class="form-control" from="${emsi.mbds.Role.list()}"
                              name="role" optionKey="id" optionValue="authority"  />
                </div>
                <div class="">
                    <input class="px-10 py-4 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple" type="submit" value="Update"/>
                </div>
            </g:form>
        </div>
    </body>
</html>
