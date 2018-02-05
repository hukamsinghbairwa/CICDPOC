package wx.regression;

// -----( IS Java Code Template v1.2

import com.wm.data.*;
import com.wm.util.Values;
import com.wm.app.b2b.server.Service;
import com.wm.app.b2b.server.ServiceException;
// --- <<IS-START-IMPORTS>> ---
import com.wm.util.coder.IDataXMLCoder;
import com.wm.util.Config;
import com.wm.lang.ns.NSNode;
import com.wm.lang.ns.NSPackage;
import com.wm.app.b2b.client.Context;
import com.wm.app.b2b.client.ns.NSQuery;
import com.wm.app.b2b.server.ServerAPI;
import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.filefilter.WildcardFileFilter;
import junit.framework.TestResult;
import com.wm.ps.test.*;
// --- <<IS-END-IMPORTS>> ---

public final class common

{
	// ---( internal utility methods )---

	final static common _instance = new common();

	static common _newInstance() { return new common(); }

	static common _cast(Object o) { return (common)o; }

	// ---( server methods )---




	public static final void compareDates (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(compareDates)>> ---
		// @sigtype java 3.5
		// [i] field:0:optional fromDate
		// [i] field:0:optional toDate
		// [i] field:0:required startDatePattern
		// [i] field:0:required endDatePattern
		// [o] field:0:required inRange
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	input1 = IDataUtil.getString( pipelineCursor, "startDate" );
			String	input2 = IDataUtil.getString( pipelineCursor, "endDate" );
			String	startDatePattern = IDataUtil.getString( pipelineCursor, "startDatePattern" );
			String	endDatePattern = IDataUtil.getString( pipelineCursor, "endDatePattern" );
			String result;
			
		pipelineCursor.destroy();
		
		 
		    try {
		    
		    Date fromDate=new SimpleDateFormat(startDatePattern).parse(input1);
		    Date toDate=new SimpleDateFormat(endDatePattern).parse(input2);
		    
		    int comp1 = fromDate.compareTo(toDate);
		   
		   
		    result=String.valueOf(comp1);
		   
		    
		    IDataCursor pipelineCursor_1 = pipeline.getCursor();
		    IDataUtil.put( pipelineCursor_1, "result", result);
		    pipelineCursor_1.destroy();
		    
		    }
		    catch(Exception e){
		    	
		    	
		    	
		    }
			
		// --- <<IS-END>> ---

                
	}



	public static final void createTestFromCapturedPipelineData (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(createTestFromCapturedPipelineData)>> ---
		// @sigtype java 3.5
		// [i] field:0:required serviceName
		// [i] field:0:optional packageName
		// [i] field:0:optional removePipelineData {"true","false"}
		// [i] field:0:optional testSuiteNamePrefix
		String serviceName = IDataUtil.getString(pipeline.getCursor(), "serviceName");
		String packageName = IDataUtil.getString(pipeline.getCursor(), "packageName");
		boolean removePipelineData = IDataUtil.getBoolean(pipeline.getCursor(), "removePipelineData", false);
		String testSuiteNamePrefix = IDataUtil.getString(pipeline.getCursor(), "testSuiteNamePrefix");
		  
		com.sag.wx.is.regressiontools.testbuilder.TestCaseBuilder builder = new com.sag.wx.is.regressiontools.testbuilder.TestCaseBuilder();
		try {
		builder.createTestCasesForService(serviceName, packageName, removePipelineData, testSuiteNamePrefix);
		} catch(Exception e) {
			throw new ServiceException("Could not create test cases: " + e); 
		}
		// --- <<IS-END>> ---

                
	}



	public static final void filterSuite (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(filterSuite)>> ---
		// @sigtype java 3.5
		// [i] field:0:required packageName
		// [o] field:1:required testSuites
		String fileSeparator = System.getProperty("file.separator");
		IDataCursor pipelineCursor = pipeline.getCursor();
		//String	suite = IDataUtil.getString( pipelineCursor, "suite" );
		String	packageName = IDataUtil.getString( pipelineCursor, "packageName" );
		//pipelineCursor.destroy();
		  
		
		//FileFilter fileFilter = new WildcardFileFilter(filter);
		
		String resourcesDirectory = ServerAPI.getPackageConfigDir(packageName).getAbsolutePath()
				.substring(0,ServerAPI.getPackageConfigDir(packageName).getAbsolutePath().lastIndexOf("config"))
				+"resources"+fileSeparator;
		String pipelineDir=resourcesDirectory+"test"+fileSeparator+"setup";
		ArrayList<String> fileNames = new ArrayList();
		File dir = new File(pipelineDir);
		FileFilter fileFilter = new WildcardFileFilter("*.xml");
		File[] files = dir.listFiles(fileFilter);
		
		for (int i = 0; i < files.length; i++) {
			
			fileNames.add(files[i].getName());
			
		   //FileUtils.deleteQuietly(files[i]);
		}
		IDataUtil.put( pipelineCursor, "testSuites", fileNames.toArray(new String[fileNames.size()]) );
		pipelineCursor.destroy();
		
		
		// pipeline
		// --- <<IS-END>> ---

                
	}



	public static final void getAllPackages (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getAllPackages)>> ---
		// @sigtype java 3.5
		// [i] field:0:required username
		// [i] field:0:required password
		// [i] field:0:required server
		// [o] field:1:required packages
		IDataCursor pipelineCursor = pipeline.getCursor();
		String	server = IDataUtil.getString( pipelineCursor, "server" );
		//System.out.println(server);
		String	username = IDataUtil.getString( pipelineCursor, "username" );
		String	password = IDataUtil.getString( pipelineCursor, "password" );
		Context context = new Context();
		try {
			context.connect(server, username, password);
			NSQuery myqueryNode=new NSQuery(context);
			NSPackage[] allPkgs=myqueryNode.getAllPackages();
			int index=0;
			String[] packages = new String[allPkgs.length];
			for(NSPackage pkg:allPkgs)
		    {
				if(!pkg.getName().startsWith("Wm")){
				packages[index]=pkg.getName();
				index++;
				}
		    }
			
			 int newSize = 0;
		        for(String newlist:packages)
		        {
		        	 if (newlist != null) {
					        newSize++;
				    }
		        }
		        
				String[] localAllElements = new String[newSize];
				int newIndex = 0;
				
				for(String final_list:packages)
				{
					if (final_list!= null) {
				        localAllElements[newIndex] = final_list;
				        newIndex++;
				    }
				}
			IDataUtil.put( pipelineCursor, "packages", localAllElements);
			context.disconnect();
			
		} catch (com.wm.app.b2b.client.ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		// --- <<IS-END>> ---

                
	}



	public static final void getConfigDirectory (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getConfigDirectory)>> ---
		// @sigtype java 3.5
		// [i] field:0:required packageName
		// [o] field:0:required configDirectory
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	packageName = IDataUtil.getString( pipelineCursor, "packageName" );
		
			String configDirectory = ServerAPI.getPackageConfigDir(packageName).getAbsolutePath();
		// pipeline 
		 
		IDataUtil.put( pipelineCursor, "configDirectory", configDirectory );
		pipelineCursor.destroy();
			
		// --- <<IS-END>> ---

                
	}



	public static final void getExtendedSetting (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getExtendedSetting)>> ---
		// @sigtype java 3.5
		// [i] field:0:required key
		// [o] field:0:required value
		
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	key = IDataUtil.getString( pipelineCursor, "key" );
			String value ="";
			if(key!=null){
				value = Config.getProperty(key);
			}
			
		// pipeline
		
		IDataUtil.put( pipelineCursor, "value",  value);
		pipelineCursor.destroy();
		// --- <<IS-END>> ---

                
	}



	public static final void getResourcesDirectory (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getResourcesDirectory)>> ---
		// @sigtype java 3.5
		// [i] field:0:required packageName
		// [o] field:0:required resourcesDirectory
		// [o] field:0:required packagesDirectory
		// pipeline
		String fileSeparator = System.getProperty("file.separator");
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	packageName = IDataUtil.getString( pipelineCursor, "packageName" );
		
			String resourcesDirectory = ServerAPI.getPackageConfigDir(packageName).getAbsolutePath()
					.substring(0,ServerAPI.getPackageConfigDir(packageName).getAbsolutePath().lastIndexOf("config"))
					+"resources"+fileSeparator;
			String packagesDirectory = ServerAPI.getPackageConfigDir(packageName).getAbsolutePath()
					.substring(0,ServerAPI.getPackageConfigDir(packageName).getAbsolutePath().lastIndexOf("config"))
					;
		// pipeline
		
		IDataUtil.put( pipelineCursor, "resourcesDirectory", resourcesDirectory );
		IDataUtil.put( pipelineCursor, "packagesDirectory", packagesDirectory );
		pipelineCursor.destroy();
			
		// --- <<IS-END>> ---

                
	}



	public static final void getServerDetails (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getServerDetails)>> ---
		// @sigtype java 3.5
		// [o] field:0:required host
		// [o] field:0:required port
		// [o] field:0:required resourcesDir
		// [o] field:0:required pipelineDir
		// pipeline
		String fileSeparator = System.getProperty("file.separator");
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
		IDataUtil.put( pipelineCursor, "host", ServerAPI.getServerName() );
		IDataUtil.put( pipelineCursor, "port", ServerAPI.getCurrentPort()+"" );
		
		IDataUtil.put( pipelineCursor, "resourcesDir", (ServerAPI.getPackageConfigDir("WxRegressionTools")).getAbsolutePath().substring(0, (ServerAPI.getPackageConfigDir("WxRegressionTools")).
				getAbsolutePath().lastIndexOf("config"))+"resources"+fileSeparator );
		IDataUtil.put( pipelineCursor, "pipelineDir", ServerAPI.getServerConfigDir().getAbsolutePath().
				substring(0,ServerAPI.getServerConfigDir().getAbsolutePath().lastIndexOf("config"))+"pipeline"+fileSeparator
				);
		pipelineCursor.destroy(); 
			
		// --- <<IS-END>> ---

                
	}



	public static final void getServiceDetails (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getServiceDetails)>> ---
		// @sigtype java 3.5
		// [i] field:0:required server
		// [i] field:0:required username
		// [i] field:0:required password
		// [i] field:0:required packageName
		// [o] field:1:required services
		IDataCursor pipelineCursor = pipeline.getCursor();
		String	server = IDataUtil.getString( pipelineCursor, "server" );
		String	username = IDataUtil.getString( pipelineCursor, "username" );
		String	password = IDataUtil.getString( pipelineCursor, "password" );
		String	packageName = IDataUtil.getString( pipelineCursor, "packageName" );
		
		Context context = new Context();
		
		 try {
			 
			 NSPackage mypackage=new NSPackage(packageName) {
			};
			 
		        context.connect(server, username, password);
		        
		        NSQuery myqueryNode=new NSQuery(context);
		
		        NSNode[] Nodes=myqueryNode.getRootNode().getNodes(mypackage,null);
		        
		        ArrayList outputArray = new ArrayList();
		        ArrayList listOfServices = new ArrayList();
		        
		        
		        for(NSNode nodes:Nodes)
		        {
		        	         	 
		        	 outputArray=getNodeList(packageName,nodes.getNSName().getFullName().toString(),null);
		        	 
		        	 listOfServices.addAll(outputArray); 
		
		        }
		        
		        String[]	services = new String[listOfServices.size()];	
		
				 for(int j=0;j<listOfServices.size();j++)
				  {
					services[j]=listOfServices.get(j).toString();
				  }
				   
		        int index=0;
		        String[] myservices = new String[services.length];
		        for(String each_service:services)
		        {
		        	if(each_service.contains("flow")||each_service.contains("java")||each_service.contains("AdapterService"))
		        	{
		        		myservices[index]=each_service;
		        		index++;
		        	}
		        }
		        
		 
		        
		        String[] required_services = new String[myservices.length];
		        int count=0;
		        
		        for(String filtered:myservices)
		        {
		       
		        	if(filtered!=null)
		        	{
		        		String[] split1=filtered.split(",");
		        		System.out.println("element 1"+split1[0]);
		        		String[] split2=split1[0].split("=");
		        		System.out.println("service 1"+split2[1]);
		        		required_services[count]=split2[1];
		        		count++;
		        		
		        	}
		        	
		        }
		        
		        int newSize = 0;
		        for(String newlist:required_services)
		        {
		        	 if (newlist != null) {
					        newSize++;
				    }
		        }
		        
				String[] localAllElements = new String[newSize];
				int newIndex = 0;
				
				for(String final_list:required_services)
				{
					if (final_list!= null) {
				        localAllElements[newIndex] = final_list;
				        newIndex++;
				    }
				}
		
				IDataUtil.put( pipelineCursor, "services", localAllElements );
		        context.disconnect();
		    }  catch (com.wm.app.b2b.client.ServiceException e) {
		    	 System.out.println("\n\tCannot connect to server \""+server+"\"");
		         System.exit(0);
			}
			
		// --- <<IS-END>> ---

                
	}



	public static final void invokeTestSuite (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(invokeTestSuite)>> ---
		// @sigtype java 3.5
		// [i] field:0:required packageName
		// [i] field:0:required testSuiteName
		// [i] field:0:required host
		// [i] field:0:required port
		// [i] field:0:required username
		// [i] field:0:required password
		// [o] field:0:required resourcesDirectory
		// [o] field:0:required packagesDirectory
		// [o] field:0:required fileContent
		// [o] field:0:required status
		// [o] field:0:required message
		// [o] field:0:required testSuiteFilenameProperty
		// [o] field:0:required count
		// [o] field:0:required errcount
		// [o] field:0:required failurecount
		// [o] field:0:required wasSuccessful
		// [o] field:0:required error
		// [o] field:0:required failures
		String fileSeparator = System.getProperty("file.separator");
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	packageName = IDataUtil.getString( pipelineCursor, "packageName" );
			String	testSuiteName = IDataUtil.getString( pipelineCursor, "testSuiteName" );
			String	host = IDataUtil.getString( pipelineCursor, "host" );
			String	port = IDataUtil.getString( pipelineCursor, "port" );
			String	username = IDataUtil.getString( pipelineCursor, "username" );
			String	password = IDataUtil.getString( pipelineCursor, "password" );
		//-----------------------
			String resourcesDirectory = ServerAPI.getPackageConfigDir(packageName).getAbsolutePath()
					.substring(0,ServerAPI.getPackageConfigDir(packageName).getAbsolutePath().lastIndexOf("config"))
					+"resources"+fileSeparator;
			String packagesDirectory = ServerAPI.getPackageConfigDir(packageName).getAbsolutePath()
					.substring(0,ServerAPI.getPackageConfigDir(packageName).getAbsolutePath().lastIndexOf("config"))
					;
		// pipeline
		 
		
		
		
		//-----------------------------------------
			String fileContent=null;
			String tempFile=resourcesDirectory+"test"+fileSeparator+"temp"+fileSeparator+"temp.xml";
			
		try{	
				File f1 = new File(resourcesDirectory+"test"+fileSeparator+"temp"); 
			if(f1.exists()==false)
			/*{
				File f = new File(tempFile);
				if(f.exists()==false)
					f.createNewFile();
			
			}*/
			//else{
				f1.mkdir();
				//File f = new File(tempFile);
					//f.createNewFile();
			//}
		}
		catch(Exception e)
		{
			
			
		}
			
			
		/*new File(resourcesDirectory+"test\\temp").mkdirs();
		File f = new File(resourcesDirectory+"test"+fileSeparator+"temp"+fileSeparator+"temp.xml");
		f.createNewFile();
		//File file2 = new File(resourcesDirectory+"test\\temp\\temp.xml");
		//file2.createNewFile();
		}
		catch(Exception e){}*/
		
		String fileLocation=resourcesDirectory+"test/setup/"+testSuiteName; 
		//--------------------------
		try {
			 fileContent = FileUtils.readFileToString(new File(fileLocation));
				fileContent=fileContent.replace("filename=\"resources", "filename=\""+resourcesDirectory);
				 FileUtils.writeStringToFile(new File(tempFile), fileContent);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//status = "FAILED" + e.getMessage();
		}
		
		
		
		
		
		
		
		
		// pipeline
		
		IDataUtil.put( pipelineCursor, "fileContent", fileContent );
		
		//---------------------------------------------
		String status = "SUCCESS";
		/*	//String fileName="temp.xml";
			String location=resourcesDirectory+"\\test\\temp\\temp.xml";
			//+fileName;
			
			
			//String fileContent = "";
			String status = "SUCCESS";
			if(fileContent != null){
				//fileContent = IDataUtil.getString( pipelineCursor, "fileContent" );
			try {
				 FileUtils.writeStringToFile(new File(location), fileContent);
				 }
			 catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				status = "FAILED" + e.getMessage();
			}
			}*/
		// pipeline
		
		IDataUtil.put( pipelineCursor, "status", status );
		IDataUtil.put( pipelineCursor, "testSuiteName", testSuiteName);
		//----------------------------------------------------------------------------
		System.setProperty("webMethods.integrationServer.name", host);
		System.setProperty("webMethods.integrationServer.port", port);
		System.setProperty("webMethods.integrationServer.userid", username);
		System.setProperty("webMethods.integrationServer.password", password);
		System.setProperty("webMethods.test.setup.filename",tempFile );
		System.setProperty("resources.folder", resourcesDirectory);
		//System.setProperty("webMethods.test.setup.disableMocks", " ");
		//System.setProperty("user.dir", "C:/SoftwareAG91/IntegrationServer/instances/default/packages/NICServicesTestSuite");
		com.wm.ps.test.WmTestSuite Test = null;
		try {
			Test = new com.wm.ps.test.WmTestSuite();
		} catch (SetupException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//IDataCursor pipelineCursor = pipeline.getCursor();
			IDataUtil.put( pipelineCursor, "message", e.getMessage() );
			//pipelineCursor.destroy();
		}
		TestResult tr = new TestResult();
		Test.run(tr);   
		//IDataCursor pipelineCursor = pipeline.getCursor();
		IDataUtil.put( pipelineCursor, "testSuiteFilenameProperty",System.getProperty(Test.testSuiteFilenameProperty) );
		IDataUtil.put( pipelineCursor, "count",Test.testCount());
		IDataUtil.put( pipelineCursor, "errcount",tr.errorCount());
		IDataUtil.put( pipelineCursor, "failurecount",tr.failureCount());
		IDataUtil.put( pipelineCursor, "wasSuccessful",tr.wasSuccessful());
		
		
		
		IDataUtil.put( pipelineCursor, "userDir",System.getProperty("user.dir"));
		
		ArrayList<String> errorList = new ArrayList<>();
		ArrayList<String> failureList = new ArrayList<>();
		
		Enumeration e = tr.errors();
		
		while (e.hasMoreElements()){
			errorList.add(e.nextElement().toString());
		}
		
		Enumeration f = tr.failures();
		
		while (f.hasMoreElements()){
			failureList.add(f.nextElement().toString());
		}
		
		//---------------------------
		
		IDataUtil.put( pipelineCursor, "error",errorList.toArray(new String[errorList.size()]));
		IDataUtil.put( pipelineCursor, "failures",failureList.toArray(new String[failureList.size()]));
		
		
		//---------------------------
		
		
		
		
		//--------------
		pipelineCursor.destroy();
			
			
		// --- <<IS-END>> ---

                
	}



	public static final void pipelineFileToIData (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(pipelineFileToIData)>> ---
		// @sigtype java 3.5
		// [i] field:0:required fileName
		// [o] record:0:required pipelineData
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	fileName = IDataUtil.getString( pipelineCursor, "fileName" );
				// pipeline
			File pFile = new File(fileName);
			IDataXMLCoder xc = new IDataXMLCoder();
			
		
		// pipelineData
		IData pipelineData = null;
		try {
			pipelineData = xc.readFromFile(pFile);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		IDataUtil.put( pipelineCursor, "pipelineData", pipelineData );
		pipelineCursor.destroy();
			
		// --- <<IS-END>> ---

                
	}



	public static final void readFileContent (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(readFileContent)>> ---
		// @sigtype java 3.5
		// [i] field:0:required fileLocation
		// [o] field:0:required fileContent
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	fileLocation = IDataUtil.getString( pipelineCursor, "fileLocation" );
			String fileContent = null;
		try {
			 fileContent = FileUtils.readFileToString(new File(fileLocation));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// pipeline
		
		IDataUtil.put( pipelineCursor, "fileContent", fileContent );
		pipelineCursor.destroy();
			
		// --- <<IS-END>> ---

                
	}



	public static final void removePipelineFiles (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(removePipelineFiles)>> ---
		// @sigtype java 3.5
		// [i] field:0:optional service
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	service = IDataUtil.getString( pipelineCursor, "service" );
		pipelineCursor.destroy();
		String pipelineDir = ServerAPI.getServerConfigDir().getAbsolutePath().substring(0,
				ServerAPI.getServerConfigDir().getAbsolutePath().indexOf("config"))+
				System.getProperty("file.separator")+"pipeline"; 
		File dir = new File(pipelineDir);
		FileFilter fileFilter = new WildcardFileFilter(service.replaceAll(":", "_")+"*.xml");
		File[] files = dir.listFiles(fileFilter);
		for (int i = 0; i < files.length; i++) {
		   //System.out.println(files[i]);
		   FileUtils.deleteQuietly(files[i]);
		}
		
		// pipeline
			
		// --- <<IS-END>> ---

                
	}



	public static final void serviceNameGenerator (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(serviceNameGenerator)>> ---
		// @sigtype java 3.5
		// [i] field:1:required serviceNames
		// [o] field:1:required serviceNameOut
		IDataCursor cursor=pipeline.getCursor();
		String[] ips=IDataUtil.getStringArray(cursor, "serviceNames");
		ArrayList <String> services = new ArrayList<String>();
		
		for (String input: ips){
			String temp = input.substring(0,input.lastIndexOf("_"));
			temp = temp.replace("_", ".");
			temp = temp+":"+input.substring(input.lastIndexOf("_")+1);
			
			
			services.add(temp);
		}
		
		if(services.size()>0)
			IDataUtil.put(cursor, "serviceNameOut", services.toArray(new String[services.size()]));
		
			
		// --- <<IS-END>> ---

                
	}



	public static final void setExtendedSetting (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(setExtendedSetting)>> ---
		// @sigtype java 3.5
		// [i] field:0:required key
		// [i] field:0:required value
		// [o] field:0:required status
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	key = IDataUtil.getString( pipelineCursor, "key" );
			String	value = IDataUtil.getString( pipelineCursor, "value" );
		
			if(key != null && value != null){
				Config.setProperty(key, value);
				IDataUtil.put( pipelineCursor, "status", "SUCCESS" );
			}
			
		// pipeline
		
		
		pipelineCursor.destroy();
			
		// --- <<IS-END>> ---

                
	}



	public static final void writeContentToFile (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(writeContentToFile)>> ---
		// @sigtype java 3.5
		// [i] field:0:required fileLocation
		// [i] field:0:required fileContent
		// [o] field:0:required status
		IDataCursor pipelineCursor = pipeline.getCursor();
		String	fileLocation = IDataUtil.getString( pipelineCursor, "fileLocation" );
		String fileContent = "";
		String status = "SUCCESS";
		if(IDataUtil.getString( pipelineCursor, "fileContent" ) != null)
			fileContent = IDataUtil.getString( pipelineCursor, "fileContent" );
		try {
			 FileUtils.writeStringToFile(new File(fileLocation), fileContent);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			status = "FAILED" + e.getMessage();
		}
		// pipeline
		
		IDataUtil.put( pipelineCursor, "status", status );
		pipelineCursor.destroy();
		// --- <<IS-END>> ---

                
	}

	// --- <<IS-START-SHARED>> ---
 static ArrayList getNodeList(String packageName, String folderName, String alias)
  {
    ArrayList outputArray = new ArrayList();
    
    IData output = IDataFactory.create();
    try {
      Values input = new Values();
      input.put("interface", folderName);
      input.put("package", packageName);

      if ((alias == null) || (alias.equals("An_Alias_for_Design_Server"))) {
        output = Service.doInvoke("wm.server.ns", "getNodeList", input);
      }
      else
      {
        input.put("$alias", alias);
        input.put("$service", "wm.server.ns:getNodeList");
        input.put("$scope", "SESSION");

        output = Service.doInvoke("pub.remote", "invoke", input);
      }
    }
    catch (Exception ex)
    {
      
    }

    IDataCursor outputCursor = output.getCursor();
    IData[] nodes = IDataUtil.getIDataArray(outputCursor, "nodeList");
    if (nodes != null) {
      for (int i = 0; i < nodes.length; i++)
      {
        IDataCursor nodeCursor = nodes[i].getCursor();
        String nodeName = IDataUtil.getString(nodeCursor, "node_nsName");
       String nodeType = IDataUtil.getString(nodeCursor, "node_type");
        if (nodeType.equals("interface"))
        {
        	outputArray.addAll(getNodeList(packageName, nodeName, alias));
        
        }
        else
        {
          outputArray.add(nodes[i]);
        }
      }
    }
    outputCursor.destroy();

    return outputArray;
  }
	// --- <<IS-END-SHARED>> ---
}

