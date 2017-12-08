package server;

public class Utils {
	public static String fomatDomain(String str) {
		if (str != null)
			str = str.toLowerCase().replaceAll("(http|https)+", "")
					.replaceAll("^[\\w\\W]+[\\/]{2}", "")
					.replaceAll("[\\/]+[\\w\\W]*$", "")
					.replaceAll("[\\?]+[\\w\\W]*$", "")
					.replaceAll("[ !@#$%^&*?()\\[\\]{}+=,:;|\\\'\\\"/\\\\`~]+", "")
					.trim();

		return str;
	}
}
