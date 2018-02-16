
<html> 

  <!-- Copyright (c) 2016, Software AG  All Rights Reserved. -->

	<head>
		<title>Record Test</title>
		%include webMethods.js%
		<link rel="stylesheet" type="text/css" href="./jquery.datetimepicker.css"/>	
		<script type="text/javascript">
	var start;
	var end;
	var service;

	
	function selectService(){
	
	var a = document.getElementById("work").value;
					//console.log("type :" + a);
					service = a;
	
	
	}
	
	function startTime(){
	
	var a = document.getElementById("startMock").value;
					//console.log("start :" + a);
					start = a;
	//console.log("start :" + this.service);
	
	}
	
	function endTime(){
	
	var a = document.getElementById("endMock").value;
					//console.log("end :" + a);
					end = a;
	//console.log("end :" + this.service);
	//console.log("end :" + this.start);
	}
	
	function recordService(){
	//console.log("end :" + this.service);
	//console.log("end :" + this.start);
	
	window.location.href='recordInterceptor.dsp?service='+ this.service +'&startTime='+ this.start +'&endTime='+ this.end ;
	
	 
	}
		

</script>
		
		%include htmlHeadDefaults.dsp%
		
		
 </head>
	

	<body>  
	
	
	<form name="WxCIForm" action="status.dsp" method="get">	
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="menusection-Server">
					Register Service for Mocking:
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
				<TD class="evenrow">Select Package : </TD>
				<!--<TD class="evenrow-1"><input type="text" name="jobType" values = "%value jobType%"></TD>-->
				
				<TD class="evenrow-1"><select name="packageName" style="width: 50%;" id="packageName"  > 
				   <option name=%value packageName% >%value packageName%</option>
					</select>
			    </TD>
				<TD class="evenrow">All Available Packages</TD>
			</tr>
			
			 
		
			%invoke wx.regression.dashboard:getAllServices%
			
			
		
			<tr id="vcs">
			
			
			
				<TD class="evenrow">Select Service: </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><select name="work" id="work" style="width: 50%;" onchange="selectService()">
					<option name="--Select--">--Select--</option>
					%loop services%<option name=%value services%>%value services%</option>%endloop%
				</TD>	
				<TD class="evenrow">All Available Services</TD>
				
			</tr>
			
				%endinvoke%
	
			
			
			
			
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
				<TD class="evenrow-1"><!--<input type="text" class="form_datetime" id ="endMock" style="width: 50%;" onchange="endTime()">-->
				<input type="text" value="" id="endMock" onchange="endTime()" >	
				<TD class="evenrow">Test Data will be recorded till End Time</TD>
				
			</tr>
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="button" value="Register Interceptor" onclick="recordService()"></td>
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
