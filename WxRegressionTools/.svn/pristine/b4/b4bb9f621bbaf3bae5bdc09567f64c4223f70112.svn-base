
<html> 

  <!-- Copyright (c) 2016, Software AG  All Rights Reserved. -->

	<head>
		<title>Record Test</title>
		%include webMethods.js%
		
		<script>
	

	function selectJobType(){

		 var x = document.getElementById("packageName").value;
		 console.log("type :" + x);
		 window.location.href='selectInterceptorServices.dsp?packageName='+ x;
		 
		 
		 
		  }
		  
		
</script>
		
		%include htmlHeadDefaults.dsp%
		
		
 </head>
	

	<body>  
	%invoke wx.regression.dashboard:getAllPackages%
	
	<form name="WxCIForm" action="status.dsp" method="get">	
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="menusection-Server">
					Mock Mode
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
				<!--<TD class="evenrow-1"><input type="text" name="jobType" values = "%value jobType%"></TD>-->
				
				<TD class="evenrow-1"><select name="packageName" style="width: 50%;" id="packageName" onchange="selectJobType()" > 
				   %loop packages% <option name=%value packages% >%value packages%</option>%endloop%
					</select>
			    </TD>
				<TD class="evenrow">All Available Packages</TD>
			</tr>
			
			 
		
			%invoke wx.regression.dashboard:getAllServices%
			
			
		
			<tr id="vcs">
			
			
			
				<TD class="evenrow">Select Service: </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><select name="work" id="work" style="width: 50%;" onchange="selectService()">
					%loop services%<option name=%value services%>%value services%</option>%endloop%
				<TD class="evenrow">All Available Services</TD>
				
			</tr>
			
				%endinvoke%
	
			
			
			
			
			<tr id="vcs">
			
			
			
				<TD class="evenrow">Start Time: </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><input type="datetime-local" name="bdaytime">
					
				<TD class="evenrow">Enter Start Time</TD>
				
			</tr>
			
			<tr id="vcs">
			
			
			
				<TD class="evenrow">End Time: </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><input type="datetime-local" name="bdaytime">
					
				<TD class="evenrow">Enter End Time</TD>
				
			</tr>
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="button" value="Create Mock"></td>
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
