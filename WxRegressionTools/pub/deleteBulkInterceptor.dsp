
<html> 

  <!-- Copyright (c) 2016, Software AG  All Rights Reserved. -->

	<head>
		<title>Record Test</title>
		%include webMethods.js%
		
<script>

		
	
</script>
		
		%include htmlHeadDefaults.dsp%
		
		
 </head>
	

	<body>  
	
	
	<table height=10% align="left" ><tr><td>&nbsp;</td></tr>
	<tr ><th><h3> BULK INTERCEPTORS</h3></th></tr></table>
	%invoke wx.regression.record:deleteBatchInterceptors%
	   <table cellspacing=0px cellpadding=5px height="200px" class="newtable" border="0">
		<tr align="center" >
			<th >%value status%</th>
			
		</tr>
		
		
   </table>
  
   
	</body> 
</html> 
