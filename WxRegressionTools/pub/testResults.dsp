<html> 

  <!-- Copyright (c) 2016, Software AG  All Rights Reserved. -->

	<head>
		<title>Mocking Mode</title>
		%include webMethods.js%
		
		<script>
	function deleteMock(a){
	
	//var x = document.getElementById(a).value;
	//console.log("service " );
	window.location.href='deleteMock.dsp?service='+ a;
	}
		
		
</script>
		
		%include htmlHeadDefaults.dsp%
		
		
 </head>
	%invoke wx.regression.suite:runSuite%

	<body>  
	%ifvar status equals('SUCCESS')%
	<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="menusection-Server">
					Test Results
				</td>
			</tr>
		</table>
	<table height=10% ><tr><td>&nbsp;</td></tr></table>
	
	   <table border="1" style="width: 50%;"  align="center" cellpadding=2 cellspacing=2 class="newtable table-striped">
		<tr align="center">
			<th>TestSuite</th>
			
			<th>TestCase count</th>
			<th>No. Of errors</th>
			<th>No. Of Failures</th>
			<th>Is TestRun Successful?</th>
			<!-----<th>Errors</th>
			<th>Failures</th>---->
			
		
		</tr>
		
		<tr align="center">
			<td>%value testSuiteName%</td>
			
			<td>%value count%</td>
			<td>%value errcount%</td>
			<td>%value failurecount%</td>
			<td>%value wasSuccessful%</td>
			<!---<td>%loop error%%value error%<br/>%endloop%</td>
			<td>%loop failures%%value failures%<br/>%endloop%</td>---->
			
		</tr>
		
   </table>
   <table><tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			</table>
			
   	   <table border="0" style="width: 50%;"  align="center" cellpadding=2 cellspacing=2 class="newtable table-striped">
			<tr align="center">
			<th>Errors</th>
			</tr>%loop error%
			<tr align="center">
			<td>%value error%<br/></td>%endloop%
			</tr>
			</table>
			<table><tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			</table>
			
   	   <table border="1" style="width: 50%;"  align="center" cellpadding=2 cellspacing=2 class="newtable table-striped">
			<tr align="center">
			<th>Failures</th>
			</tr>%loop failures%
			<tr align="center">
			<td>%value failures%<br/></td>%endloop%
			</tr>
			</table>
  
 
	
			
		%endif%
	
	%onerror%
	
	 <table width=100% cellspacing=0 cellpadding=0>
			<tr align="center">
				<td>
					<h3>Invalid Parameters</h3>
				</td>
			</tr>
		</table>
		%end%
		 %endinvoke%
		</body> 
</html> 
