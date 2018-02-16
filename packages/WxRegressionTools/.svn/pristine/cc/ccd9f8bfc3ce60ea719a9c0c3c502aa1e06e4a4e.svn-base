
<html> 

  <!-- Copyright (c) 2016, Software AG  All Rights Reserved. -->

	<head>
		<title>Record Test</title>
		%include webMethods.js%
		
		<script>
	

	function selectPackage(){

		 var x = document.getElementById("packageName").value;
		 //console.log("type :" + x);
		 window.location.href='selectMockingService.dsp?packageName='+ x;
		 
		 
		 
		  }
		  
		
</script>
		
		%include htmlHeadDefaults.dsp%
		
		
 </head>
	

	
	<body>  
	%invoke wx.regression.dashboard:getAllPackages%
	
	<form name="WxCIForm" action="excelUpload.dsp" method="get">	
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="menusection-Server">
					Bulk upload for services:
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
			<tr> 
				<TD class="evenrow">Download Format here -> </TD>
				<!--<TD class="evenrow-1"><input type="text" name="jobType" values = "%value jobType%"></TD>-->
				<TD class="evenrow">
				<a href="config/bulkUpload.xml" download> 
				<img border="0" src="images/xml.jpg" alt="W3Schools" width="50" height="55">
				</a></TD>
			<!---	<TD class="evenrow-1"><select name="packageName" style="width: 50%;" id="packageName" onchange="selectPackage()" > 
				   %loop packages% <option name=%value packages% >%value packages%</option>%endloop%
					</select>
			    </TD>-->
				<TD class="evenrow">XML Format</TD>
			</tr>
	<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>

	<tr> 
				<TD class="evenrow">&nbsp;</TD>
				<!--<TD class="evenrow-1"><input type="text" name="jobType" values = "%value jobType%"></TD>-->
				<TD class="evenrow">
				<input type="submit" value="Next"/>
				</TD>
			<!---	<TD class="evenrow-1"><select name="packageName" style="width: 50%;" id="packageName" onchange="selectPackage()" > 
				   %loop packages% <option name=%value packages% >%value packages%</option>%endloop%
					</select>
			    </TD>-->
				<TD class="evenrow">XML Format</TD>
			</tr>
			
			
		</table>
		
		
		
	</form>	
	%endinvoke%
	</body> 
</html> 
