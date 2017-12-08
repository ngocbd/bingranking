package checkrank;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.Date;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import data.Data;

public class Test {
	public static void main(String[] args) {
		try {
			URL url = new URL("http://www.bing.com/search?q=abc.com&qs=n&form=QBRE&pq=abc&sc=8-6&sp=-1&sk=");
	        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	        connection.setDoOutput(true);
	        connection.setInstanceFollowRedirects(true);
	        connection.setRequestMethod("GET");
	        connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.21) Gecko/20110830 AlexaToolbar/alxf-2.14 AlexaToolbar/pXVUnvuf-1.2 Firefox/3.6.21");
			connection.setRequestProperty("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
			connection.setRequestProperty("Accept-Language", "en-us,en;q=0.5");
			connection.setRequestProperty("Accept-Charset", "	ISO-8859-1,utf-8;q=0.7,*;q=0.7");
			connection.setRequestProperty("Connection", "keep-alive");
			connection.setRequestProperty("Keep-Alive", "115");
			connection.setRequestProperty("Cache-Control", "max-age=0");
			
	        if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
	        	String content = "";			
	        	BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), Charset.forName("UTF-8")));
				while(1==1)
				{
					String strs = reader.readLine();
					if(strs==null) break;
					content+=strs;				
				}
				Document doc = Jsoup.parse(content);
				
				Elements cite = doc.select(".sa_wr");
				System.out.println(cite.size());
				if(cite.size() > 0)
				{
					for (int j = 0; j < cite.size(); j++) {
						if(j < 10)
						{
							System.out.println(cite.get(j).select("p").html().replaceAll("[ ]+", ""));
						}
					}
				}
				
	        }
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
