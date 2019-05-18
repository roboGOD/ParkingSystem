package pojos;


public class Car {
    private int sno;
    private String make;
    private String model;
    private String year;
    private String plateNo;
    private String username;

    public Car() {
        sno = -1;
        make = "";
        model = "";
        year = "";
        plateNo = "";
        username = "";
    }

    /**
     * @return the sno
     */
    public int getSno() {
        return sno;
    }

    /**
     * @param sno the sno to set
     */
    public void setSno(int sno) {
        this.sno = sno;
    }

    /**
     * @return the make
     */
    public String getMake() {
        return make;
    }

    /**
     * @param make the make to set
     */
    public void setMake(String make) {
        this.make = make;
    }

    /**
     * @return the model
     */
    public String getModel() {
        return model;
    }

    /**
     * @param model the model to set
     */
    public void setModel(String model) {
        this.model = model;
    }

    /**
     * @return the year
     */
    public String getYear() {
        return year;
    }

    /**
     * @param year the year to set
     */
    public void setYear(String year) {
        this.year = year;
    }

    /**
     * @return the plateNo
     */
    public String getPlateNo() {
        return plateNo;
    }

    /**
     * @param plateNo the plateNo to set
     */
    public void setPlateNo(String plateNo) {
        this.plateNo = plateNo;
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
   
   
}
