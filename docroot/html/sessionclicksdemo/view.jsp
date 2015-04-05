<%@ include file="/html/init.jsp" %>

<%

// If it's already stored we get from portal preferences the value..
String myValue = SessionClicks.get(request, renderResponse.getNamespace() + "myPref", "");

%>

<c:choose>
	<c:when test="<%= user.isDefaultUser() %>">
		<a href="/c/portal/login"><liferay-ui:message key="please-log-in"/></a>
	</c:when>
	<c:otherwise>
		<liferay-ui:header title='choose-your-preference-value' />
			<aui:form method="get" name="fm">
				<aui:select id="myPref" name="<portlet:namespace/>myPref" label="my-pref">
					<aui:option value="first-message"><liferay-ui:message key="first-message"/></aui:option>
					<aui:option value="second-message"><liferay-ui:message key="second-message"/></aui:option>
					<aui:option value="third-message"><liferay-ui:message key="third-message"/></aui:option>
				</aui:select>
			</aui:form>
	</c:otherwise>
</c:choose>
<c:if test="<%= Validator.isNotNull(myValue) %>">
<liferay-ui:message key="selected"/>: <%= myValue %>
</c:if>

<aui:script use="liferay-store">
    var node = A.one('#<portlet:namespace/>myPref');
    node.on(
        'change',
        function(event) {
            var instance = this;
            Liferay.Store('<portlet:namespace/>myPref', instance.val());
            alert('<liferay-ui:message key="reload-message"></liferay-ui:message>');
        }
    );
</aui:script>