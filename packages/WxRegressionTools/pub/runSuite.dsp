
<html> 

  <!-- Copyright (c) 2016, Software AG  All Rights Reserved. -->

	<head>
		<title>Run Test</title>
		%include webMethods.js%
		
		<script>
	

	function selectPackage(){

		 var x = document.getElementById("packageName").value;
		 //console.log("type :" + x);
		 window.location.href='runTest.dsp?packageName='+ x;
		 
		 

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
