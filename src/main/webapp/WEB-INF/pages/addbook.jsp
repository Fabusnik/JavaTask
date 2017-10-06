<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Book</title>
    <style type="text/css">
        .text{
            font-family: Calibri, sans-serif;
        }
    </style>
</head>
<body>

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
