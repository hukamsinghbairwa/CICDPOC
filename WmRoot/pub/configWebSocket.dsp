%ifvar mode equals('edit')%
  %ifvar disableport equals('true')%
    %invoke wm.server.net.listeners:disableListener%
    %endinvoke%
  %endif%
%endif%


%invoke wm.server.net.listeners:getListener%

<HTML>
  <HEAD>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <META HTTP-EQUIV="Expires" CONTENT="-1">
    <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
    <SCRIPT SRC="webMethods.js"></SCRIPT>
    <TITLE>Integration Server -- Port Access Management</TITLE>

    <SCRIPT Language="JavaScript">
	    var agent = navigator.userAgent.toLowerCase();
        var ie = (agent.indexOf("msie") != -1);
        var hiddenOptions = new Array();
		
		function setupData() {
            %ifvar port%
            document.properties.operation.value = "update";
            document.properties.oldPkg.value = "%value pkg encode(javascript)%";
            %else%
            document.properties.operation.value = "add";
            %endif%

        }
		
        function confirmDisable()
        {
          var enabled = "%value ../listening encode(javascript)%";

          if(enabled == "primary")
          {
            alert("Port must be disabled to edit these settings.  Primary port cannot be disabled.  To edit these settings, please select a new primary port");
            return false;
          }
          else if(enabled == "true")
          {
            if(confirm("Port must be disabled so that you can edit these settings.  Would you like to disable the port?"))
            {
                if(is_csrf_guard_enabled && needToInsertToken) {
			   
                   createForm("htmlForm_configWebSocket", 'configWebSocket.dsp', "POST", "HEAD");	
				   setFormProperty("htmlForm_configWebSocket", "listenerKey", "%value listenerKey%");
				   setFormProperty("htmlForm_configWebSocket", "pkg", "%value pkg%");
				   %ifvar listenerType%
				   setFormProperty("htmlForm_configWebSocket", "listenerType", "%value listenerType%");
				   %endif%
				   setFormProperty("htmlForm_configWebSocket", "mode", "edit");
				   setFormProperty("htmlForm_configWebSocket", "disableport", "true");
				   setFormProperty("htmlForm_configWebSocket", _csrfTokenNm_, _csrfTokenVal_);
			 	   var htmlForm_configWebSocket = document.forms["htmlForm_configWebSocket"];
				   htmlForm_configWebSocket.submit();
				} else {
					document.location.replace("configWebSocket.dsp?listenerKey=%value listenerKey encode(url)%&pkg=%value pkg encode(url)%%ifvar listenerType%&listenerType=%value listenerType encode(url)%%endif%&mode=edit&disableport=true");
				}
				   
            }
          }
          else {
			  if(is_csrf_guard_enabled && needToInsertToken) {
                   createForm("htmlForm_configWebSocket2", 'configWebSocket.dsp', "POST", "HEAD");
			       setFormProperty("htmlForm_configWebSocket2", "listenerKey", "%value listenerKey%");
				   setFormProperty("htmlForm_configWebSocket2", "pkg", "%value pkg%");
				   %ifvar listenerType%
				   setFormProperty("htmlForm_configWebSocket2", "listenerType", "%value listenerType%");
				   %endif%
				   setFormProperty("htmlForm_configWebSocket2", "mode", "edit");
				   
				   setFormProperty("htmlForm_configWebSocket2", _csrfTokenNm_, _csrfTokenVal_);
				   var htmlForm_configWebSocket2 = document.forms["htmlForm_configWebSocket2"];
				   htmlForm_configWebSocket2.submit();
				   
				} else {
					document.location.replace("configWebSocket.dsp?listenerKey=%value listenerKey encode(url)%&pkg=%value pkg encode(url)%%ifvar listenerType%&listenerType=%value listenerType encode(url)%%endif%&mode=edit");
				}
				   
          }

          return false;
        }

      function verify() {

        var e = document.properties.port.value;
        if (( e != null ) && ( e != "" ) && !isblank(e)) {

          for (count=0; count<e.length; count++){
            var sstr = e.substring(count,count+1);
            var test = parseInt(sstr);
            if (isNaN(test)) {
              alert("Invalid Port "+e);
              return (false);
            }
          }

        }

        document.properties.submit();
        return (true);

      }
	  
	  function setThreadpool(checkId, bool) {
        if (bool==true){
            document.getElementById(checkId).value="true";
        }else{
            document.getElementById(checkId).value="false";
        }
	  }
		
	  function toggleThreadpool(checkId, spanId) {

        if (document.getElementById(checkId).value=="true"){
            elem = document.getElementById(spanId);
            rows = elem.rows;
            for(i = 0; i < rows.length; i++){
               if (ie) {
                 rows[i].style.display="block";
               }else{
                 rows[i].style.display="block";
                 rows[i].style.display="table-row";
               }
            }
            eEnable = document.getElementById(spanId+"enable");
            if(eEnable!=null){
                document.getElementById(spanId+"enable").style.display="none";
            }
        } else {
            elem = document.getElementById(spanId);
            rows = elem.rows;
            //length = rows.length;
            for(i = 0; i < rows.length; i++){
               rows[i].style.display="none";
            }
            eEnable = document.getElementById(spanId+"enable");
            if(eEnable!=null){
                document.getElementById(spanId+"enable").style.display="block";
                if (!ie) {
                    document.getElementById(spanId+"enable").style.display="table-row";
                }
            }
        }

      }
	  
	  function showEndpoints(form, port) {
		form.port.value = port;
		form.submit();
		return false;
	  }



    </SCRIPT>

  </HEAD>


  <body onLoad="setupData();setNavigation('security-ports.dsp', 'doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Security_WebSocket_PortConfigScrn');">
    <TABLE width="100%">
      <TR>
        <TD class="breadcrumb" colspan=2>
          Security &gt;
          Ports &gt;
          %ifvar ../mode equals('view')%
            View WebSocket Port Details
          %else%
            Edit WebSocket Port Configuration
          %endif%
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
            %ifvar ../mode equals('view')%
              %ifvar listening equals('primary')%
              %else%
                <LI><A onclick="return confirmDisable();" HREF="">
                  Edit WebSocket Port Configuration
                </a></li>
              %endif%
            %endif%
            %ifvar ../mode equals('view')%
			<li>
			  <A HREF="javascript:showEndpoints(document.showEndpoints, '%value port encode(javascript)%');">
			    WebSocket Endpoints
              </A>
			</li>
            %endif%	
          </UL>
        </TD>
      </TR>
      <TR>
        <TD>
          <TABLE class="%ifvar ../mode equals('view')%tableView%else%tableView%endif%">
          <tr>
              <td class="heading" colspan="2">WebSocket Listener Configuration</td>
          <tr>

          <form name="properties" action="security-ports.dsp" method="POST" onsubmit="return submit();">
          <input type="hidden" name="factoryKey" value="webMethods/WebSocket">
          <input type="hidden" name="operation">
          <input type="hidden" name="listenerKey" value="%value listenerKey encode(htmlattr)%">
          <input type="hidden" name="oldPkg">
		  <input type="hidden" name="formName" value="properties">
              %ifvar ../mode equals('edit')%
                <tr>
                    <td class="evenrow">Enable</td>
                    <td class="evenrow-l">
                      <input type="radio" name="enable" value="yes" >Yes</input>
                      <input type="radio" name="enable" value="no" checked>No</input>
                    </td>
                </tr>
              %endif%         
              <td class="oddrow">Port</td>
              <td class="%ifvar ../mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
                <script>writeEdit("%value mode encode(javascript)%", 'port', "%value port encode(html_javascript)%");</script>
              </td>
          </tr>
                      <tr>
                <td class="evenrow">Alias</td>
                <td class="%ifvar ../mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
                  %ifvar listenerKey -notempty%
                    %value portAlias encode(html)% 
                  %else%
                    <input name="portAlias" value="%value portAlias encode(htmlattr)%" size="60">
                  %endif%
                </td>
            </tr>
            <tr>
                <td class="oddrow">Description (optional)</td>
                <td class="%ifvar ../mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
                  %ifvar ../mode equals('view')%
                    %value portDescription encode(html)%
                  %else%
                    <input name="portDescription" value="%value portDescription encode(htmlattr)%" size="60">
                  %endif%
                </td>
            </tr>

          <tr>
              <td class="evenrow">Package Name</td>
              <td class="%ifvar ../mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
                %ifvar mode equals('view')%
                  %value pkg encode(html)%
                %else%
                  %invoke wm.server.packages:packageList%
                  <select name="pkg">
                  %loop packages%
                      %ifvar enabled equals('false')%
                      %else%
                  %ifvar ../pkg -notempty%
                    <option size="15" width=30% %ifvar ../pkg vequals(name)%selected %endif%value="%value name encode(htmlattr)%">%value name encode(html)%</option>
                  %else%
                    <option size="15" width=30% %ifvar name equals('WmRoot')%selected %endif%value="%value name encode(htmlattr)%">%value name encode(html)%</option>
                  %endif%
                  %endif%
                  %endloop%
                  </select>
                  %endinvoke%
                %endif%
              </td>
          </tr>
          <tr>
                <td class="oddrow">Bind Address (optional)</td>
                <td class="%ifvar ../mode equals('view')%oddrowdata-l%else%oddrow-l%endif%">
                %ifvar ../mode equals('view')%
                  %value bindAddress encode(html)%
                %else%
                    <input name="bindAddress" value="%value bindAddress encode(htmlattr)%">
                %endif%
              </td>
           </tr>
		   <tr>
             <td class="evenrow">Backlog</td>
             <td class="%ifvar ../mode equals('view')%evenrowdata-l%else%evenrow-l%endif%">
             %ifvar ../mode equals('view')%
               %value maxQueue%
             %else%
               %ifvar maxQueue%
                 <input name="maxQueue" value="%value maxQueue%">
               %else%
                 <input name="maxQueue" value="200">
               %endif%
             %endif%
             </td>
           </tr>

		%ifvar ../mode equals('view')%
		%else%
		<!--
		<tr id="tpRIGenable">
		  <td class="evenrow">Threadpool</td>
		  <td class="evenrow-l">
		 <a name="anchor_a" href="#anchor_b" onclick="setThreadpool('tpRIGon',true);toggleThreadpool('tpRIGon', 'tpRIG');"><u>Enable</u></a>
		  </td>
		</tr>
		%endif%
		<tbody id="tpRIG">
		  <tr>
		    <td class="heading" colspan="2">Private Threadpool Configuration</td>
		    <input id="tpRIGon" type="hidden" name="threadPool" value="%value threadPool%">
		  </tr>
		  %ifvar ../mode equals('view')%
		  %else%
		    <tr>
		      <td class="evenrow">Threadpool</td>
			  <td class="evenrow-l">
			  <a href="#anchor_a" name="anchor_b" onclick="setThreadpool('tpRIGon',false);toggleThreadpool('tpRIGon', 'tpRIG');"><u>Disable</u></a>
			  </td>
		    </tr>
		  -->
		  %endif%
		  <!--
		  %include configWebSocket-threadpool.dsp%
		  -->
		</tbody>
		<SCRIPT>toggleThreadpool('tpRIGon', 'tpRIG');</SCRIPT>
	
          %ifvar mode equals('view')%
          %else%
          <tr>
              <td colspan="2" class="action">
            <input type="button" value="Save Changes" onclick="submit();">
              </td>
          </tr>
          %endif%
        </form>
      </table>
    </td>
  </tr>
  </table>
  
  	<form name="showEndpoints" action="websocket-server-endpoints.dsp" method="POST">
    <input type="hidden" name="port">
    </form>
</body>
</html>
%endinvoke%
