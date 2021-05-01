<%@include file="taglib.jsp"%>
<jsp:include page="contentType.jsp" />
<c:set var="title" value="Search Results" />
<%@include file="head.jsp"%>

<script type="text/javascript" class="init">
    $(document).ready( function () {
        $('#resultTable').DataTable();
    } );
</script>

<!DOCTYPE html>
    <body>
      <jsp:include page="navbar.jsp" />

        <div class="container-fluid">

            <c:set var="resultURL" scope="session" value="${pageContext.request.requestURI}" />

            <h2>Search Results: </h2>

            <c:if test="${not empty users}">
                <table id="resultTable" class="display" cellspacing="0" width="100%">
                    <thead>
                    <th>Name</th>
                    <th>User Name</th>
                    <th>Age</th>
                    <th>Roles</th>
                    <th>Edit</th>
                    <th>Delete</th>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.firstName} ${user.lastName}</td>
                            <td>${user.userName}</td>
                            <td>${user.age}</td>
                            <td>
                            <c:forEach var="role" items="${user.roles}">
                                ${role.id} ${role.roleName}<br/>
                            </c:forEach>
                            <td><a href="/editEntity"></a>Edit User</td>
                            <td><a href="/confirmDeletion.jsp"></a>Delete User</td>
                            </td>
                        </tr>


                    </c:forEach>
                    </tbody>
                </table>
            </c:if>

            <c:if test="${not empty clients}">
                <table id="resultTable" class="display" cellspacing="0" width="100%">
                    <thead>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </thead>
                    <tbody>
                    <c:forEach var="client" items="${clients}">
                        <tr>
                            <td>${client.id} ${user.lastName}</td>
                            <td>${client.name}</td>
                            <td><a href="/editEntity"></a>Edit</td>
                            <td><a href="/deleteItem?deleteItem=client&clientID=${client.id}">Delete</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>

      <jsp:include page="footer.jsp" />
    </body>
</html>





