<%@ include file="/header.jsp"%>

    <spring:url value="/login" var="loginUrl"/>
    <form method="POST" action="${loginUrl}" class="form-signin form-horizontal">
        <div class="col-sm-4 col-sm-offset-4">
            <h2>Identifiez vous</h2>
        </div>

        <div class="form-group">
            <span>${message}</span>
            <div class="col-sm-4 col-sm-offset-4">
                <input name="username" type="text" class="form-control" placeholder="Identifiant"
                       autofocus="true"/>
            </div>
        </div>
            
        <div class="form-group">
            <div class="col-sm-4 col-sm-offset-4">
                <input name="password" type="password" class="form-control" placeholder="Mot de passe"/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </div>
        </div>
        
        <div class="form-group">
            <div class="col-sm-4 col-sm-offset-4">
                <button class="btn btn-primary btn-block" type="submit">Connexion</button>
                <br/>
                <div class="text-center"><a href="<spring:url value="/registration"/>">Créer un compte</a></div>
            </div>
        </div>

    </form>

<%@ include file="/footer.jsp"%>
