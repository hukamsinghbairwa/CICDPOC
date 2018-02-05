
<html> 

  <!-- Copyright (c) 2016, Software AG  All Rights Reserved. -->

	<head>
		<title>Unit Test Automation</title>
		%include webMethods.js%
		<link rel="stylesheet" type="text/css" href="./jquery.datetimepicker.css"/>

		
		%include htmlHeadDefaults.dsp%
		
		
 </head>
	

	<body>  
	
	
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
				<!--<TD class="evenrow-1"><input type="text" name="jobType" value = "%value jobType%"></TD>-->
				
				<TD class="evenrow-1"><select name="packageName" style="width: 50%;" id="packageName" onchange="selectJobType()"> >
				    <option name=%value packageName% >%value packageName%</option>
					</select>
			    </TD>
				<TD class="evenrow">Selected Package</TD>
			</tr>
			
			
		
		
			
		%invoke wx.regression.dashboard:getAllServices%
			
			<tr id="vcs">
			
			
			
				<TD class="evenrow">Select Service: </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><select name="work" id="work" style="width: 50%;" onchange="selectService()">
				<option name="--Select--">--Select--</option>
					%loop services%<option name=%value services%>%value services%</option>%endloop%
				<TD class="evenrow">All Available Services</TD>
				
			</tr>
			
				%endinvoke%
	<tr id="vcs">
			
			
			
				<TD class="evenrow">Select Mock Type: </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><select name="work" id="type" style="width: 50%;" onchange="mock()">
				<option name="--Select--" >--Select--</option>
					<option name=Service> Service</option>
					<option name=Pipeline>Pipeline</option>
				<TD class="evenrow">Available Mock Types</TD>
				
			</tr>
			
			
			<tr id="vcs">
			
			
			
				<TD class="evenrow">Mock Object (Service FQN/Pipeline file): </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><input type="text" id="write" style="width: 50%;" placeholder="Enter service/pipeline here" onchange="provideInput()">
					
				<TD class="evenrow">Service/pipeline</TD>
				
			</tr>
			
			<tr id="vcs">
			
			
			
				<TD class="evenrow">Start Time: </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><input type="text" value="" id="startMock" onchange="startTime()">	
				</TD>
				<TD class="evenrow">Test Data will be recorded from Start Time</TD>
				
			</tr>
			
			<tr id="vcs">
			
			
			
				<TD class="evenrow">End Time: </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><!---<input type="text" value="" id ="endMock"  onchange="endTime()">--->
				<input type="text" value="" id="endMock" onchange="endTime()" >	</TD>
					
				<TD class="evenrow">Test Data will be recorded till End Time</TD>
				
			</tr>
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="button" value="Create Mock" onclick="mockMode()"></td>
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
	<script src="./jquery.js"></script>
	<script src="./jquery.datetimepicker.full.js"></script>
	<script>
		$('#endMock').datetimepicker({
dayOfWeekStart : 1,
lang:'en'
});


		$('#startMock').datetimepicker({
dayOfWeekStart : 1,
lang:'en'
});


	</script>
</html> 
