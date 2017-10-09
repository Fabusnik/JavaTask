<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ page session="false" %>
<html>
<head>
    <title>Books Page</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Calibri, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Calibri, sans-serif;
            font-size: 20px;
            font-weight: bold;
            padding: 10px 5px;
            border-style: solid;
            border-width: 2px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }

        .text {
            font-family: Calibri, sans-serif;
        }
    </style>
</head>
<body>

<a class="text" href="../../index.jsp">Back to main menu</a>

<br/>
<br/>

<h1 class="text">
    Book List
</h1>

<div>
   Total pages: ${maxPages}

</div>

<div id="pagination">
    <c:url value="/books/${page-1}" var="prev">

    </c:url>

    <c:if test="${page > 1}">
        <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
    </c:if>

    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <span>${i.index}</span>
            </c:when>
            <c:otherwise>
                <c:url value="/books/${i.index}" var="url">

                </c:url>
                <a href='<c:out value="${url}" />'>${i.index}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:url value="/books/${page + 1}" var="next">
    </c:url>
    <c:if test="${page + 1 <= maxPages}">
        <a href='<c:out value="${next}" />' class="pn next">Next</a>
    </c:if>

</div>


<c:if test="${!empty listBooks}">
    <table class="tg">
        <tr>
            <th width="120">Title</th>
            <th width="120">Author</th>
            <th width="120">Read Already</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listBooks}" var="book">
            <tr>
                <td><a href="/bookdata/${book.id}" target="_blank">${book.title}</a></td>
                <td>${book.author}</td>

                <td align="centre">
                    <c:if test="${book.readAlready}">Yes</c:if>
                    <c:if test="${!book.readAlready}">No</c:if>
                </td>

                <td><a href="<c:url value='/edit/${book.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${book.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>



<br/>
<br/>

<display:table name="listBooks" pagesize="5" requestURI="/books" class="tg">
    <display:column property="id" title="ID" href="/edit/${id}" />
    <display:column property="title" title="Title"/>
    <display:column property="author" title="Author"/>
</display:table>

<h1 class="text">Add a Book</h1>

<c:url var="addAction" value="/books/add"/>

<form:form action="${addAction}" commandName="book">
    <table class="text">
        <c:if test="${!empty book.title}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="id"/>
                    </form:label>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="title">
                    <spring:message text="Title"/>
                </form:label>
            </td>
            <td>
                <form:input path="title"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="description">
                    <spring:message text="Description"/>
                </form:label>
            </td>
            <td>
                <form:input path="description"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="author">
                    <spring:message text="Author"/>
                </form:label>
            </td>
            <td>
                <form:input path="author"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="isbn">
                    <spring:message text="ISBN"/>
                </form:label>
            </td>
            <td>
                <form:input path="isbn"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="printYear">
                    <spring:message text="Print Year"/>
                </form:label>
            </td>
            <td>
                <form:input path="printYear"/>
            </td>
        </tr>
        <c:if test="${!empty book.title}">
            <tr>
                <td>
                    <form:label path="readAlready">
                        <spring:message text="Already read"/>
                    </form:label>
                </td>
                <td>
                    <form:select path="readAlready" readonly="false" size="1" disabled="false">
                        <option value="true">Yes</option>
                        <option value="false">No</option>
                    </form:select>
                </td>
            </tr>
        </c:if>

        <tr>
            <td colspan="2">
                <c:if test="${!empty book.title}">
                    <input type="submit"
                           value="<spring:message text="Edit Book"/>"/>
                </c:if>
                <c:if test="${empty book.title}">
                    <input type="submit"
                           value="<spring:message text="Add Book"/>"/>
                </c:if>
            </td>
        </tr>

    </table>
</form:form>

</body>
</html>
