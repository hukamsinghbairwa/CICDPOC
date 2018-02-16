
<html> 

  <!-- Copyright (c) 2016, Software AG  All Rights Reserved. -->

	<head>
		<title>Record Test</title>
		%include webMethods.js%
		<link rel="stylesheet" type="text/css" href="./jquery.datetimepicker.css"/>	
		<script type="text/javascript">
	
	var service = "--Select--";
	var packages;
	
		function selectPackage(){

		//var x = document.getElementById("packageName").value;
		 //console.log("type :" + x);
		 window.location.href='runTest.dsp?packageName='+ document.getElementById("packageName").value;
		 

		  }
function selectService(){
 var x = document.forms["WxCIForm"]["fileLocation"].value;
        if(x=="--Select--" ){
		alert("Please Select TestSuite...");
		return false;}
	
	//var a = document.getElementById("work").value;
					//console.log("type :" + a);
					//console.log("type :" + this.packages);
					//service = a;
	
	
	}

</script>
		
		%include htmlHeadDefaults.dsp%
		
		
 </head>
	

	<body>  
	
	
	<form name="WxCIForm" onsubmit="return selectService()" action="testResults.dsp" method="get">	
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="menusection-Server">
					Run Test
				</td>
			</tr>
		</table>
		</br>
		<table border="0" style="width: 50%;"  align="center" cellpadding=2 cellspacing=2 class="newtable">
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
				
				<TD class="evenrow-1"><select name="packageName" style="width: 75%;" id="packageName" onchange="selectPackage()" > 
				   <option value=%value packageName% selected>%value packageName%</option>
				   %loop packages% 
							<option id=%value packageName% >%value packages%</option>	
				   %endloop%
					</select>
			    </TD>
				<TD class="evenrow">All Available Packages</TD>
			</tr>
			%endinvoke%
			 
		
			
			
			
		
			<tr id="vcs">
			
			
			
				<TD class="evenrow">Select Service: </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><select name="fileLocation" id="work" style="width: 75%;" >
					<option name="--Select--" selected>--Select--</option>%invoke wx.regression.suite:filterTestSuites%
					%loop testSuites%<option value=%value testSuites%>%value testSuites%</option>%endloop%
				</TD>	
				<TD class="evenrow">All Available TestSuites</TD>
				
			</tr>
			
				%endinvoke%
				
				%invoke wx.regression.common:getServerDetails%
	<tr id="vcs">
			
			
			
				<TD class="evenrow">Host: </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><input type="text" name="host" style="width: 75%;" value=%value host%>
					
				</TD>	
				<TD class="evenrow">Enter Valid Host</TD>
				
			</tr>
			
			<tr id="vcs">
			
			
			
				<TD class="evenrow">Port: </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><input type="text" name="port" style="width: 75%;" value=%value port%>
					
				</TD>	
				<TD class="evenrow">Enter Valid Port</TD>
				
			</tr>
			%endinvoke%
			<tr id="vcs">
			
			
			
				<TD class="evenrow">Username: </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><input type="text" name="username" style="width: 75%;" value="Administrator"/>
					
				</TD>	
				<TD class="evenrow">Enter Your UserName</TD>
				
			</tr>
			
			<tr id="vcs">
			<TD class="evenrow">Password: </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>--->
				<TD class="evenrow-1"><input type="password" name="password" style="width: 75%;" value=""/>
				</TD>	
				<TD class="evenrow">Enter Your Password</TD> 
				
			</tr>
			
			
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			
			
			
			
			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" value="Run Suite" ></td>
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
		
</html> 
