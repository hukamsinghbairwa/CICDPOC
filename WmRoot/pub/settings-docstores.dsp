<HTML>
    <HEAD>
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <META HTTP-EQUIV="Expires" CONTENT="-1">
        <LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
        <SCRIPT SRC="webMethods.js"></SCRIPT>
    </HEAD>

    <BODY onLoad="setNavigation('settings-docstores.dsp', 'doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_DocStoresScrn');">
        <TABLE width="100%">
            <TR>
                <TD class="breadcrumb" colspan="2">
                    Settings &gt; Resources &gt; Store Settings
                </TD>
            </TR>

            <!-- update the Message Store Settings --> 
            %ifvar action equals('edit')%
                %invoke wm.server.dispatcher.adminui:setDocStoreSettings%
                    %ifvar message -notempty%
                        <script>writeMessage("%value message encode(html_javascript)%");</script>  
                    %else%
                        <script>writeMessage('Settings changed successfully');</script>
                    %endif%
                %onerror%
                    <script>writeMessage("%value errorMessage encode(html_javascript)%");</script>
                %endinvoke%    
            %endif%
            
            <!-- update the XA Recovery Settings -->
            %ifvar action equals('editXA')%
                %invoke wm.server.xarecovery:setXARecoveryStoreSettings%
                    <script>writeMessage('Settings changed successfully');</script>
                %onerror%
                    <script>writeMessage("%value errorMessage encode(html_javascript)%");</script>
                %endinvoke%
            %endif%    

            <TR>
                <TD colspan="2">
                    <ul class="listitems">
						<script>
						createForm("htmlform_settings_resources", "settings-resources.dsp", "POST", "BODY");
						createForm("htmlform_settings_docstores_edit", "settings-docstores-edit.dsp", "POST", "BODY");
						createForm("htmlform_settings_xastores_edit", "settings-xastores-edit.dsp", "POST", "BODY");
						</script>
                        <li class="listitem">
						<script>getURL("settings-resources.dsp", "javascript:document.htmlform_settings_resources.submit();", "Return to Resource Settings");</script>
						</li>
						
                        <li class="listitem">
						<script>getURL("settings-docstores-edit.dsp", "javascript:document.htmlform_settings_docstores_edit.submit();", "Edit Document Store Settings");</script>
						</li>
						
                        <li class="listitem">
						<script>getURL("settings-xastores-edit.dsp", "javascript:document.htmlform_settings_xastores_edit.submit();", "Edit XA Recovery Store Settings");</script>
						</li>
                    </UL>
                </TD>
            </TR>

            <TR>
                <TD width="100%">
                    <TABLE class="tableView">
                        %invoke wm.server.dispatcher.adminui:getDocStoreSettings%
                            <TR>
                                <TD class="heading" colspan=2>Default Document Store</TD>
                            </TR>

                            <TR>
                                <TD class="oddrow">Store Location</TD>
                                <TD class="oddrowdata-l">%value tsDBGroup encode(html)%</TD>
                            </TR>

                            <TR>
                                <TD class="evenrow">Initial Store Size (MB)</TD>
                                <TD class="evenrowdata-l">%value tsDBSize encode(html)%</TD>
                            </TR>


                        %ifvar isBrokerConfigured equals('true')%

                            <TR>
                                <TD class="oddrow">Capacity (documents)</TD>
                                <TD class="oddrowdata-l">
                                    %ifvar maxDocsDefStore equals('0')%
                                        Suspended
                                    %else%
                                        %value maxDocsDefStore encode(html)%
                                    %endif%
                                </TD>
                            </TR>

                            <TR>
                                <TD class="evenrow">Refill Level (documents)</TD>
                                <TD class="evenrowdata-l">
                    %ifvar maxDocsDefStore equals('0')%
                    Suspended
                    %else%
					%value minDocsDefStore encode(html)%
                    %endif%
                                </TD>
                            </TR>
                        %else%
                            <TR>
                                <TD class="evenrow">Capacity (documents)</TD>
                                <TD class="evenrowdata-l">(Broker Not Configured)</TD>
                            </TR>

                            <TR>
                                <TD class="oddrow">Refill Level (documents)</TD>
                                <TD class="oddrowdata-l">(Broker Not Configured)</TD>
                            </TR>
                        %endif%

                            <!-- <TR>
                                <TD class="evenrow">Number of Documents Retrieved per Transaction</TD>
                                <TD class="evenrowdata-l">%value tsNumMsgs encode(html)%</TD>
                            </TR> -->

                            <TR>
                                <TD class="space" colspan="2">&nbsp;</TD>
                            </TR>

                            <TR>
                                <TD class="heading" colspan=2>Trigger Document Store</TD>
                            </TR>

                            <TR>
                                <TD class="oddrow">Store Location</TD>
                                <TD class="oddrowdata-l">%value triggerDBGroup encode(html)%</TD>
                            </TR>

                            <TR>
                                <TD class="evenrow">Initial Store Size (MB)</TD>
                                <TD class="evenrowdata-l">%value triggerDBSize encode(html)%</TD>
                            </TR>

<!--
                            <TR>
                                <TD class="space" colspan="2">&nbsp;</TD>
                            </TR>

                            <TR>
                                <TD class="heading" colspan=2>Inbound Document History</TD>
                            </TR>
-->                            

                            <TR>
                                <TD class="oddrow">Inbound Document History (minutes)</TD>
                                %ifvar exactlyOnceSupported equals('true')%
                                <TD class="oddrowdata-l">Not Available</TD>
                                %else%
                                    %ifvar isBrokerConfigured equals('false')%
                                    <TD CLASS="oddrowdata-l">Not Available</TD>
                                    %else%
	                                <TD class="oddrowdata-l">%value maxLifeOfMessageHistory encode(html)%</TD>
                                    %endif%
                                %endif%
                            </TR>
<!-- 
                            <TR>
                                <TD class="space" colspan="2">&nbsp;</TD>
                            </TR>

                           <TR>
                                <TD class="heading" colspan=2>Inbound Client Side Queuing</TD>
                            </TR> 
-->

                            <TR>
                                <TD class="evenrow">Inbound Client Side Queuing</TD>
                                %ifvar exactlyOnceSupported equals('true')%
                                <TD CLASS="evenrowdata-l">Not Available</TD>
                                %else% 
                                    %ifvar isBrokerConfigured equals('false')%
                                    <TD CLASS="evenrowdata-l">Not Available</TD>
                                    %else%
                                        <TD CLASS="evenrowdata-l">
                                        %ifvar INBOUNDQUEUING equals('on')%
                                            On
                                        %else%
                                            Off
                                        %endif%
                                        </TD>
                                    %endif%
                                %endif%
                            </TR>
                            <TR>
                                <TD class="oddrow">Run Trigger Service As User</TD>
                                <TD class="oddrowdata-l">%value TRIGGERUSER encode(html)%</TD>
                            </TR>

                            <TR>
                                <TD class="space" colspan="2">&nbsp;</TD>
                            </TR>



                            
                            <TR>
                                <TD class="heading" colspan=2>Outbound Document Store</TD>
                            </TR>

                            <!-- This config was moved to the WM Messaging Connection Alias Settings in 9.7.
                            <TR>
                                <TD class="oddrow">Current Documents in Outbound Store</TD>
                                <TD class="oddrowdata-l">
                                    %ifvar isBrokerConfigured equals('true')%
                                        %value curDocsInOutboundClientSideQueue encode(html)%
                                    %else%
                                        (Broker Not Configured)
                                    %endif%
                                </TD>
                            </TR>
                            -->

                            <TR>
                                <TD class="oddrow">Maximum Documents to Send per Transaction</TD>
                                <TD class="oddrowdata-l">
                                    %ifvar isBrokerConfigured equals('true')%
                                        %value maxDocsSentPerTransaction encode(html)%
                                    %else%
                                        (Broker Not Configured)
                                    %endif%
                                </TD>
                            </TR>
                             <TR>
                                <TD class="space" colspan="2">&nbsp;</TD>
                            </TR>
                            
                           
                            
                        %onerror%
                            <script>writeMessage("%value errorMessage encode(html_javascript)%");</script>
                        %endinvoke%
                            
                        %invoke wm.server.xarecovery:getXARecoveryStoreSettings%
                            
                            <TR>
                                <TD class="heading" colspan=2>XA Recovery Store</TD>
                            </TR>
                            <TR>
                                <TD class="oddrow">Store Location</TD>
                                <TD class="oddrowdata-l">%value defaultStoreDBGroup encode(html)%</TD>
                            </TR>
                            <TR>
                                <TD class="evenrow">Initial Store Size (MB)</TD>
                                <TD class="evenrowdata-l">%value defaultStoreDBSize encode(html)%</TD>
                            </TR>
                            
                        %onerror%
                            <script>writeMessage("%value errorMessage encode(html_javascript)%");</script>
                        %endinvoke%

                    </TABLE>
                </TD>
            </TR>
        </TABLE>
    </BODY>
</HTML>
