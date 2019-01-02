package kr.co.tripweaver.manager.article_stat.model;

public class ArticleStatVO {
	
	//에세이 통계
	private String ess_month;
	private String ess_week;
	private String ess_day;
	private int ess_total;
	private int ess_guide;
	private int ess_normal;
	private String ess_season;
	private int ess_season_count;
	private String ess_theme;
	private int ess_theme_count;
	private String ess_peo;
	private int ess_peo_count;
	private String ess_mem_age;
	private int ess_mem_male;
	private int ess_mem_female;
	
	public String getEss_month() {
		return ess_month;
	}
	public void setEss_month(String ess_month) {
		this.ess_month = ess_month;
	}
	public String getEss_week() {
		return ess_week;
	}
	public void setEss_week(String ess_week) {
		this.ess_week = ess_week;
	}
	public String getEss_day() {
		return ess_day;
	}
	public void setEss_day(String ess_day) {
		this.ess_day = ess_day;
	}
	public int getEss_total() {
		return ess_total;
	}
	public void setEss_total(int ess_total) {
		this.ess_total = ess_total;
	}
	public int getEss_guide() {
		return ess_guide;
	}
	public void setEss_guide(int ess_guide) {
		this.ess_guide = ess_guide;
	}
	public int getEss_normal() {
		return ess_normal;
	}
	public void setEss_normal(int ess_normal) {
		this.ess_normal = ess_normal;
	}
	public String getEss_season() {
		return ess_season;
	}
	public void setEss_season(String ess_season) {
		this.ess_season = ess_season;
	}
	public int getEss_season_count() {
		return ess_season_count;
	}
	public void setEss_season_count(int ess_season_count) {
		this.ess_season_count = ess_season_count;
	}
	public String getEss_theme() {
		return ess_theme;
	}
	public void setEss_theme(String ess_theme) {
		this.ess_theme = ess_theme;
	}
	public int getEss_theme_count() {
		return ess_theme_count;
	}
	public void setEss_theme_count(int ess_theme_count) {
		this.ess_theme_count = ess_theme_count;
	}
	public String getEss_peo() {
		return ess_peo;
	}
	public void setEss_peo(String ess_peo) {
		this.ess_peo = ess_peo;
	}
	public int getEss_peo_count() {
		return ess_peo_count;
	}
	public void setEss_peo_count(int ess_peo_count) {
		this.ess_peo_count = ess_peo_count;
	}
	public String getEss_mem_age() {
		return ess_mem_age;
	}
	public void setEss_mem_age(String ess_mem_age) {
		this.ess_mem_age = ess_mem_age;
	}
	public int getEss_mem_male() {
		return ess_mem_male;
	}
	public void setEss_mem_male(int ess_mem_male) {
		this.ess_mem_male = ess_mem_male;
	}
	public int getEss_mem_female() {
		return ess_mem_female;
	}
	public void setEss_mem_female(int ess_mem_female) {
		this.ess_mem_female = ess_mem_female;
	}
	
	//포스트카드 통계
	private int pc_total;
	private String pc_month;
	private String pc_week;
	private String pc_day;
	private String pc_mem_age;
	private int pc_mem_male;
	private int pc_mem_female;

	public int getPc_total() {
		return pc_total;
	}
	public void setPc_total(int pc_total) {
		this.pc_total = pc_total;
	}
	public String getPc_month() {
		return pc_month;
	}
	public void setPc_month(String pc_month) {
		this.pc_month = pc_month;
	}
	public String getPc_week() {
		return pc_week;
	}
	public void setPc_week(String pc_week) {
		this.pc_week = pc_week;
	}
	public String getPc_day() {
		return pc_day;
	}
	public void setPc_day(String pc_day) {
		this.pc_day = pc_day;
	}
	public String getPc_mem_age() {
		return pc_mem_age;
	}
	public void setPc_mem_age(String pc_mem_age) {
		this.pc_mem_age = pc_mem_age;
	}
	public int getPc_mem_male() {
		return pc_mem_male;
	}
	public void setPc_mem_male(int pc_mem_male) {
		this.pc_mem_male = pc_mem_male;
	}
	public int getPc_mem_female() {
		return pc_mem_female;
	}
	public void setPc_mem_female(int pc_mem_female) {
		this.pc_mem_female = pc_mem_female;
	}

}
