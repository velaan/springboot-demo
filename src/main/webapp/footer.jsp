        </section>
    </div>
    <fmt:message key="application.display.footer" var="displayFooter"/>
    <c:if test="${displayFooter == 'true'}">
    <footer id="footer">
        <div id="footer01"></div>
    </footer>
    </c:if>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<spring:url value="/resources/js/bootstrap.min.js"/>"></script>
</body>
</html>