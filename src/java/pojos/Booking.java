package pojos;

import java.util.Calendar;


public class Booking {
    private int id;
    private int locationId;
    private int slotId;
    private Calendar parkingDateTime;
    private Calendar parkingEndTime;
    private int parkingHours;
    private String username;
    private int carId;
    private String category;
    private Calendar bookingTime;
    
    public Booking() {
        id = -1;
        locationId = -1;
        slotId = -1;
        parkingDateTime = Calendar.getInstance();
        parkingEndTime = Calendar.getInstance();
        parkingHours = -1;
        username = "";
        carId = -1;
        category = "";
        bookingTime = Calendar.getInstance();
    }
    
    public Booking(int id, int locationId, int slotId, long parkingDateTime, int parkingHours, String username, int carId, String category, long bookingTime) {
        this.id = id;
        this.locationId = locationId;
        this.slotId = slotId;
        
        this.parkingDateTime = Calendar.getInstance();
        this.parkingDateTime.setTimeInMillis(parkingDateTime);
        
        this.parkingEndTime = Calendar.getInstance();
        this.parkingEndTime.setTimeInMillis(parkingDateTime);
        this.parkingEndTime.add(Calendar.HOUR, parkingHours);
        
        this.parkingHours = parkingHours;
        this.username = username;
        this.carId = carId;
        this.category = category;
        
        this.bookingTime = Calendar.getInstance();
        this.bookingTime.setTimeInMillis(bookingTime);
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the locationId
     */
    public int getLocationId() {
        return locationId;
    }

    /**
     * @param locationId the locationId to set
     */
    public void setLocationId(int locationId) {
        this.locationId = locationId;
    }

    /**
     * @return the slotId
     */
    public int getSlotId() {
        return slotId;
    }

    /**
     * @param slotId the slotId to set
     */
    public void setSlotId(int slotId) {
        this.slotId = slotId;
    }

    /**
     * @return the parkingDateTime
     */
    public Calendar getParkingDateTime() {
        return parkingDateTime;
    }

    /**
     * @param parkingDateTime the parkingDateTime to set
     */
    public void setParkingDateTime(Calendar parkingDateTime) {
        this.parkingDateTime = parkingDateTime;
    }
    
    public void setParkingDateTime(long parkingDateTime) {
        this.parkingDateTime.setTimeInMillis(parkingDateTime);
    }

    /**
     * @return the parkingEndTime
     */
    public Calendar getParkingEndTime() {
        return parkingEndTime;
    }

    /**
     * @param parkingEndTime the parkingEndTime to set
     */
    public void setParkingEndTime(Calendar parkingEndTime) {
        this.parkingEndTime = parkingEndTime;
    }
    
    public void setParkingEndTime(long parkingEndTime) {
        this.parkingEndTime.setTimeInMillis(parkingEndTime);
    }

    /**
     * @return the parkingHours
     */
    public int getParkingHours() {
        return parkingHours;
    }

    /**
     * @param parkingHours the parkingHours to set
     */
    public void setParkingHours(int parkingHours) {
        this.parkingHours = parkingHours;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the carId
     */
    public int getCarId() {
        return carId;
    }

    /**
     * @param carId the carId to set
     */
    public void setCarId(int carId) {
        this.carId = carId;
    }

    /**
     * @return the category
     */
    public String getCategory() {
        return category;
    }

    /**
     * @param category the category to set
     */
    public void setCategory(String category) {
        this.category = category;
    }

    /**
     * @return the bookingTime
     */
    public Calendar getBookingTime() {
        return bookingTime;
    }

    /**
     * @param bookingTime the bookingTime to set
     */
    public void setBookingTime(Calendar bookingTime) {
        this.bookingTime = bookingTime;
    }
    
    public void setBookingTime(long bookingTime) {
        this.bookingTime.setTimeInMillis(bookingTime);
    }
    
}
