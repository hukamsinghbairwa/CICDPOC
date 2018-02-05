
<html> 

  <!-- Copyright (c) 2016, Software AG  All Rights Reserved. -->

	<head>
		<title>Unit Test Automation</title>
		%include htmlHeadDefaults.dsp%
		%invoke wx.regression.dashboard:getAllPackages%
 </head>
	

	<body>  
	
	<form name="WxCIForm" action="status.dsp" method="get">	
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="menusection-Server">
					Trigger Job
				</td>
			</tr>
		</table>
		</br>
		<table width=75% cellspacing=0 cellpadding=0>
			<tr>
				<TD class="heading" colspan=3></TD>
			</tr>
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			<tr> 
				<TD class="evenrow">Job Type : </TD>
				<!--<TD class="evenrow-1"><input type="text" name="jobType" value = "%value jobType%"></TD>-->
				
				<TD class="evenrow-1"><select name="jobType" style="width: 100%;" id="jobType" >
				   %loop packages% <option ></option>%endloop%
					</select>
			    </TD>
				<TD class="evenrow">Supported values are checkout-build-deploy,checkout-build-deploy-test</TD>
			</tr>
			
			<tr id="buildSource">
				<TD class="evenrow">Build Source Directory : </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><input type="text" style="width: 100%;" name="sourceCodeDir" value = "%value sourceCodeDir%">
				<TD class="evenrow">Location of Source Code for Build creation</TD>
			</tr>
			<tr id="vcs">
				<TD class="evenrow">VCS Type : </TD>
				<!---<TD class="evenrow-1"><input type="text" name="vcsType" value = "%value vcsType%"></TD>-->
				<TD class="evenrow-1"><select name="vcsType" style="width: 100%;" value = "%value vcsType%">
					<option value="SVN">SVN</option>
				<TD class="evenrow">Supported values are SVN</TD>
			</tr>
	
			<tr id="testSuite">
				<TD class="evenrow">Test Suite Package Path : </TD>
				<TD class="evenrow-1"><input type="text" name="testSuitePackageDir" style="width: 100%;" id="testSuitePackageDir" value = "%value testSuitePackageDir%"></TD>
				<TD class="evenrow">Full path of Testsuite project</TD>
			</tr>
			<tr>
				<td colspan=3>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" value="Create TestSuite"></td>
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
