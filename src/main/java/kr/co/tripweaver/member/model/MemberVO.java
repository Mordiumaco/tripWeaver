package kr.co.tripweaver.member.model;

public class MemberVO {

	private String mem_id;
	private String mem_email;
	private String mem_pass;
	private String mem_name;
	private String mem_nick;
	private String mem_tel;
	private String mem_age;
	private String mem_gender;
	private Integer mem_follower_count;
	private Integer mem_following_count;
	private String mem_profile;
	private String mem_qrcode;
	private String mem_del;
	private int mem_author;

	public String getMem_email() {
		return mem_email;
	}

	// 네이버에 대한 정보를 받기 위한 생성자
	public MemberVO(String mem_email, String mem_name, String mem_nick, String mem_age, String mem_gender) {
		super();
		this.mem_email = mem_email;
		this.mem_name = mem_name;
		this.mem_nick = mem_nick;
		this.mem_age = mem_age;
		this.mem_gender = mem_gender;
	}

	// 기본 생성자
	public MemberVO() {

	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_pass() {
		return mem_pass;
	}

	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_nick() {
		return mem_nick;
	}

	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}

	public String getMem_tel() {
		return mem_tel;
	}

	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}

	public String getMem_age() {
		return mem_age;
	}

	public void setMem_age(String mem_age) {
		this.mem_age = mem_age;
	}

	public String getMem_gender() {
		return mem_gender;
	}

	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}

	public Integer getMem_follower_count() {
		return mem_follower_count;
	}

	public void setMem_follower_count(Integer mem_follower_count) {
		this.mem_follower_count = mem_follower_count;
	}

	public Integer getMem_following_count() {
		return mem_following_count;
	}

	public void setMem_following_count(Integer mem_following_count) {
		this.mem_following_count = mem_following_count;
	}
	public int getMem_author() {
		return mem_author;
	}

	public void setMem_author(int mem_author) {
		this.mem_author = mem_author;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_profile() {
		return mem_profile;
	}

	public void setMem_profile(String mem_profile) {
		this.mem_profile = mem_profile;
	}

	public String getMem_qrcode() {
		return mem_qrcode;
	}

	public void setMem_qrcode(String mem_qrcode) {
		this.mem_qrcode = mem_qrcode;
	}

	public String getMem_del() {
		return mem_del;
	}

	public void setMem_del(String mem_del) {
		this.mem_del = mem_del;
	}

	@Override
	public String toString() {
		return "MemberVO [mem_id=" + mem_id + ", mem_email=" + mem_email + ", mem_pass=" + mem_pass + ", mem_name="
				+ mem_name + ", mem_nick=" + mem_nick + ", mem_tel=" + mem_tel + ", mem_age=" + mem_age
				+ ", mem_gender=" + mem_gender + ", mem_follower_count=" + mem_follower_count + ", mem_following_count="
				+ mem_following_count + ", mem_profile=" + mem_profile + ", mem_qrcode=" + mem_qrcode + ", mem_del="
				+ mem_del + ", mem_author=" + mem_author + "]";
	}

}
