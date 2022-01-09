<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <style>
            img{
                height:100px;
                width:100px;
            }
        </style>
    </head>
    <body>
        <a href="#show-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div style="margin-top:10px" role="navigation">
            <ul>
                <li><button class="px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"><g:link class="" action="index">Back</g:link></button></li>

            </ul>
        </div>
        <div id="show-annonce" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>

            <main class="h-full pb-16 overflow-y-auto">
                <div class="container px-6 mx-auto grid">
                    <h2
                            class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
                    >
                        Here is the detailed Annonce
                    </h2>
                    <!-- CTA -->


                    <!-- Big section cards -->
                    <h4
                            class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
                    >
                        Information
                    </h4>
                    <div
                            class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
                    >
                        <p class="text-sm text-gray-600 dark:text-gray-400">
                            ${annonce.title}
                        </p>

                    </div>
                    <div
                            class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
                    >
                        <p class="text-sm text-gray-600 dark:text-gray-400">
                            Author : <g:link controller="user" action="show" id="${annonce.author.id}">${annonce.author.username}</g:link>
                        </p>

                    </div>

                    <!-- Responsive cards -->
                    <h4
                            class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
                    >
                        Cared details
                    </h4>
                    <div class="grid gap-6 mb-8 md:grid-cols-2 xl:grid-cols-4">
                        <!-- Card -->
                        <div
                                class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
                        >
                            <div
                                    class="p-3 mr-4 text-orange-500 bg-orange-100 rounded-full dark:text-orange-100 dark:bg-orange-500"
                            >
                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                    <path
                                            d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3zM6 8a2 2 0 11-4 0 2 2 0 014 0zM16 18v-3a5.972 5.972 0 00-.75-2.906A3.005 3.005 0 0119 15v3h-3zM4.75 12.094A5.973 5.973 0 004 15v3H1v-3a3 3 0 013.75-2.906z"
                                    ></path>
                                </svg>
                            </div>
                            <div>
                                <p
                                        class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400"
                                >
                                    Description
                                </p>
                                <p
                                        class="text-lg font-semibold text-gray-700 dark:text-gray-200"
                                >
                                    ${annonce.description}
                                </p>
                            </div>
                        </div>
                        <!-- Card -->
                        <div
                                class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
                        >
                            <div
                                    class="p-3 mr-4 text-green-500 bg-green-100 rounded-full dark:text-green-100 dark:bg-green-500"
                            >
                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                    <path
                                            fill-rule="evenodd"
                                            d="M4 4a2 2 0 00-2 2v4a2 2 0 002 2V6h10a2 2 0 00-2-2H4zm2 6a2 2 0 012-2h8a2 2 0 012 2v4a2 2 0 01-2 2H8a2 2 0 01-2-2v-4zm6 4a2 2 0 100-4 2 2 0 000 4z"
                                            clip-rule="evenodd"
                                    ></path>
                                </svg>
                            </div>
                            <div>
                                <p
                                        class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400"
                                >
                                    Price
                                </p>
                                <p
                                        class="text-lg font-semibold text-gray-700 dark:text-gray-200"
                                >
                                    MAD ${annonce.price}
                                </p>
                            </div>
                        </div>
                        <!-- Card -->
                        <div
                                class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
                        >
                            <div
                                    class="p-3 mr-4 text-blue-500 bg-blue-100 rounded-full dark:text-blue-100 dark:bg-blue-500"
                            >
                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                    <path
                                            d="M3 1a1 1 0 000 2h1.22l.305 1.222a.997.997 0 00.01.042l1.358 5.43-.893.892C3.74 11.846 4.632 14 6.414 14H15a1 1 0 000-2H6.414l1-1H14a1 1 0 00.894-.553l3-6A1 1 0 0017 3H6.28l-.31-1.243A1 1 0 005 1H3zM16 16.5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0zM6.5 18a1.5 1.5 0 100-3 1.5 1.5 0 000 3z"
                                    ></path>
                                </svg>
                            </div>
                            <div>
                                <p
                                        class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400"
                                >
                                    Reference
                                </p>
                                <p
                                        class="text-lg font-semibold text-gray-700 dark:text-gray-200"
                                >
                                    ${annonce.ref}
                                </p>
                            </div>
                        </div>
                        <!-- Card -->
                        <div
                                class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
                        >
                            <div
                                    class="p-3 mr-4 text-teal-500 bg-teal-100 rounded-full dark:text-teal-100 dark:bg-teal-500"
                            >
                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                    <path
                                            fill-rule="evenodd"
                                            d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z"
                                            clip-rule="evenodd"
                                    ></path>
                                </svg>
                            </div>
                            <div>
                                <p
                                        class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400"
                                >
                                    Status
                                </p>
                                <p
                                        class="text-lg font-semibold text-gray-700 dark:text-gray-200"
                                >
                                    ${annonce.status}
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Cards with title -->
                    <h4
                            class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
                    >
                        Illustrations
                    </h4>
                    <div class="grid gap-6 mb-8 md:grid-cols-2">
                    <g:each in="${annonce.illustrations}" var="illustration">

                         <div
                                class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
                        >

                             <img src="${grailsApplication.config.assets.url+illustration.filename}" alt="illustration"/>

                         </div>
                    </g:each>
                        <g:form resource="${this.annonce}" action="edit">
                            <div class="">
                                <g:link  action="edit" resource="${this.annonce}"><button class="px-10 py-4 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple" >Edit</button></g:link>
                            </div>
                        </g:form>
                        <g:form resource="${this.annonce}" method="DELETE">
                            <div class="">
                                <button  class="px-10 py-4 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" >Delete</button>
                            </div>
                        </g:form>
                    </div>
                </div>
            </main>
        </div>
    </body>
</html>
