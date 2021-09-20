package kr.ac.kopo.member.vo;

import javax.validation.constraints.NotEmpty;

public class MemberVO {

	@NotEmpty(message = "(id)필수항목입니다")
	private String id;

	@NotEmpty(message = "(pw)필수항목입니다")
	private String password;

	@NotEmpty(message = "(이름)필수항목입니다")
	private String name;

	private String type;
	private String struct;

	@NotEmpty(message = "(Email)필수항목입니다")
	private String email;

	@NotEmpty(message = "(전화번호)필수항목입니다")
	private String tel;

	private String agree;

	public MemberVO() {
		super();
	}


	public String getAgree() {
		return agree;
	}

	public void setAgree(String agree) {
		this.agree = agree;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getStruct() {
		return struct;
	}

	public void setStruct(String struct) {
		this.struct = struct;
	}


	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", type=" + type + ", struct="
				+ struct + ", email=" + email + ", tel=" + tel + ", agree=" + agree + "]";
	}




}
