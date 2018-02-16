
<html> 

  <!-- Copyright (c) 2016, Software AG  All Rights Reserved. -->

	<head>
		<title>Record Test</title>
		%include webMethods.js%
		
		<script>
	var x="--Select--";
	var y="--Select--";

	function selectJobType(){

					var a = document.getElementById("packageName").value;
					//console.log("type :" + a);
					x = a;
		  }
		  
		  function selectService(){
		  
					var b = document.getElementById("work").value;
					//console.log("type :" + b);
					//console.log("type :" + x);
					y=b;
		  }
		  
		  function call(){
					//console.log("call :" +this.y);
					//console.log("call :" + this.x);
					if(this.x=="--Select--" || this.y=="--Select--" )
					{
		alert("Please Select Package and Service...");
		}
		else{			window.location.href='createTestSuite.dsp?packageName='+ this.x +'&service='+ this.y;
		     }       
		  }
		
</script>
		
		%include htmlHeadDefaults.dsp%
		
		
 </head>
	

	<body>  
	%invoke wx.regression.dashboard:getAllPackages%
	
	<form name="WxCIForm" action="status.dsp" method="get">	
		</br>
		<table border="0" style="width: 50%;"  align="center" cellpadding=2 cellspacing=2 class="newtable">
			<tr>
				<TD class="heading" colspan=3></TD>
			</tr>
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			<tr> 
				<TD class="evenrow">Select Package : </TD>
				<!--<TD class="evenrow-1"><input type="text" name="jobType" values = "%value jobType%"></TD>-->
				
				<TD class="evenrow-1"><select name="packageName" style="width: 75%" id="packageName" onchange="selectJobType()" > 
				   
				   %loop packages% <option name=%value packages% >%value packages%</option>%endloop%
					</select>
			    </TD>
				<TD class="evenrow">All Available Packages</TD>
			</tr>
			%endinvoke%
			%invoke wx.regression.suite:getServiceList%
			<tr id="vcs">
			
			
			
				<TD class="evenrow">Select Service : </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><select name="work" id="work" style="width: 75%;" onclick="selectService()">
				<option selected>--Select--</option>
					%loop serviceNames%<option name=%value serviceNames%>%value serviceNames%</option>%endloop%
				<TD class="evenrow">Services will be listed only if the test data is already recorded</TD>
				
			</tr>
			%endinvoke%
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="button" value="Create TestSuite" onclick="call()"></td>
				<td>&nbsp;</td>
			</tr>		
		</table>
	</form>	
	
	</body> 
</html> 
