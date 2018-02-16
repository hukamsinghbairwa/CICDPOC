
<html> 

  <!-- Copyright (c) 2016, Software AG  All Rights Reserved. -->

	<head>
		<title>Record Test</title>
		%include webMethods.js%
		<link rel="stylesheet" type="text/css" href="./jquery.datetimepicker.css"/>
		<script>
	

	function selectPackage(){

		 var x = document.getElementById("packageName").value;
		 //console.log("type :" + x);
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
					Register Service for Recording Test Data:
				</td>
			</tr>
		</table>
		</br>
		<table cellspacing=0px cellpadding=5px  class="newtable" border="0" style="width: 50%;">
			<tr>
				<TD class="heading" colspan=3></TD>
			</tr>
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			<tr> 
				<TD class="evenrow">Select Package : </TD>
				<!--<TD class="evenrow-1"><input type="text" name="jobType" values = "%value jobType%"></TD>-->
				
				<TD class="evenrow-1"><select name="packageName" style="width: 75%;" id="packageName" onchange="selectPackage()" > 
				   %loop packages% <option name=%value packages% >%value packages%</option>%endloop%
					</select>
			    </TD>
				<TD class="evenrow">All Available Packages</TD>
			</tr>
		
		</table>
	</form>	
	%endinvoke%
	</body> 

</html> 
