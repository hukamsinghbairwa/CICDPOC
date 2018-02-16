package Extension;

// -----( IS Java Code Template v1.2
// -----( CREATED: 2013-07-11 21:30:47 GMT+05:30
// -----( ON-HOST: vmmrat06.eur.ad.sag

import com.wm.data.*;
import com.wm.util.Values;
import com.wm.app.b2b.server.Service;
import com.wm.app.b2b.server.ServiceException;
// --- <<IS-START-IMPORTS>> ---
import com.wm.app.b2b.server.ostore.ServerCache;
import com.wm.lang.ns.NSName;
import com.wm.app.b2b.server.ostore.OStoreException;
// --- <<IS-END-IMPORTS>> ---

public final class clearServiceCache

{
	// ---( internal utility methods )---

	final static clearServiceCache _instance = new clearServiceCache();

	static clearServiceCache _newInstance() { return new clearServiceCache(); }

	static clearServiceCache _cast(Object o) { return (clearServiceCache)o; }

	// ---( server methods )---




	public static final void clearServiceCache (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(clearServiceCache)>> ---
		// @subtype unknown
		// @sigtype java 3.5
	// pipeline
	IDataCursor pipelineCursor = pipeline.getCursor();
	String	serviceName = IDataUtil.getString( pipelineCursor, "serviceName" );
	pipelineCursor.destroy();
	
	try 
	{
		NSName ns = NSName.create(serviceName);
		ServerCache.resetCache(ns);
	} 
	catch (OStoreException e) 
	{
		// TODO Auto-generated catch block
		throw new ServiceException("Error:- " + e.getMessage());
	}
		// --- <<IS-END>> ---

                
	}
}

