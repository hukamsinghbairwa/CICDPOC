
<html> 

  <!-- Copyright (c) 2016, Software AG  All Rights Reserved. -->

	<head>
		<title>Record Test</title>
		%include webMethods.js%
		
<script>

		function deleteService(s){
		//alert(s);
		window.location.href='deleteInterceptor.dsp?service='+ s;

}
		function deletebulk(){
		window.location.href='deleteBulkInterceptor.dsp';
		}
</script>
		
		%include htmlHeadDefaults.dsp%
		
		<link rel="stylesheet" type="text/css" href="webMethods-additions.css">
		<link rel="stylesheet" type="text/css" href="webMethods.css">
 </head>
	

	<body>  
	<table height=10% ><tr><td>&nbsp;</td></tr>
	<tr ><th><h3>INTERCEPTORS</h3></th></tr></table>
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
   <table>
   
   <tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
   </table>
   <table><tr><td>
   <table height=10%  align="left"><tr><td>&nbsp;</td></tr>
   
  <tr ><th valign="bottom"><h3>BULK INTERCEPTORS</h3></th><td>&nbsp;</td><td>&nbsp;</td>

  <th ><input type="button" value="Delete All" onclick="deletebulk()" /></th></tr></table></td></tr></table>
	
  
  
  
	
	<table border="0" style="width: 50%;"  cellpadding=2 cellspacing=2 class="newtable"><tr><td>
	   <table border="1"  style="width: 50%;"  cellpadding=2 cellspacing=0  class="table-striped" >
		<tr> 
			<th align="center">Service</th>
			
		%invoke wx.regression.record:getBulkInterceptors%	
			
		</tr>
		%loop bulkUpload%
		<tr align="center">
		
			<td>%value interceptorconfig/intercept/services%</td>%endloop%
			
	
		</tr>
		  %endinvoke%
   </table></td>
   <td>
    <table border="1" >
		<tr align="center">
			<th>Scheduled From</th>
			<th>Scheduled To</th>
			</tr>
			%invoke wx.regression.record:getBulkInterceptors%	<tr>
		
			<td>%value from%</td>
			<td>%value to%</td>
			
	
		</tr>  %endinvoke%
			</table></td></tr></table>
 
	
	</body> 
</html> 
