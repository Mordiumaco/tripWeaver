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
	
	@Override
	public String toString() {
		return "ConnStatVO [mem_id=" + mem_id + ", conn_time=" + conn_time + ", conn_browser=" + conn_browser
				+ ", conn_os=" + conn_os + ", conn_divice=" + conn_divice + ", conn_ip=" + conn_ip + ", conn_ref="
				+ conn_ref + "]";
	}
}
