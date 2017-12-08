package data;
import java.net.UnknownHostException;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;
import com.mongodb.MongoException;

public class Data {
	static Mongo m = null;

	public static DBCollection data(String name) {

		DB db=null;

		if (m == null) {
			try {
				//mongo staff.mongohq.com:10064/rewordpress -u
				
				m = new Mongo("ds037987.mongolab.com",37987);
				db = m.getDB("bingranking");
				boolean auth = db.authenticate("vdc", "abcD1234".toCharArray());
				
			} catch (UnknownHostException e) {
				e.printStackTrace();
			} catch (MongoException e) {
				e.printStackTrace();
			}
		}

		db = m.getDB("bingranking");
		DBCollection coll = db.getCollection(name);
		
		return coll;
	}
}
