%invoke wx.automation.ui:triggerJob%
<html> 

  <!-- Copyright (c) 2016, Software AG  All Rights Reserved. -->

	<head>
		<title>Job Status</title>
		%include htmlHeadDefaults.dsp%
		
	</head> 

	<body>   
		
	<form name="WxCIForm" action="job.dsp" method="get">	
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="menusection-Server">
					CI Job Status
				</td>
			</tr>
		</table>
		</br>
		<table width=35% cellspacing=0 cellpadding=0>
			
			<tr>
				%ifvar status equals('SUCCESS')%
					<TD colspan=2 class="success">Job Compledted Successfully</TD>
				%else%
				<TD colspan=2 class="error">Job Terminated with warnings, Please see the wrapper.log for more details...</TD>
				%endifvar%
			</tr>			
		</table>
	</form>	
	</body> 
</html> 
%endinvoke%