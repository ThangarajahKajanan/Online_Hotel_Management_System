package Model;

public class ReserveRoomBooking {
	public int id;
	public String user;
	public String nic;
	public int mobile;
	public String email;
	public String checkin;
	public String checkout;
	public int noofrooms;
	public int members;

	public ReserveRoomBooking(int id, String user, String nic, int mobile, String email, String checkin,
			String checkout, int noofrooms, int members) {
		super();
		this.id = id;
		this.user = user;
		this.nic = nic;
		this.mobile = mobile;
		this.email = email;
		this.checkin = checkin;
		this.checkout = checkout;
		this.noofrooms = noofrooms;
		this.members = members;

	}

	public ReserveRoomBooking(String user, String nic, int mobile, String email, String checkin, String checkout,
			int noofrooms, int members) {
		super();
		this.user = user;
		this.nic = nic;
		this.mobile = mobile;
		this.email = email;
		this.checkin = checkin;
		this.checkout = checkout;
		this.noofrooms = noofrooms;
		this.members = members;

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}

	public int getMobile() {
		return mobile;
	}

	public void setMobile(int mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public int getNoofrooms() {
		return noofrooms;
	}

	public void setNoofrooms(int noofrooms) {
		this.noofrooms = noofrooms;
	}

	public int getMembers() {
		return members;
	}

	public void setMembers(int members) {
		this.members = members;
	}

}