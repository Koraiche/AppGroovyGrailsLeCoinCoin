<!--<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title><g:message code='springSecurity.login.title'/></title>
    <style type="text/css" media="screen">
    #login {
        margin: 15px 0px;
        padding: 0px;
        text-align: center;
    }

    #login .inner {
        width: 340px;
        padding-bottom: 6px;
        margin: 60px auto;
        text-align: left;
        border: 1px solid #aab;
        background-color: #f0f0fa;
        -moz-box-shadow: 2px 2px 2px #eee;
        -webkit-box-shadow: 2px 2px 2px #eee;
        -khtml-box-shadow: 2px 2px 2px #eee;
        box-shadow: 2px 2px 2px #eee;
    }

    #login .inner .fheader {
        padding: 18px 26px 14px 26px;
        background-color: #f7f7ff;
        margin: 0px 0 14px 0;
        color: #2e3741;
        font-size: 18px;
        font-weight: bold;
    }

    #login .inner .cssform p {
        clear: left;
        margin: 0;
        padding: 4px 0 3px 0;
        padding-left: 105px;
        margin-bottom: 20px;
        height: 1%;
    }

    #login .inner .cssform input[type="text"] {
        width: 120px;
    }

    #login .inner .cssform label {
        font-weight: bold;
        float: left;
        text-align: right;
        margin-left: -105px;
        width: 110px;
        padding-top: 3px;
        padding-right: 10px;
    }

    #login #remember_me_holder {
        padding-left: 120px;
    }

    #login #submit {
        margin-left: 15px;
    }

    #login #remember_me_holder label {
        float: none;
        margin-left: 0;
        text-align: left;
        width: 200px
    }

    #login .inner .login_message {
        padding: 6px 25px 20px 25px;
        color: #c33;
    }

    #login .inner .text_ {
        width: 120px;
    }

    #login .inner .chk {
        height: 12px;
    }
    </style>
</head>

<body>
<div id="login">
    <div class="inner">
        <div class="fheader"><g:message code='springSecurity.login.header'/></div>

        <g:if test='${flash.message}'>
            <div class="login_message">${flash.message}</div>
        </g:if>

        <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
            <p>
                <label for="username"><g:message code='springSecurity.login.username.label'/>:</label>
                <input type="text" class="text_" name="${usernameParameter ?: 'username'}" id="username"/>
            </p>

            <p>
                <label for="password"><g:message code='springSecurity.login.password.label'/>:</label>
                <input type="password" class="text_" name="${passwordParameter ?: 'password'}" id="password"/>
            </p>

            <p id="remember_me_holder">
                <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                <label for="remember_me"><g:message code='springSecurity.login.remember.me.label'/></label>
            </p>

            <p>
                <input type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}"/>
            </p>
        </form>
    </div>
</div>
<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>
-->

<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><g:message code='springSecurity.login.title'/></title>

</head>
<body>
<div class="fheader"><g:message code='springSecurity.login.header'/></div>
<div id="login" class="flex items-center min-h-screen p-6 bg-gray-50 dark:bg-gray-900">

    <g:if test='${flash.message}'>
        <div class="login_message">${flash.message}</div>
    </g:if>
    <div
            class="flex-1 h-full max-w-4xl mx-auto overflow-hidden bg-white rounded-lg shadow-xl dark:bg-gray-800"
    >
        <div class="flex flex-col overflow-y-auto md:flex-row">
            <div class="h-32 md:h-auto md:w-1/2">

                <asset:image   aria-hidden="true" class="object-cover w-full h-full dark:hidden" src="login-office.jpeg"  alt="Office"/>
                <asset:image  aria-hidden="true"  class="hidden object-cover w-full h-full dark:block" src="login-office-dark.jpeg"  alt="Office" />
            </div>
            <div class="flex items-center justify-center p-6 sm:p-12 md:w-1/2">

                <div class="w-full">
                    <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
                    <h1
                            class="mb-4 text-xl font-semibold text-gray-700 dark:text-gray-200"
                    >
                        Login
                    </h1>
                    <label class="block text-sm">
                        <label for="username" class="text-gray-700 dark:text-gray-400"><g:message code='springSecurity.login.username.label'/>:</label>
                        <input
                                type="text"
                                class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                placeholder="Jane Doe"
                                name="${usernameParameter ?: 'username'}" id="username"/>

                    </label>
                    <label class="block mt-4 text-sm">
                        <label for="password" class="text-gray-700 dark:text-gray-400"><g:message code='springSecurity.login.password.label'/>:</label>
                        <input
                                class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                placeholder="***************"
                                type="password"
                                name="${passwordParameter ?: 'password'}" id="password"/>

                    </label>
                        <p id="remember_me_holder">
                            <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                            <label for="remember_me"><g:message code='springSecurity.login.remember.me.label'/></label>
                        </p>
                    <!-- You should use a button here, as the anchor is only used for the example  -->
                    <div >
                        <input type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}" style="color:white;background-color: #7e3af2;border:none;" class="block w-full px-4 py-2 mt-4 text-sm font-medium leading-5 text-center text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"/>
                    </div>
                    </form>
                    <hr class="my-8" />



                    <p class="mt-4">
                        <a
                                class="text-sm font-medium text-purple-600 dark:text-purple-400 hover:underline"
                                href="./forgot-password.html"
                        >
                            Forgot your password?
                        </a>
                    </p>
                    <p class="mt-1">
                        <a
                                class="text-sm font-medium text-purple-600 dark:text-purple-400 hover:underline"
                                href="./create-account.html"
                        >
                            Create account
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>
