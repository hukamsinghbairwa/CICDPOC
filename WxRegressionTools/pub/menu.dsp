<HTML>
	<HEAD>
		
		<script type="text/javascript">
			function toggle(parent, id, imgId) {
				var set = 'none';
				var image = document.getElementById(imgId);
				if(parent.getAttribute('manualhide') == 'true') {
					set = 'table-row';
					parent.setAttribute('manualhide', 'false');
					image.src = 'images/expanded.gif';
				} else {
					parent.setAttribute('manualhide', 'true');
					image.src = 'images/collapsed.gif';
				}
				var elements = getElements("TR", id);
				for ( var i = 0; i < elements.length; i++) {
					var element = elements[i];
					element.style.cssText = "display:"+set;
				}
			}

			function getElements(tag, name) {
				var elem = document.getElementsByTagName(tag);
				var arr = new Array();
				for(i=0, idx=0; i<elem.length; i++) {
					att = elem[i].getAttribute("name");
					if(att == name) {
						arr[idx++] = elem[i];
					}
				}
				return arr;
			}
		</script>
		<link rel="stylesheet" type="text/css" href="webMethods-additions.css">
		<link rel="stylesheet" type="text/css" href="webMethods.css">
	</HEAD>


	%invoke wx.regression.ui:mainMenu%


	<BODY CLASS="menu" onload="initMenu('%value buttonUrls/sections[0]/submenu[0]/url%');">

		<TABLE WIDTH="100%" cellspacing=0 cellpadding=1 border=0>
			%scope buttonUrls%
				%loop sections%
					%ifvar name equals('hide')%
					%else%
						%ifvar value text equals('NoExpand')%
							<TR manualhide="true" onClick="toggle(this, '%value text%_subMenu', '%value text%_twistie');" 
								OnMouseOver="this.className='cursor';">
								<TD CLASS="menusection-Configuration">
									<img id='%value text%_twistie' src="images/collapsed.gif">&nbsp;%value text%
								</TD>
							</TR>
						%else%
							<TR manualhide="true" onClick="toggle(this, '%value text%_subMenu', '%value text%_twistie');" 
								OnMouseOver="this.className='cursor';">
								<TD CLASS="menusection-Configuration">
									<img id='%value text%_twistie' src="images/expanded.gif">&nbsp;%value text%
								</TD>
							</TR>
						%endif%
						
						<!--<TR><TD CLASS="menusection-Configuration%">
						   <img src="images/blank.gif" width="4" height="1"
							border="0">%value text%
						</TD></TR>-->
						%loop submenu%
							%ifvar url -notempty%
								<!--<TR>-->
								%ifvar value value ../text equals('NoExpand')%
									<TR name="%value ../text%_subMenu" style="display: none" >
								%else%
									<TR name="%value ../text%_subMenu" style="display: table-row">
								%endif%
										<TD id="i%value url%"
											%ifvar url equals('nonedsp')%
											  class="menuitem-unclickable"
											%else%
											  class="menuitem"
											  onmouseover="menuMouseOver(this, '%value url%');"
											  onmouseout="menuMouseOut(this);"
											  onclick="document.all['a%value url%'].click();"
											%endif%>
											<nobr>
											<img valign="middle" src="images/blank.gif" width="4" height="1" border="0">
											<img valign="middle"
												%ifvar url%
													id="%value url%" name="%value url%"
												%endif%
												src="images/blank.gif"
												height="8" width="8" border="0">
											%ifvar url equals('nonedsp')%
												%value text%
											%else%
												<A id="a%value url%" TARGET="%ifvar target%%value $host%%value target%%else%body%endif%" 
													HREF="%value url%"	
													%ifvar noarrow%
													%else%
														onclick="menuMove('%value url%', %ifvar target%'%value target%'%else%'body'%endif%); return true;"
													%endif%>
												<script type="text/javascript">
													if( IE() )
														{
															document.write("</a>");
														}
												</script>
												<span class="menuitemspanie">%value text%%ifvar target%...%endif%</span></a>
											%endif%
											</nobr>
										</TD>
									</TR>
								%else%
							%endif%
						%endloop%
						<tr>
							<td class="menuseparator"><img src="images/blank.gif" width="3" height="3" border="0"></td>
						</tr>
					%endif%
				%endloop%
			%endscope%
		</TABLE>

		<div style="height=0; width=0">
		<form name="urlsaver">
		<input type="hidden" name="helpURL" value="doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Server_SrvrStatsScrn">
		</form>
		</div>

	</BODY>
</HTML>
