<%@ include file="/header.jsp"%>

    <form:form method="POST" modelAttribute="userForm" class="form-horizontal">
        <div class="col-sm-4 col-sm-offset-4">
            <h2 class="form-signin-heading">Création du compte</h2>
        </div>
        
        <div class="form-group">
            <div class="col-sm-4 col-sm-offset-4">
                <form:input type="text" path="username" class="form-control" placeholder="Nom d'utilisateur"
                            autofocus="true"></form:input>
                <form:errors path="username"></form:errors>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-4 col-sm-offset-4">
                <form:input type="password" path="password" class="form-control" placeholder="Mot de passe" />
                <form:errors path="password"></form:errors>
            </div>
        </div>
            
        <div class="form-group">
            <div class="col-sm-4 col-sm-offset-4">
                <form:input type="text" path="firstname" class="form-control" placeholder="Nom" />
                <form:errors path="firstname"></form:errors>
            </div>
        </div>
            
        <div class="form-group">
            <div class="col-sm-4 col-sm-offset-4">
                <form:input type="text" path="lastname" class="form-control" placeholder="Prénom"/>
                <form:errors path="lastname"></form:errors>
            </div>
        </div>
            
        <div class="col-sm-4 col-sm-offset-4">
            <button class="btn btn-primary btn-block" type="submit">S'inscrire</button>
        </div>
    </form:form>

</div>

<%@ include file="/footer.jsp"%>
