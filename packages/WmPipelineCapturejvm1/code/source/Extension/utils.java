package Extension;

// -----( IS Java Code Template v1.2
// -----( CREATED: 2013-07-13 09:26:46 GMT+05:30
// -----( ON-HOST: vmmrat06.eur.ad.sag

import com.wm.data.*;
import com.wm.util.Values;
import com.wm.app.b2b.server.Service;
import com.wm.app.b2b.server.ServiceException;
// --- <<IS-START-IMPORTS>> ---
import java.util.StringTokenizer;
// --- <<IS-END-IMPORTS>> ---

public final class utils

{
	// ---( internal utility methods )---

	final static utils _instance = new utils();

	static utils _newInstance() { return new utils(); }

	static utils _cast(Object o) { return (utils)o; }

	// ---( server methods )---




	public static final void getFileNameSuffix (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(getFileNameSuffix)>> ---
		// @subtype unknown
		// @sigtype java 3.5
		// [i] object:0:required service
		// [o] field:0:required fileNameSuffixCustom
				String node_nsName = "";
		
				String service_1 = "";
		
				String xpathToPipelineVariable = ""; 
		
				String fileNameSuffixCustom = "";
		
				
		try{	
				// pipeline
		
				IDataCursor pipelineCursor = pipeline.getCursor();
				// service
				
				Object svc = IDataUtil.get(pipelineCursor, "service"); 		
		
				if ( svc != null)
				{
					node_nsName = svc.toString();
				}
		
				// extensionConfig
		
				IData	extensionConfig = IDataUtil.getIData( pipelineCursor, "extensionConfig" );
		
				if ( extensionConfig != null)
		
				{
		
					IDataCursor extensionConfigCursor = extensionConfig.getCursor();
		
				
		
					// i.input
		
					IData	input1 = IDataUtil.getIData( extensionConfigCursor, "input" );
		
					if ( input1 != null)
		
					{
		
						IDataCursor input1Cursor = input1.getCursor();
		
				
		
						// i.extension
		
						IData[]	extension = IDataUtil.getIDataArray( input1Cursor, "extension" );
		
						if ( extension != null)
		
						{
							for ( int i = 0; i < extension.length; i++ )
		
							{
		
								IDataCursor extensionCursor = extension[i].getCursor();
		
								service_1 = IDataUtil.getString( extensionCursor, "service" );
		
								xpathToPipelineVariable = IDataUtil.getString( extensionCursor, "xpathToPipelineVariable" );
		
								extensionCursor.destroy();
		
								
		
								if(service_1 != null && service_1.equalsIgnoreCase(node_nsName))
		
								{
		
									fileNameSuffixCustom = getFileNameSuffixRec(pipelineCursor, service_1, xpathToPipelineVariable);
		
									break;
		
								}
		
							}
		
						}
		
						input1Cursor.destroy();
		
					}
		
					extensionConfigCursor.destroy();
		
				}
		
				pipelineCursor.destroy();
		
			
		
				// pipeline
		
				IDataCursor pipelineCursor_1 = pipeline.getCursor();
		
				IDataUtil.put( pipelineCursor_1, "fileNameSuffixCustom", fileNameSuffixCustom );
		
				pipelineCursor_1.destroy();
				}
				catch(Exception e)
				{
				throw new ServiceException(e.getMessage());
				}
		// --- <<IS-END>> ---

                
	}

	// --- <<IS-START-SHARED>> ---
	public static String getFileNameSuffixRec(IDataCursor tempIDataCursor, String service, String xpathToPipelineVariable) throws ServiceException
		{
		try{
			String fileNameSuffix = "";
			String tempToken = "";			

			StringTokenizer xpathToken = new StringTokenizer(xpathToPipelineVariable, "/");
			int tokenCount = xpathToken.countTokens();

			while(xpathToken.hasMoreTokens())
			{

				tempToken = xpathToken.nextToken().trim();

				if(IDataUtil.get(tempIDataCursor, tempToken) != null && IDataUtil.get(tempIDataCursor, tempToken) instanceof String && tokenCount == 1)
				{
					if(tempIDataCursor.first(tempToken))
					{
						fileNameSuffix = IDataUtil.getString(tempIDataCursor, tempToken);
					}

				}
				else if(IDataUtil.get(tempIDataCursor, tempToken) != null && IDataUtil.get(tempIDataCursor, tempToken) instanceof String[] && tokenCount == 1)
				{
					if(tempIDataCursor.first(tempToken))
					{
						String tempStr[] = IDataUtil.getStringArray(tempIDataCursor, tempToken);
						fileNameSuffix = tempStr[0];
					}

				}
				else if(IDataUtil.get(tempIDataCursor, tempToken) != null && IDataUtil.get(tempIDataCursor, tempToken) instanceof IData[] && tokenCount == 1)
				{
					if(tempIDataCursor.first(tempToken))
					{
						IData[] tempIdata = IDataUtil.getIDataArray(tempIDataCursor, tempToken);
						IDataCursor tempIdataCur = tempIdata[0].getCursor();
						tempIdataCur.first();
						fileNameSuffix = getFileNameSuffixRec(tempIdataCur, service, tempIdataCur.getKey());
						tempIdataCur.destroy();
					}

				}
				else if(IDataUtil.get(tempIDataCursor, tempToken) != null && IDataUtil.get(tempIDataCursor, tempToken) instanceof IData && tokenCount == 1)
				{
					if(tempIDataCursor.first(tempToken))
					{
						IData tempIdata = IDataUtil.getIData(tempIDataCursor, tempToken);
						IDataCursor tempIdataCur = tempIdata.getCursor();
						if(tempIdataCur.first())
						{
							fileNameSuffix = getFileNameSuffixRec(tempIdataCur, service, tempIdataCur.getKey());
						}
						tempIdataCur.destroy();
					}
				}
				else if(IDataUtil.get(tempIDataCursor, tempToken) != null  && IDataUtil.get(tempIDataCursor, tempToken) instanceof IData)
				{
						IData tempIData = IDataUtil.getIData(tempIDataCursor, tempToken);
						IDataCursor tempIdataCur = tempIData.getCursor();
						String tempToken1 = xpathToPipelineVariable.substring(tempToken.length()+1,xpathToPipelineVariable.length());

						if(tokenCount-1 == 1)
						{
							tokenCount--;
							tempToken = xpathToken.nextToken().trim();
							fileNameSuffix = getFileNameSuffixRec(tempIdataCur, service, tempToken);
						}
						else
						{
							fileNameSuffix = getFileNameSuffixRec(tempIdataCur, service, tempToken1);
						}
				}
				else if(IDataUtil.get(tempIDataCursor, tempToken) != null  && IDataUtil.get(tempIDataCursor, tempToken) instanceof IData[])
				{
					IData tempIData[] = IDataUtil.getIDataArray(tempIDataCursor, tempToken);
					IDataCursor tempIdataCur = tempIData[0].getCursor();
					String tempToken1 = xpathToPipelineVariable.substring(tempToken.length()+1,xpathToPipelineVariable.length());
					
					if(tokenCount-1 == 1)
					{
						tokenCount--;
						tempToken = xpathToken.nextToken().trim();
						fileNameSuffix = getFileNameSuffixRec(tempIdataCur, service, tempToken);
					}
					else
					{
						fileNameSuffix = getFileNameSuffixRec(tempIdataCur, service, tempToken1);
					}

				}
				else
				{
					if(tempIDataCursor.first(tempToken))
					{
						fileNameSuffix = IDataUtil.getString(tempIDataCursor, tempToken);
					}
				}
				
				if(fileNameSuffix != null || !fileNameSuffix.equals(""))
				{
					break;
				}
			}

			if(fileNameSuffix == null || fileNameSuffix.equals(""))
			{
				return fileNameSuffix = String.valueOf((service.replaceAll(".", "_").replaceAll(":", "_").hashCode()));
			}

			return fileNameSuffix;
			}
			catch(Exception e)
			{
				throw new ServiceException("error :- "+e.getMessage());
			}
		}
	// --- <<IS-END-SHARED>> ---
}

