<HTML>
<HEAD>

<title>webMethods Regression Pack</title>
<script type="text/javascript">
	var state;
	function changeRecordStatus(rec){
		
		if(rec=="false")
			 state="start";
		else	
			 state="stop";
		 
		window.location.href='recordStatus.dsp?state='+ state;

	}
	
	function changeMockStatus(rec){
		
		if(rec=="false")
			 state="start";
		else	
			 state="stop";
		window.location.href='mockStatus.dsp?state='+ this.state;

	}
	function syncAllConfigs(){
		window.location.href='syncConfig.dsp';

	}
	
</script>
%include htmlHeadDefaults.dsp%
</HEAD>
<BODY>
%invoke wx.regression.record:getInterceptorStats%
%invoke wx.regression.mock:getMockStats%
%invoke wx.regression.record:getBulkInterceptorStats%
<table width=100% cellspacing=0 cellpadding=0>
	<tr>
		<td  class="menusection-Server">
				Regression Pack is configured with the following configurations
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>&nbsp;</td></tr>
</table>

 <table cellspacing=0px cellpadding=5px height="200px" class="newtable" border="0">
	     
		
			<tr><TD class="evenrow" align="left">Registered services: </TD>
				
				<TD class="evenrow-1" align="center" width="40px" >%value noOfInterceptors%</td></tr>
				<tr><TD class="evenrow" align="left">Bulk Interceptors Registered: </TD>
				
				<TD class="evenrow-1" align="center" >%value size%</td></tr>
			<tr><TD class="evenrow">Recording Mode is set to: </TD>
				
				<TD class="evenrow-1" align="center">%value recordModeEnabled%</td>
				<td>&nbsp;</td>
				<td><input type="button" id=%value recordModeEnabled% value="Change Status" onclick="changeRecordStatus(this.id)"></td>
				</tr>
			<tr><TD class="evenrow">Registered Mocks: </TD>
				
				<TD class="evenrow-1"  align="center">%value noOfMocks%</td></tr>
			<tr><TD class="evenrow">Mocking Mode is set to: </TD>
				
				<TD class="evenrow-1" align="center">%value mockModeEnabled%</td><td>&nbsp;</td>
				<td><input type="button" id=%value mockModeEnabled% value="Change Status" onclick="changeMockStatus(this.id)"></td>
				</tr>
				
				<tr><TD class="evenrow">Enable all configurations immediately: </TD>
				<td>&nbsp;</td><td>&nbsp;</td>
				<TD class="evenrow-1" ><input type="button" value="Synchronize" onclick="syncAllConfigs()"></TD>
				
				</tr>
			</table>
</BODY>
</HTML>