
<html> 

  <!-- Copyright (c) 2016, Software AG  All Rights Reserved. -->

	<head>
		<title>Record Test</title>
		%include webMethods.js%
		<link rel="stylesheet" type="text/css" href="./jquery.datetimepicker.css"/>	
		<script type="text/javascript">
	var mockType="--Select--";
	var service="--Select--";
	var mockInput="none";
	var start="0000/00/00 00:00";
	var end="0000/00/00 00:00";
	
	function selectPackage(){

		 var x = document.getElementById("packageName").value;
		 //console.log("type :" + x);
		 window.location.href='selectMockingService.dsp?packageName='+ x;
		 
		 
		 
		  }
		function selectService(){
	
	var a = document.getElementById("work").value;
					//console.log("type :" + a);
					service = a;
	
	
	}
	
	function selectMockType(){
	
	var a = document.getElementById("type").value;
					//console.log("call :" + a);
					mockType= a;
					
	console.log("call :" + this.service );
	
	}
	
	function selectMockObject(){
	
	var a = document.getElementById("write").value;
					//console.log("final :" + a);
					mockInput = a;
	//console.log("final :" + this.service);
	//console.log("final :" + this.mockType);
	}
	
	function startTime(){
	
	var a = document.getElementById("startMock").value;
					//console.log("start :" + a);
					start = a;
	//console.log("start :" + this.service);
	//console.log("start :" + this.mockType);
	//console.log("start :" + this.mockInput);
	}
	
	function endTime(){
	
	var a = document.getElementById("endMock").value;
					//console.log("end :" + a);
					end = a;
	//console.log("end :" + this.service);
	//console.log("end :" + this.mockType);
	//console.log("end :" + this.mockInput);
	//console.log("end :" + this.start);
	}
	
	function registerMock(){
	
	//console.log("mock " + this.service);
	//console.log("mock " + this.mockType);
	//console.log("mock " + this.mockInput);
	//console.log("mock " + this.start);
	//console.log("mock " + this.end);
	if(this.service=="--Select--" || this.mockType=="--Select--" ||
		this.mockInput=="none" || this.start=="0000/00/00 00:00" || this.end=="0000/00/00 00:00"
	){
		alert("Please select Service, Mock Type, Mocking Object, Start time and End time...");
	}else{
		window.location.href='createMock.dsp?service='+ this.service +'&startTime='+ this.start +'&endTime='+ this.end +'&mockService='+ escape(this.mockInput) +'&mockType='+ this.mockType +'&mockPipeline='+ escape(this.mockInput);
	}
		
	
	
	}
	
		

</script>
		
		%include htmlHeadDefaults.dsp%
		
		
 </head>
	

	<body>  
	
	
	<form name="WxCIForm" action="status.dsp" method="get">	
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="menusection-Server">
					Register Service for Mocking :
				</td>
			</tr>
		</table>
		</br>
		<table  cellspacing=0px cellpadding=5px  class="newtable" border="0" style="width: 50%;">
			<tr>
				<TD class="heading" colspan=3></TD>
			</tr>
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			%invoke wx.regression.dashboard:getAllPackages%
			<tr> 
				<TD class="evenrow">Select Package : </TD>
				<!--<TD class="evenrow-1"><input type="text" name="jobType" values = "%value jobType%"></TD>-->
				
				<TD class="evenrow-1"><select name="packageName"  id="packageName" onchange="selectPackage()" > 
				   <option name=%value packageName% >%value packageName%</option>
				   %loop packages% <option name=%value packages% >%value packages%</option>%endloop%
					</select>
			    </TD>
				<TD class="evenrow">All Available Packages</TD>
			</tr>
			%endinvoke%
			 
		
			%invoke wx.regression.dashboard:getAllServices%
			
			
		
			<tr id="vcs">
			
			
			
				<TD class="evenrow">Select Service: </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><select name="work" id="work" style="width: 75%;" onchange="selectService()">
				<option name="--Select--">--Select--</option>
					%loop services%<option name=%value services%>%value services%</option>%endloop%
				</TD>	
				<TD class="evenrow">All Available Services</TD>
				
			</tr>
			
				%endinvoke%
	
			<tr id="vcs">
			
			
			
				<TD class="evenrow">Select Mock Type: </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><select name="work" id="type" style="width: 75%;" onchange="selectMockType()">
				<option name="--Select--" >--Select--</option>
					<option name=Service> Service</option>
					<option name=Pipeline>Pipeline</option>
				<TD class="evenrow">Available Mock Types</TD>
				
			</tr>
			
			<tr id="vcs">
			
			
			
				<TD class="evenrow">Mock Object (Service FQN/Pipeline file): </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><input type="text" id="write" style="width: 75%;" placeholder="Enter service/pipeline here" onchange="selectMockObject()">
					
				<TD class="evenrow">Service/pipeline</TD>
				
			</tr>
			
			
			
			<tr id="vcs">
			
			
			
				<TD class="evenrow">Start Time: </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><input type="text" value="" style="width: 75%;" id="startMock" onchange="startTime()">	
				</TD>
				<TD class="evenrow">Test Data will be recorded from Start Time</TD>
				
			</tr>
			
			<tr id="vcs">
			
			
			
				<TD class="evenrow">End Time: </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><!--<input type="text" class="form_datetime" id ="endMock" style="width: 50%;" onchange="endTime()">-->
				<input type="text" value="" id="endMock" style="width: 75%;" onchange="endTime()" >	
				<TD class="evenrow">Test Data will be recorded till End Time</TD>
				
			</tr>
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="button" value="Register Mock" onclick="registerMock()"></td>
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
		var validateRange=function(){
			if(Date.parse($('#startMock').val())>=Date.parse($("#endMock").val()))
			{
				alert("Start date must be less than end date");
				return false;
			}
			return true;
		};
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
