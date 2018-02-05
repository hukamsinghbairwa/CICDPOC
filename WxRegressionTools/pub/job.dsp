
<html> 

  <!-- Copyright (c) 2016, Software AG  All Rights Reserved. -->

	<head>
		<title>Trigger Job</title>
		%include htmlHeadDefaults.dsp%
		<script type="text/javascript">
			function validateJob(ele) { 
					//alert("changed to - "+ele.value); 
					if(ele.value=="build-deploy"){
						/*document.getElementById("vcs").style.visibility = "hidden";
						document.getElementById("vcs1").style.visibility = "hidden";
						document.getElementById("vcs2").style.visibility = "hidden";
						document.getElementById("vcs3").style.visibility = "hidden";*/
						document.getElementById("vcs").style.display = "none";
						document.getElementById("vcs1").style.display = "none";
						document.getElementById("vcs2").style.display = "none";
						document.getElementById("vcs3").style.display = "none";
						document.getElementById("testSuite").style.display="none";
						document.getElementById("buildSource").style.display="";
					}
					else if(ele.value=="checkout-build-deploy"){
						//document.getElementById("testSuitePackageDir").disabled = true;
						//document.getElementById("testSuitePackageDir").style.visibility = "hidden";
						document.getElementById("vcs").style.display = "";
						document.getElementById("vcs1").style.display = "";
						document.getElementById("vcs2").style.display = "";
						document.getElementById("vcs3").style.display = "";
						document.getElementById("testSuite").style.display="none";
						document.getElementById("buildSource").style.display="none";
					}
					else if(ele.value=="checkout-build-deploy-test"){
						//document.getElementById("testSuitePackageDir").disabled = false;
						//document.getElementById("testSuitePackageDir").style.visibility = "visible";
						document.getElementById("vcs").style.display = "";
						document.getElementById("vcs1").style.display = "";
						document.getElementById("vcs2").style.display = "";
						document.getElementById("vcs3").style.display = "";
						document.getElementById("testSuite").style.display="";
						document.getElementById("buildSource").style.display="none";
					}
			}
			function identifyTheProperties() { 
					//alert('You clicked the bottom text'); 
					var jobType = document.getElementById("jobType");
					validateJob(jobType);
			}
		</script>
 </head>
	</head> 

	<body onload="identifyTheProperties()">   
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
				<TD class="evenrow-1"><select name="jobType" style="width: 100%;" id="jobType" onchange="validateJob(this)" value = "%value jobType%">
				    <option value="build-deploy">build-deploy</option>
					<option value="checkout-build-deploy">checkout-build-deploy</option>
					<option value="checkout-build-deploy-test">checkout-build-deploy-test</option>
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
			<tr id="vcs1">
				<TD class="evenrow">VCS Username : </TD>
				<TD class="evenrow-1"><input type="text" name="vUsername" style="width: 100%;" value = "%value vUsername%"></TD>
				<TD class="evenrow">Username</TD>
			</tr>
			<tr id="vcs2">
				<TD class="evenrow">VCS Password : </TD>
				<TD class="evenrow-1"><input type="PASSWORD" name="vPassword" style="width: 100%;" value = "%value vPassword%"></TD>
				<TD class="evenrow">Password</TD>
			</tr>
			<tr id="vcs3">
				<TD class="evenrow">VCS URL : </TD>
				<TD class="evenrow-1"><input type="text" name="vUrl" style="width: 100%;" value = "%value vUrl%"></TD>
				<TD class="evenrow">VCS URL</TD>
			</tr>
			<tr>
				<TD class="evenrow">ABE Directory : </TD>
				<TD class="evenrow-1"><input type="text" name="assetBuildEnvDir" style="width: 100%;" value = "%value assetBuildEnvDir%"></TD>
				<TD class="evenrow">Asset Build Environment Directory</TD>
			</tr>			
			<tr>
				<TD class="evenrow">Deployer Directory : </TD>
				<TD class="evenrow-1"><input type="text" name="deployerDir" style="width: 100%;" value = "%value deployerDir%"></TD>
				<TD class="evenrow">Deployer Package Directory</TD>
			</tr>	
			<tr>
				<TD class="evenrow">Packages to be Deployed : </TD>
				<TD class="evenrow-1"><input type="text" name="packagesToBeDeployed" style="width: 100%;" value = "%value packagesToBeDeployed%"></TD>
				<TD class="evenrow">Comma Seperated values or Regex e.g: Js_*, * etc</TD>
			</tr>			
			<tr>
				<TD class="evenrow">Target Server Host : </TD>
				<TD class="evenrow-1"><input type="text" name="tHost" style="width: 100%;" value = "%value tHost%"></TD>
				<TD class="evenrow">Target IS host name</TD>
			</tr>
			<tr>
				<TD class="evenrow">Target Server Port : </TD>
				<TD class="evenrow-1"><input type="text" name="tPort" style="width: 100%;" value = "%value tPort%"></TD>
				<TD class="evenrow">Target IS Port</TD>
			</tr>
			<tr>
				<TD class="evenrow">Target Server Username : </TD>
				<TD class="evenrow-1"><input type="text" name="tUsername" style="width: 100%;" value = "%value tUsername%"></TD>
				<TD class="evenrow">Target Environment Username</TD>
			</tr>
			<tr>
				<TD class="evenrow">Target Server Password : </TD>
				<TD class="evenrow-1"><input type="PASSWORD" name="tPassword" style="width: 100%;" value = "%value tPassword%"></TD>
				<TD class="evenrow">Target Environment Password</TD>
			</tr>
			<tr>
				<TD class="evenrow">Deployer Server Username : </TD>
				<TD class="evenrow-1"><input type="text" name="dUsername" style="width: 100%;" value = "%value dUsername%"></TD>
				<TD class="evenrow">Username</TD>
			</tr>
			<tr>
				<TD class="evenrow">Deployer Server Password : </TD>
				<TD class="evenrow-1"><input type="PASSWORD" name="dPassword" style="width: 100%;" value = "%value dPassword%"></TD>
				<TD class="evenrow">Password</TD>
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
				<td><input type="submit" value="Trigger Job"></td>
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
