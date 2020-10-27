package kr.or.bit.dto;

public class koreamember {
	private String id;
	private String pwd;
	private String name;
	private int age;
	private String gender;
	private String email;
	private String ip;
	
	
	public koreamember() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public koreamember(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
	}
	
	public koreamember(String id, String name, int age, String gender, String email) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.email = email;
	}

	public koreamember(String id, String pwd, String name, int age, String gender, String email, String ip) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.email = email;
		this.ip = ip;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	@Override
	public String toString() {
		return "koreamember [id=" + id + ", pwd=" + pwd + ", name=" + name + ", age=" + age + ", gender=" + gender
				+ ", email=" + email + ", ip=" + ip + "]";
	}
	
	
}
