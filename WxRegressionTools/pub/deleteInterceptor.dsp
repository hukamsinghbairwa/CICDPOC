
<html> 

  <!-- Copyright (c) 2016, Software AG  All Rights Reserved. -->

	<head>
		<title>Record Test</title>
		%include webMethods.js%
		
<script>

		function deleteService(s){
		
		
		window.location.href='deleteInterceptor.dsp?service='+ s;

}
		
</script>
		
		%include htmlHeadDefaults.dsp%
		
		
 </head>
	%invoke wx.regression.record:deleteInterceptor%

	<body>  
	<table height=10% ><tr><td>&nbsp;</td></tr></table>
	%invoke wx.regression.record:getInterceptors%
	  <table border="1" style="width: 50%;"  align="center" cellpadding=2 cellspacing=2 class="table-striped newtable">
		<tr align="center" >
			<th>Service</th>
			<th >Scheduled From</th>
			<th>Scheduled To</th>
			<th>Is Scheduled</th>
			<th>Delete Interceptor</th>
		</tr>
		%loop Interceptors%
		<tr align="center">
			<td>%value service%</td>
			<td>%value from%</td>
			<td>%value to%</td>
			<td>%value active%</td>
			<td><input type="button" id=%value service% value="Delete" onclick="deleteService(this.id)"></td>
		</tr>
		%endloop%
   
   </table>
   %endinvoke%
	
	</body> 
</html> 
