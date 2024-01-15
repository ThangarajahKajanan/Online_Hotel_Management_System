package Model;

public class RoomBooking {
	public int id;
	public String roomType;
	public int cost;
	public int bed;

	public RoomBooking(int id, String roomType, int cost, int bed) {
		super();
		this.id = id;
		this.roomType = roomType;
		this.cost = cost;
		this.bed = bed;
	}

	public RoomBooking(String roomType, int cost, int bed) {

		this.roomType = roomType;
		this.cost = cost;
		this.bed = bed;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public int getBed() {
		return bed;
	}

	public void setBed(int bed) {
		this.bed = bed;
	}

}