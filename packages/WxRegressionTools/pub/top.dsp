<html>

  <!-- Copyright (c) 2012, Software AG  All Rights Reserved. -->

	<head>
		 %include htmlHeadDefaults.dsp% 
		
		<style>
			.environment
				{
				color: white;
				background-color: gray;
				font-weight: bold;
				font-size: 14pt;
				padding: 0px 0px 0px 20px;
				line-height: 40px; 
				}
			.adminAbout
				{
				color: white;
				background-color: gray;
				text-align: right;
				font-size: 8pt;
				}
			.adminAbout:link {color:white}
			.adminAbout:visited {color:white}
			.adminAbout:active {color:white}
			.adminAbout:hover{color:white}
		</style>
		    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <meta http-equiv="Expires" content="-1">
    <link rel="stylesheet" type="text/css" href="top.css">
    <link rel="stylesheet" type="text/css" href="webMethods.css">
	</head>

	<body class="topbar" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">
    <table border=0 cellspacing=0 cellpadding=0 height=70 width="100%">
      <tr>
        <td>
          <table height=14 width="100%" cellspacing=0 cellpadding=0 border=0>
            <tr>
              %invoke wx.regression.common:getServerDetails%

              <td style="font-family: 'Arial';color: #ffffff;font-weight: bold;font-size: 18px; padding-left:2%">
                PERFORMANCE.READY<br />TOOLS
              </td>

              <td width="100%" <div style="padding-left:30%;">
                 <table width="100%">
                 <tr>
				 <td style="font-family: 'Arial';color: #ffffff;font-weight: bold;font-size: 22px;">
				   Regression Pack
				   </td>
                   <td class="toptitle">
                   %value host%:%value port% 
                   </td>
				   
              %endinvoke%
            </tr>
          </table>
		  </div>
        </td>


      </tr>
    </table>
    </td>
	
    </tr>
      
    
  </body>
</html>
