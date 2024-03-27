package com.hotels;

/**
 * Room class to store Room data
 */

public class Room {
    private int RoomID;
    private int HotelID;

    private double price;

    private int capacity;

    private String amenities;

    private String roomView;

    private boolean roomExtension;

    private String damages;

    private int roomNumber;

    /**
     * Constructor to save hotel's data (with id)
     *
     * @param RoomID unique ID of the room
     * @param capacity capacity for the room
     * @param amenities list of amenities for the room
     * @param roomView string describing view of the room
     * @param roomExtension if a room can have an extension
     * @param damages the damages to a room
     * @param roomNumber the room number
     */
    public Room(int RoomID, int HotelID, int capacity, String amenities, String roomView, boolean roomExtension, String damages, int roomNumber) {
        this.RoomID = RoomID;
        this.HotelID = HotelID;
        this.capacity = capacity;
        this.amenities = amenities;
        this.roomView = roomView;
        this.roomExtension = roomExtension;
        this.damages = damages;
        this.roomNumber = roomNumber;
    }

    /**
     * Constructor to save room's data (without id)
     *
     * @param price price of a room
     * @param capacity capacity
     * @param amenities the amenities that a room has
     * @param roomView the type of view that a room has
     * @param roomExtension if a room can have an extension
     */
    public Room(double price, int HotelID, int capacity, String amenities, String roomView, boolean roomExtension) {
        this.price = price;
        this.HotelID = HotelID;
        this.capacity = capacity;
        this.amenities = amenities;
        this.roomView = roomView;
        this.roomExtension =  roomExtension;
    }

    /* Getters */
    public int getID() {return this.RoomID; }
    public double getPrice() {return this.price; }
    public int getCapacity() {return this.capacity; }
    public String getAmeneties() {return this.amenities; }
    public String getRoomView() {return this.roomView; }
    public boolean getRoomExtension() {return this.roomExtension; }
    public String getDamages() {return this.damages;}
    public int getRoomID() {return this.RoomID;}

    /* Setters */
    public void setRoomID(int roomID) {this.RoomID = roomID; }
    public void setPrice(int price) {this.price = price; }
    public void setCapacity(int capacity) {this.capacity = capacity; }
    public void setAmenities(String amenities) {this.amenities = amenities; }
    public void setRoomView(String roomView) {this.roomView = roomView; }
    public void setRoomExtension(boolean roomExtension) {this.roomExtension = roomExtension; }
    public void setDamages(String damages) {this.damages = damages; }
    public void setRoomNumber(int roomNumber) {this.roomNumber = roomNumber; }

    @Override
    public String toString() {

        return "<ul>"
                + "<li>price = " + price + "</li>"
                + "<li>capacity = " + capacity + "</li>"
                + "<li>amenities= " + amenities + "</li>"
                + "<li>room view= " + roomView + "</li>"
                + "<li>room extension= " + roomExtension + "</li>"
                + "<li>room damages= " + damages + "</li>"
                + "<li>room room number= " + roomNumber + "</li>";
    }


}


