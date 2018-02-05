
<HTML>
  <HEAD>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <META HTTP-EQUIV="Expires" CONTENT="-1">
    <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
    <SCRIPT SRC="webMethods.js"></SCRIPT>
    <TITLE>Integration Server -- WebSocket Session Management</TITLE>

    <SCRIPT Language="JavaScript">
	    var agent = navigator.userAgent.toLowerCase();
        var ie = (agent.indexOf("msie") != -1);
        var hiddenOptions = new Array();
		
		function showSessions(form, webSocketURI, port) {
			form.webSocketURI.value = webSocketURI;
			form.port.value = port;
			form.submit();
			return false;
		}
	  
    </SCRIPT>

  </HEAD>


  <body onLoad="setNavigation('websocket-server-endpoints.dsp', 'doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Security_WebSocket_ServerEndpointsScrn');">
    <TABLE width="100%">
      <TR>
        <TD class="breadcrumb" colspan=2>
          Security &gt;
          Ports &gt;
          WebSocket Server Endpoints
        </TD>
      </TR>
      <TR>
        <TD colspan="2">
          <UL>
            <li>
			
			<script>
			createForm("htmlform_http_security_ports", "security-ports.dsp", "POST", "BODY");
            </script>			
			<script>getURL("security-ports.dsp", "javascript:document.htmlform_http_security_ports.submit();", "Return to Ports");</script>
			
		  </li>
          </UL>
        </TD>
      </TR>
	  
	  
    <TR>
      <TD colspan="2">&nbsp;</TD>
    </TR>
    <TR>
        <TD>
          <TABLE class="tableView">
            <TR>
              <td class="heading" colspan="2">WebSocket - Registered Server Endpoints</td>
            </TR>

        %invoke wm.server.net.websocket:listSessionsByPort%
        %ifvar sessionsByURI -notempty%
            <TR>
              <TD span style="font-weight:bold" class="oddcol">WebSocket URI</TD>
              <TD span style="font-weight:bold" class="oddcol">Active Sessions</TD>
            </TR>
            %loop sessionsByURI%
            <TR>
              <script>writeTD("row");</script>%value webSocketURI encode(html)%</TD>

              <script>writeTD("row-l");</script>
			  <A HREF="javascript:showSessions(document.showSessions, '%value webSocketURI encode(javascript)%', '%value ../port encode(html)%');">
			    %value numSessions encode(html)%
              </A>
			  </TD>
              <script>swapRows();</script>
            </TR>
            %endloop%
		%else%
			<TR>
              <td span style="font-weight:bold" class="oddcol" colspan="2">No Active Sessions found for WebSocket Port %value port encode(html)%</td>
            </TR>
        %endif%
		%endinvoke%
          </TABLE>
        </TD>
      </TR>
	  
 </TABLE>
 
   	<form name="showSessions" action="websocket-server-sessions.dsp" method="POST">
    <input type="hidden" name="webSocketURI">
	<input type="hidden" name="port">
    </form>
	
</body>
</HTML>

