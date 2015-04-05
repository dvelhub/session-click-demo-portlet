
<%@ page import="java.text.Format" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %><%@
taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %><%@
taglib uri="http://liferay.com/tld/security" prefix="liferay-security" %><%@
taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %><%@
taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %><%@
taglib uri="http://liferay.com/tld/util" prefix="liferay-util" %>

<%@ page import="com.liferay.portal.kernel.dao.search.ResultRow" %><%@
page import="com.liferay.portal.kernel.util.ParamUtil" %><%@
page import="com.liferay.portal.kernel.util.StringPool" %><%@
page import="com.liferay.portal.util.PortalUtil" %><%@
page import="com.liferay.portal.kernel.util.HtmlUtil"%><%@
page import="com.liferay.portal.kernel.util.Validator"%><%@
page import="com.liferay.portlet.PortletPreferencesFactoryUtil"%><%@ 
page import="com.liferay.portal.kernel.search.SearchContextFactory"%><%@
page import="com.liferay.portal.kernel.search.SearchContext"%><%@
page import="com.liferay.portal.kernel.util.FastDateFormatFactoryUtil" %><%@
page import="com.liferay.portal.util.SessionClicks"%>



<%@ page import="com.liferay.portal.service.UserLocalServiceUtil" %><%@
page import="com.liferay.portal.kernel.dao.orm.QueryUtil" %><%@
page import="com.liferay.portal.model.User" %>

<%@ page import="java.util.List" %><%@
page import="javax.portlet.WindowState"%><%@
page import="javax.portlet.PortletPreferences"%>


<portlet:defineObjects />

<liferay-theme:defineObjects />

<%
String currentURL = PortalUtil.getCurrentURL(request);

String redirect = ParamUtil.getString(request, "redirect");

Format dateFormat = FastDateFormatFactoryUtil.getDate(locale, timeZone);

PortletPreferences preferences = null;
if (renderRequest != null ) {
      preferences = renderRequest.getPreferences();
}
 
String portletResource = ParamUtil.getString(request, "portletResource" );
 
if (Validator.isNotNull(portletResource)) {
      preferences = PortletPreferencesFactoryUtil.getPortletSetup(request, portletResource);
}

%>