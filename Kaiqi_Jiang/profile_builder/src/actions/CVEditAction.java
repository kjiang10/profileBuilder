package actions;



public class CVEditAction {	
	
	private String Nationality = "";
	private String Address = "";
	private String Email = "";
	private String Phone = "";
	private String SocialAccounts = "";
	private String Bio = "";
	private String Award = "";
	private String Education = "";
	private String Employment = "";
	private String Course = "";
	private String Paper = "";
	private String Book = "";
	private String Homepage = "";
		
	
	
	public String execute() throws Exception {
		return "editcv";
	}
	
	public String getNationality() {
		return Nationality;
	}

	public void setNationality(String Nationality) {
		this.Nationality = Nationality;
	}
	
	public String getAddress() {
		return Address;
	}

	public void setAddress(String Address) {
		this.Address = Address;
	}
	
	public String getEmail() {
		return Email;
	}

	public void setEmail(String Email) {
		this.Email = Email;
	}
	
	public String getPhone() {
		return Phone;
	}

	public void setPhone(String Phone) {
		this.Phone = Phone;
	}
	
	public String getSocialAccounts() {
		return SocialAccounts;
	}

	public void setSocialAccounts(String SocialAccounts) {
		this.SocialAccounts = SocialAccounts;
	}
	
	public String getBio() {
		return Bio;
	}

	public void setBio(String Bio) {
		this.Bio = Bio;
	}
	
	public String getAward() {
		return Award;
	}

	public void setAward(String Award) {
		this.Award = Award;
	}
	
	public String getEducation() {
		return Education;
	}

	public void setEducation(String Education) {
		this.Education = Education;
	}
	
	public String getEmployment() {
		return Employment;
	}

	public void setEmployment(String Employment) {
		this.Employment = Employment;
	}
	
	public String getCourse() {
		return Course;
	}

	public void setCourse(String Course) {
		this.Course = Course ;
	}
	
	public String getPaper() {
		return Paper;
	}

	public void setPaper(String Paper) {
		this.Paper = Paper;
	}
	
	public String getBook() {
		return Book;
	}

	public void setBook(String Book) {
		this.Book = Book;
	}
	
	public String getHomepage() {
		return Homepage;
	}

	public void setHomepage(String Homepage) {
		this.Homepage = Homepage;
	}
	
	
	
	

}
