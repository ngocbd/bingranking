package server;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.nio.charset.Charset;
import java.util.Date;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBConnector;
import com.mongodb.DBObject;

import data.Data;

public class GetContent extends Thread{
	String str = "";
	String domain = "www.google.com";
	String[] arr;
	int i = 0;
	public GetContent(String str,String domain,String[] arr,int i)
	{
		this.str = str;
		this.domain = domain;
		this.arr = arr;
		this.i = i;
		this.start();
	}
	public void run()
	{
		arr[i] = "";
		String query="";
		try {
			query = URLDecoder.decode(str,"UTF-8").trim().replaceAll("[ ]+", "+");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			URL url = new URL("https://"+domain+"/search?sclient=psy-ab&site=&source=hp&q="+query+"&btnG=T%C3%ACm+ki%E1%BA%BFm");
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
				
				Elements cite = doc.select(".g");
				if(cite.size() > 0)
				{
					for (int j = 0; j < cite.size(); j++) {
						if(j < 10)
						{
							arr[i] += cite.get(j).select("a").attr("href").replaceAll("[ ]+", "")+" ";
						}
					}
				}
				System.out.println(query);
				if(arr[i] != "")
				{
					DBCollection coll = Data.data("keyword");
					DBObject db = coll.findOne(new BasicDBObject("name",query).append("domain", domain));
					if(db==null)
					{
						BasicDBObject key = new BasicDBObject();
						key.put("name", query);
						key.put("result", arr[i]);
						key.put("domain", domain);
						key.put("date", new Date().getTime());
						
						coll.insert(key);
					} else {
						db.put("result", arr[i]);
						db.put("date", new Date().getTime());
						coll.save(db);
					}
				}
				System.out.println(arr[i]);
	        }
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
//	public static void main(String[] args) throws IOException {
//		Content("gogo","www.google.com.vn");
//	}
}
