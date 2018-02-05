<HTML>
<HEAD>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<META HTTP-EQUIV="Expires" CONTENT="-1">


<LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
<SCRIPT SRC="webMethods.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
  function confirmDelete (alias) {
    var msg = "OK to delete remote server '"+alias+"' from configuration?";
    if (confirm (msg)) {
        document.deleteform.alias.value = alias;
            document.deleteform.submit();
          return false;
    } else return false;
  }
  function test (alias)
  {
    document.testform.alias.value = alias;
      document.testform.submit();
    return false;
  }

</SCRIPT>
</HEAD>
<BODY onLoad="setNavigation('settings-remote.dsp', 'doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_RemoteServersScrn');">
<TABLE width="100%">
<TR>
    <TD class="breadcrumb" colspan="2">Settings &gt; Remote Servers</TD>
</TR>

%ifvar action%
%switch action%
%case 'add'%
  %invoke wm.server.remote:addServer%
        %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
          <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
        %endif%
  %endif%
%case 'edit'%
  %invoke wm.server.remote:addServer%
        %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
          <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
        %endif%
  %endif%
%case 'test'%
  %invoke wm.server.remote:testAlias%
        %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
          <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
        %endif%
  %endif%
%case 'delete'%
  %invoke wm.server.remote:deleteServer%
        %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
          <TR><TD class="message" colspan="2">%value message encode(html)%</TD></TR>
        %endif%
  %endif%
%endswitch%
%endif%


<tr>
    <td colspan="2">
        <ul class="listitems">
            <li class="listitem">
			<script>
			createForm("htmlform_settings_remote_addedit", "settings-remote-addedit.dsp", "POST", "BODY");
			</script>
			<script>getURL("settings-remote-addedit.dsp", "javascript:document.htmlform_settings_remote_addedit.submit();", "Create Remote Server Alias");</script>
			
			</li>
        </ul>
    </td>
</tr>
<tr>
    <TD>
    <TABLE class="tableView" width=100%>

    <TR>
        <TD class="heading" colspan=10>Remote Servers List</TD>
    </TR>
%invoke wm.server.remote:serverList%
<TR>
   <TD nowrap class="oddcol-l">Alias</TD>
   <TD nowrap class="oddcol">Host</TD>
   <TD nowrap class="oddcol">Port</TD>
   <TD nowrap class="oddcol">User</TD>
   <TD nowrap class="oddcol">SSL</TD>
   <TD nowrap class="oddcol">Execute ACL</TD>
   <TD nowrap class="oddcol">KeepAlive Conns</TD>
   <TD nowrap class="oddcol">Timeout</TD>
   <TD nowrap class="oddcol">Test</TD>
   <TD nowrap class="oddcol">Delete</TD>
</TR>

%loop -struct servers%
%scope #$key%
<TR>
    <script>writeTD("rowdata-l");</script>
		<script>
		createForm("htmlform_settings_remote_addedit_props_%value alias%", "settings-remote-addedit.dsp", "POST", "BODY");
		setFormProperty("htmlform_settings_remote_addedit_props_%value alias%", "action", "edit");
		setFormProperty("htmlform_settings_remote_addedit_props_%value alias%", "retryServer", "%value retryServer %");
		setFormProperty("htmlform_settings_remote_addedit_props_%value alias%", "alias", "%value alias %");
		setFormProperty("htmlform_settings_remote_addedit_props_%value alias%", "host", "%value host %");
		setFormProperty("htmlform_settings_remote_addedit_props_%value alias%", "port", "%value port %");
		setFormProperty("htmlform_settings_remote_addedit_props_%value alias%", "user", "%value user %");
		setFormProperty("htmlform_settings_remote_addedit_props_%value alias%", "ssl", "%value ssl %");
		setFormProperty("htmlform_settings_remote_addedit_props_%value alias%", "keyStoreAlias", "%value keyStoreAlias %");
		setFormProperty("htmlform_settings_remote_addedit_props_%value alias%", "keyAlias", "%value keyAlias %");
		setFormProperty("htmlform_settings_remote_addedit_props_%value alias%", "acl", "%value acl %");
		setFormProperty("htmlform_settings_remote_addedit_props_%value alias%", "keepalive", "%value keepalive %");
		setFormProperty("htmlform_settings_remote_addedit_props_%value alias%", "timeout", "%value timeout %");
		setFormProperty("htmlform_settings_remote_addedit_props_%value alias%", "pass", "********");
		</script>
		<script>
			if(is_csrf_guard_enabled && needToInsertToken) {
				document.write('<a href="javascript:document.htmlform_settings_remote_addedit_props_%value alias%.submit();">%value alias encode(html)%</a>');
			} else {
				document.write('<a href="settings-remote-addedit.dsp?action=edit&retryServer=%value retryServer encode(url)%&alias=%value alias encode(url)%&host=%value host encode(url)%&port=%value port encode(url)%&user=%value user encode(url)%&ssl=%value ssl encode(url)%&keyStoreAlias=%value keyStoreAlias encode(url)%&keyAlias=%value keyAlias encode(url)%&acl=%value acl encode(url)%&keepalive=%value keepalive encode(url)%&timeout=%value timeout encode(url)%&pass=********">%value alias encode(html)%</a>');
			}
		</script>
		

    </TD>
    <script>writeTD("rowdata");</script>%value host encode(html)%</TD>
    <script>writeTD("rowdata");</script>%value port encode(html)%</TD>
    <script>writeTD("rowdata");</script>%value user encode(html)%</TD>
    <script>writeTD("rowdata");</script>
      %ifvar ssl equals('yes')%
        <IMG SRC="images/green_check.png" height=13 width=13>Yes
      %else%
        No
      %endif%
    </TD>
    <script>writeTD("rowdata");</script>
      %ifvar acl%
        %ifvar acl equals('')%
          &lt;none&gt;
        %else%
          %value acl encode(html)%
        %endif%
      %else%
        &lt;none&gt;
      %endif%</TD>
    <script>writeTD("rowdata");</script>%value keepalive encode(html)%</TD>
	<script>
	createForm("htmlform_settings_remote_%value alias%", "settings-remote.dsp", "POST", "BODY");
	</script>
    <script>writeTD("rowdata");</script>
      %ifvar timeout equals('-1')%&nbsp;%else%%value timeout encode(html)%%endif%</TD>
    <script>writeTD("rowdata");</script>
	<script>
		if(is_csrf_guard_enabled && needToInsertToken) {
			document.write('<a class="imagelink" href="javascript:document.htmlform_settings_remote_%value alias%.submit();" onclick="return test(\'%value alias encode(javascript)%\');"><IMG src="icons/checkdot.png" border="none" width="14" height="14" ></a>');
		} else {
			document.write('<a class="imagelink" href="" onclick="return test(\'%value alias encode(javascript)%\');"><IMG src="icons/checkdot.png" border="none" width="14" height="14" ></a>');
		}
	</script>
	</TD>
    <script>writeTD("rowdata");</script>
     %ifvar nodelete%
      &nbsp;
     %else%
	 <script>
		if(is_csrf_guard_enabled && needToInsertToken) {
			document.write('<a class="imagelink" href="javascript:document.htmlform_settings_remote_%value alias%.submit();" onClick="return confirmDelete(\'%value alias encode(javascript)%\');"> <img src="icons/delete.png" border="none"></a>');
		} else {
			document.write('<a class="imagelink" href="" onClick="return confirmDelete(\'%value alias encode(javascript)%\');"> <img src="icons/delete.png" border="none"></a>');
		}
	</script>
  
     %endif%</TD>

</TR>

    <script>swapRows();</script>
%endscope%
%endloop%
%endinvoke%
</TABLE>
</TD>
</TR>
</TABLE>

<FORM name="deleteform" action="settings-remote.dsp" method="POST">
  <INPUT type="hidden" name="action" value="delete">
  <INPUT type="hidden" name="alias">
</FORM>

<FORM name="testform" action="settings-remote.dsp" method="POST">
  <INPUT type="hidden" name="action" value="test">
  <INPUT type="hidden" name="alias">
</FORM>

</BODY>
</HTML>
