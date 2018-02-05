<html>
<head>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<link rel="stylesheet" type="text/css" href="webMethods.css">

<script>

function clearAll() {

	document.getElementById("submit").disabled = false;
	results.document.open(); 
	results.document.close();
	document.getElementById("resultTR").style.display = 'none';
	document.getElementById('submit').disabled=true;
}
function check(){

if(document.getElementById('fileNew').value=="")
document.getElementById('submit').disabled=true;


else{
document.getElementById('submit').disabled=false;
}
}
</script>
<style>
#submit:disabled{
background: #eaeaea;
    color: #222;
}
</style>
</head>
<body>

<table width="100%" cellpadding="0" cellspacing="0" >
	<tr>
		<td class="menusection-Server"> Upload</td>
	</tr>
	<tr>
		<td width="10"><img border="0" src="/WmRoot/images/blank.gif" width="10" height="10"></td>
	</tr>
	<tr>
		<td valign="top">
		<table  width="100%" class="tableView">
			
			<tr>
				<td nowrap class="oddrow">&nbsp;</td>
				<td nowrap class="oddcol">&nbsp;</td>
			</tr>
			<form name="content" action="/invoke/wx.regression.record:bulkRegister" target="results" method="post" enctype="multipart/form-data">
			<tr>
				<td nowrap class="evenrow">File :</td>
				<td nowrap "><input type="file" name="file1" id="fileNew" onchange="check()" ></td>
			</tr>
			
			
			<tr>
				<td nowrap class="oddrow"> </td>
				<td nowrap > 
					<input type="submit" onclick="document.getElementById('resultTR').style.display = '';" value="Submit files" id="submit"  disabled>
					<input type="reset" value="Clear" onclick="clearAll();">
				</td>
			</tr>
			</form>
		</table>
		</td>
	</tr>
	</table>
	<table style="width:100%;">
	<tr>
		<td><img border="0" src="/WmRoot/images/blank.gif" width="10" height="10"></td>
	</tr>
	 <tr id="resultTR" >
		<td valign="top" >
		<table style="width:100%;" class="tableView"" >
			<tr>
				<td class="menusection-Server">Results</td>
			</tr>
			<tr>
				<td nowrap class="oddrow">&nbsp;</td>
			</tr>
			<tr>
				<td nowrap class="oddrow-l" width="100%">
					<iframe name="results" id="results" width="100%" height="35px" frameborder="1" style="background-color: white; border: 4px solid #0889cc;" ></iframe>
				</td>
			</tr>
			<tr>
				<td nowrap class="oddrow">&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</BODY>
<script>
document.getElementById("resultTR").style.display = 'none';
</script>
</HTML>
