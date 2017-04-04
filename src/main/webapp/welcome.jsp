<%@ include file="/header.jsp"%>

    <sec:authorize access="isAnonymous()">
        <h2>Bienvenue inconnu. N'hésite pas à <a href="<spring:url value="/registration"/>">t'inscrire</a> ou <a href="<spring:url value="/login"/>">te connecter</a></h2>
    </sec:authorize>
    
    <sec:authorize access="isAuthenticated()">
        <h2>Bienvenue <sec:authentication property="principal.username" /></h2>
    </sec:authorize>

</div>

<%@ include file="/footer.jsp"%>