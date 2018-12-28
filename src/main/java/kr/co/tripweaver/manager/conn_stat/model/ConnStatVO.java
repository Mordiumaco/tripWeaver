package kr.co.tripweaver.manager.conn_stat.model;

import java.util.Date;

public class ConnStatVO {
	
	private String mem_id;
	private Date conn_time;
	private String conn_browser;
	private String conn_os;
	private String conn_divice;
	private String conn_ip;
	private String conn_ref;
	private String session_id;
	
	//통계결과용
	private int brow_firefox;
	private int brow_mise;
	private int brow_chrome;
	private int brow_opera;
	private int brow_others;
	private int divice_mobile;
	private int divice_tablet;
	private int divice_pc;
	private int divice_others;
	private int referer_email;
	private int referer_blog;
	private int referer_sns;
	private int referer_others;
	private int os_android;
	private int os_ios;
	private int os_windows10;
	private int os_windowsxp;
	private int os_windowsothers;
	private int os_linux;
	private int os_macintosh;
	private int os_others;
	
	public String getSession_id() {
		return session_id;
	}
	public void setSession_id(String session_id) {
		this.session_id = session_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Date getConn_time() {
		return conn_time;
	}
	public void setConn_time(Date conn_time) {
		this.conn_time = conn_time;
	}
	public String getConn_browser() {
		return conn_browser;
	}
	public void setConn_browser(String conn_browser) {
		this.conn_browser = conn_browser;
	}
	public String getConn_os() {
		return conn_os;
	}
	public void setConn_os(String conn_os) {
		this.conn_os = conn_os;
	}
	public String getConn_divice() {
		return conn_divice;
	}
	public void setConn_divice(String conn_divice) {
		this.conn_divice = conn_divice;
	}
	public String getConn_ip() {
		return conn_ip;
	}
	public void setConn_ip(String conn_ip) {
		this.conn_ip = conn_ip;
	}
	public String getConn_ref() {
		return conn_ref;
	}
	public void setConn_ref(String conn_ref) {
		this.conn_ref = conn_ref;
	}
	public int getBrow_firefox() {
		return brow_firefox;
	}
	public void setBrow_firefox(int brow_firefox) {
		this.brow_firefox = brow_firefox;
	}
	public int getBrow_mise() {
		return brow_mise;
	}
	public void setBrow_mise(int brow_mise) {
		this.brow_mise = brow_mise;
	}
	public int getBrow_chrome() {
		return brow_chrome;
	}
	public void setBrow_chrome(int brow_chrome) {
		this.brow_chrome = brow_chrome;
	}
	public int getBrow_opera() {
		return brow_opera;
	}
	public void setBrow_opera(int brow_opera) {
		this.brow_opera = brow_opera;
	}
	public int getBrow_others() {
		return brow_others;
	}
	public void setBrow_others(int brow_others) {
		this.brow_others = brow_others;
	}
	public int getDivice_mobile() {
		return divice_mobile;
	}
	public void setDivice_mobile(int divice_mobile) {
		this.divice_mobile = divice_mobile;
	}
	public int getDivice_tablet() {
		return divice_tablet;
	}
	public void setDivice_tablet(int divice_tablet) {
		this.divice_tablet = divice_tablet;
	}
	public int getDivice_pc() {
		return divice_pc;
	}
	public void setDivice_pc(int divice_pc) {
		this.divice_pc = divice_pc;
	}
	public int getDivice_others() {
		return divice_others;
	}
	public void setDivice_others(int divice_others) {
		this.divice_others = divice_others;
	}
	public int getReferer_email() {
		return referer_email;
	}
	public void setReferer_email(int referer_email) {
		this.referer_email = referer_email;
	}
	public int getReferer_blog() {
		return referer_blog;
	}
	public void setReferer_blog(int referer_blog) {
		this.referer_blog = referer_blog;
	}
	public int getReferer_sns() {
		return referer_sns;
	}
	public void setReferer_sns(int referer_sns) {
		this.referer_sns = referer_sns;
	}
	public int getReferer_others() {
		return referer_others;
	}
	public void setReferer_others(int referer_others) {
		this.referer_others = referer_others;
	}
	public int getOs_android() {
		return os_android;
	}
	public void setOs_android(int os_android) {
		this.os_android = os_android;
	}
	public int getOs_ios() {
		return os_ios;
	}
	public void setOs_ios(int os_ios) {
		this.os_ios = os_ios;
	}
	public int getOs_windows10() {
		return os_windows10;
	}
	public void setOs_windows10(int os_windows10) {
		this.os_windows10 = os_windows10;
	}
	public int getOs_windowsxp() {
		return os_windowsxp;
	}
	public void setOs_windowsxp(int os_windowsxp) {
		this.os_windowsxp = os_windowsxp;
	}
	public int getOs_windowsothers() {
		return os_windowsothers;
	}
	public void setOs_windowsothers(int os_windowsothers) {
		this.os_windowsothers = os_windowsothers;
	}
	public int getOs_linux() {
		return os_linux;
	}
	public void setOs_linux(int os_linux) {
		this.os_linux = os_linux;
	}
	public int getOs_macintosh() {
		return os_macintosh;
	}
	public void setOs_macintosh(int os_macintosh) {
		this.os_macintosh = os_macintosh;
	}
	public int getOs_others() {
		return os_others;
	}
	public void setOs_others(int os_others) {
		this.os_others = os_others;
	}
	@Override
	public String toString() {
		return "ConnStatVO [mem_id=" + mem_id + ", conn_time=" + conn_time + ", conn_browser=" + conn_browser
				+ ", conn_os=" + conn_os + ", conn_divice=" + conn_divice + ", conn_ip=" + conn_ip + ", conn_ref="
				+ conn_ref + "]";
	}
}
