<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

        <title><spring:message code="appli.title"/></title>	

        <link href="<spring:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
        <link href="<spring:url value="/resources/css/font-awesome.min.css"/>" rel="stylesheet">
        <link href="<spring:url value="/resources/css/default.css"/>" rel="stylesheet">
        <link href="<spring:url value="/resources/css/parrainage.css"/>" rel="stylesheet">
        

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>
        <div id="wrap">
            <fmt:message key="application.display.header" var="displayHeader"/>
            <c:if test="${displayHeader == 'true'}">
                <nav id="main-navbar" class="navbar navbar-static-top navbar-inverse" role="navigation">   
                    <div class="container-fluid">
                        <div class="navbar-header pull-left">   

                            <a class="navbar-brand" href="<spring:url value="/"/>">
                                <img src="<spring:url value="/resources/images/logosmall.png"/>" alt="<spring:message code="header.logo"/>" class="hidden-xs"/>
                                <spring:message code="appli.title"/>
                            </a>
                        </div>
                        <div id="user-block" class="navbar-header pull-right">
                            <ul class="nav navbar-nav">    
                                <sec:authorize access="hasRole('SWITCH')">
                                <li class="dropdown hidden-xs raccourci">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-refresh fa-lg" aria-hidden="true"></i>
                                    </a>

                                    <ul id="login-dp" class="dropdown-menu pull-right">
                                        <li>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <form class="form" role="form" method="get" action="<spring:url value="/login/impersonate"/>" accept-charset="UTF-8">
                                                        <div class="form-group">
                                                            <label class="sr-only" for="identifiant"><spring:message code="header.identifiant"/></label>
                                                            <input type="text" class="form-control" name="userName" id="userName" placeholder="Identifiant">
                                                        </div>    
                                                        <div class="form-group">
                                                            <button type="submit" class="btn btn-primary btn-block"><spring:message code="header.switch"/></button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                </sec:authorize>
                                
                                <sec:authorize access="isAuthenticated()">
                                    <li class="raccourci hidden-xs">
                                        <a href="<spring:message code="header.lanceur.url"/>" title="<spring:message code="header.lanceur.label"/>"><i class="fa fa-object-ungroup fa-lg" aria-hidden="true"></i></a>
                                    </li>

                                    <li class="raccourci hidden-xs">
                                        <a href="<spring:message code="header.identite.url"/>" title="<spring:message code="header.identite.label"/>"><i class="fa fa-user-circle fa-lg" aria-hidden="true"></i></a>
                                    </li>
                                </sec:authorize>

                                <sec:authorize access="isAnonymous()">
                                    <li id="auth">
                                        <a href="<spring:url value="/login"/>">
                                            <i class="fa fa-sign-in fa-lg" aria-hidden="true"></i>
                                            <spring:message code="header.connexion"/>
                                        </a>
                                    </li>
                                </sec:authorize>

                                <sec:authorize access="isAuthenticated() && !hasRole('PREVIOUS_ADMINISTRATOR')">
                                    <li id="auth">
                                        <spring:url var="logoutUrl" value="/logout"/>                                
                                        <form method="post" action="${logoutUrl}" id="form-logout" class="navbar-form">
                                            <sec:csrfInput />                                       

                                            <button type="submit" class="btn btn-link">
                                                <i class="fa fa-sign-out fa-lg" aria-hidden="true"></i>
                                                <spring:message code="header.deconnexion"/>
                                            </button>
                                        </form>
                                    </li>
                                </sec:authorize>  

                                <sec:authorize access="hasRole('PREVIOUS_ADMINISTRATOR')">
                                    <li id="auth" class="impersonate">
                                        <a href="<spring:url value="/logout/impersonate"/>">
                                            <i class="fa fa-sign-out fa-lg" aria-hidden="true"></i>
                                            <spring:message code="header.deconnexion"/>
                                        </a>
                                    </li>
                                </sec:authorize>

                            </ul>

                        </div>
                    </div>
                </nav>

                <sec:authorize access="isAuthenticated()">
                    <div id="ident" class="text-right">
                        <spring:message code="header.connected"/> <sec:authentication property="principal.username" />
                    </div>
                </sec:authorize>
            </c:if>

            <div class="container">
                <c:if test="${! empty resultMessage}">
                    <div class="alert alert-success">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <c:out value="${resultMessage}"/>
                    </div>
                </c:if>

                <c:if test="${! empty resultWarning}">
                    <div class="alert">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <c:out value="${resultWarning}"/>
                    </div>
                </c:if>

                <c:if test="${! empty resultInfo}">
                    <div class="alert alert-info">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <c:out value="${resultInfo}"/>
                    </div>
                </c:if>

                <c:if test="${! empty resultError || ! empty error}">
                    <div class="alert alert-danger">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <c:out value="${resultError}"/> <c:out value="${error}"/>
                    </div>
                </c:if>                   
                
            </div>
            <section id="contenu" class="container">