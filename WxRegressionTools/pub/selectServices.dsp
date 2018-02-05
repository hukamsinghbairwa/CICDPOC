
<html> 

  <!-- Copyright (c) 2016, Software AG  All Rights Reserved. -->

	<head>
		<title>Unit Test Automation</title>
		%include webMethods.js%
		
		<script>
	
	
	
		
</script>
		
		%include htmlHeadDefaults.dsp%
		
		
 </head>
	

	<body>  
	
	
	<form name="WxCIForm" action="status.dsp" method="get">	
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="menusection-Server">
					Record Mode
				</td>
			</tr>
		</table>
		</br>
		<table width=75% cellspacing=0 cellpadding=0>
			<tr>
				<TD class="heading" colspan=3></TD>
			</tr>
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			<tr> 
				<TD class="evenrow">Packages : </TD>
				<!--<TD class="evenrow-1"><input type="text" name="jobType" value = "%value jobType%"></TD>-->
				
				<TD class="evenrow-1"><select name="packageName" style="width: 50%;" id="packageName" onchange="selectJobType()"> >
				    <option name=%value packageName% >%value packageName%</option>
					</select>
			    </TD>
				<TD class="evenrow">All Available Packages</TD>
			</tr>
			
			
		
		
			
		%invoke wx.regression.dashboard:getAllServices%
			
			<tr id="vcs">
			
			
			
				<TD class="evenrow">Services: </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><select name="work" id="work" style="width: 50%;">
					%loop services%<option name=%value services%>%value services%</option>%endloop%
				<TD class="evenrow">All Available Services</TD>
				
			</tr>
			
				%endinvoke%
	
			
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" value="Create TestSuite"></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			<tr>
				<TD class="heading" colspan=3></TD>
			</tr>			
		</table>
	</form>	
	%endinvoke%
	</body> 
</html> 
