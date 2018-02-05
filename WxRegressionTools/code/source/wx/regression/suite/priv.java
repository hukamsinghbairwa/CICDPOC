package wx.regression.suite;

// -----( IS Java Code Template v1.2
// -----( CREATED: 2017-07-27 16:26:22.927 MEST
// -----( ON-HOST: an-esb-t01

import com.wm.data.*;
import com.wm.util.Values;
import com.wm.app.b2b.server.Service;
import com.wm.app.b2b.server.ServiceException;
// --- <<IS-START-IMPORTS>> ---
import com.wm.app.b2b.server.ServerAPI;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.filefilter.WildcardFileFilter;
import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
// --- <<IS-END-IMPORTS>> ---

public final class priv

{
	// ---( internal utility methods )---

	final static priv _instance = new priv();

	static priv _newInstance() { return new priv(); }

	static priv _cast(Object o) { return (priv)o; }

	// ---( server methods )---




	public static final void automateSuiteCreation (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(automateSuiteCreation)>> ---
		// @sigtype java 3.5
		// [i] field:0:optional service
		// [i] field:0:optional packageName
		// [o] field:0:required status
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
			String	service = IDataUtil.getString( pipelineCursor, "service" );
			String	packageName = IDataUtil.getString( pipelineCursor, "packageName" );
			String status="";
			 
		try{
			
		String pipelineDir = ServerAPI.getServerConfigDir().getAbsolutePath().substring(0,
					ServerAPI.getServerConfigDir().getAbsolutePath().indexOf("config"))+
					System.getProperty("file.separator")+"pipeline";
		
		File dir = new File(pipelineDir);
		FileFilter fileFilter = new WildcardFileFilter(service.replaceAll(":", "#")+"*.xml");
		File[] files = dir.listFiles(fileFilter);
		for (int i = 0; i < files.length; i++) {
			   System.out.println(files[i]);
			   FileUtils.moveFile(files[i], new File(files[i].getAbsolutePath().replace('#', '_')));	
		}
		
		if(service!=null&&packageName!=null)
		{
			System.out.println("Entered create");
			IData input = IDataFactory.create();
			IDataCursor inputCursor = input.getCursor();
			
			IDataUtil.put( inputCursor, "serviceName", service );
			IDataUtil.put( inputCursor, "packageName", packageName );
			IDataUtil.put( inputCursor, "removePipelineData","false");
			
			Service.doInvoke( "wx.interceptor.pub.utils.testCaseCreator", "createTestFromCapturedPipelineData", input);
			
			String fileSeparator = System.getProperty("file.separator");
			String resourcesDirectory = ServerAPI.getPackageConfigDir(packageName).getAbsolutePath()
						.substring(0,ServerAPI.getPackageConfigDir(packageName).getAbsolutePath().lastIndexOf("config"))
						+"resources"+fileSeparator;
			
			String packageDirectory = ServerAPI.getPackageConfigDir(packageName).getAbsolutePath()
					.substring(0,ServerAPI.getPackageConfigDir(packageName).getAbsolutePath().lastIndexOf("config"))
					;
			
			String testSuiteService = service.replaceAll(":", "_");
			
			String	fileLocation = resourcesDirectory+"test"+fileSeparator+"setup"+fileSeparator+testSuiteService+"_wmTestSuite.xml";
			String fileContent = null; 
			
			 fileContent = FileUtils.readFileToString(new File(fileLocation));
			
			
			 fileContent=fileContent.replace(packageName+fileSeparator,"");
			 FileUtils.writeStringToFile(new File(fileLocation), fileContent);
			
		
			
			 File dir1 = new File(pipelineDir);
				FileFilter fileFilter1 = new WildcardFileFilter(service.replaceAll(":", "_")+"*.xml");
				File[] files1 = dir1.listFiles(fileFilter1);
				for (int i = 0; i < files1.length; i++) {
				    FileUtils.deleteQuietly(files1[i]);
			}
			
				String claspathFileLocation=packageDirectory+".classpath";
				String classpathFileContent="<?xml version=\"1.0\" encoding=\"UTF-8\"?><classpath><classpathentry kind=\"src\" path=\"src\"/><classpathentry kind=\"con\" path=\"org.eclipse.jdt.launching.JRE_CONTAINER\"/><classpathentry kind=\"con\" path=\"com.sag.gcs.wmtestsuite.runtime.WmTestSuiteContainer\"/><classpathentry kind=\"output\" path=\"bin\"/></classpath>";
				FileUtils.writeStringToFile(new File(claspathFileLocation), classpathFileContent);
				
			 	
			status = "Successfully created testsuite";
		}
		else
			status="Manadatory fields missing";
		
		
		IDataUtil.put( pipelineCursor, "status", status);
		
		
		
		pipelineCursor.destroy();
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		// pipeline
		
			
		// --- <<IS-END>> ---

                
	}



	public static final void getServiceList (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getServiceList)>> ---
		// @sigtype java 3.5
		// [o] field:1:required serviceNamesOutput
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
		
		java.lang.String	directory = ServerAPI.getServerConfigDir().getAbsolutePath().
				substring(0,ServerAPI.getServerConfigDir().getAbsolutePath().lastIndexOf("config"))+"pipeline"+System.getProperty("file.separator");
		
			HashSet<String> recordedServices = new HashSet<>();
			
		
		File dir = new File(directory);
		FileFilter fileFilter = new WildcardFileFilter("*.xml");
		File[] files = dir.listFiles(fileFilter);
		for(File f:files){
			try {
				recordedServices.add(f.getName().substring(0, f.getName().lastIndexOf("_pipe")));
			} catch (StringIndexOutOfBoundsException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
			}
		}
		/*		
				for (int i = 0; i < files.length; i++) {
					if(!recordedServices.contains(files[i].getName().substring(0, files[i].getName().lastIndexOf("_pre_")).replace('#', ':')))
						recordedServices.add(files[i].getName().substring(0, files[i].getName().lastIndexOf("_pre_")).replace('#', ':'));
				}*/
			 
		
		IDataUtil.put( pipelineCursor, "serviceNamesOutput", recordedServices.toArray(new String[recordedServices.size()]) );
		pipelineCursor.destroy();
			
		// --- <<IS-END>> ---

                
	}
}

