package com.hotels;

/**
 * Room class to store Room data
 */

public class Room {
    private int roomID;

    private int price;

    private int capacity;

    private String[] amenities;

    private String roomView;

    private String roomExtension;

    private String[] damages;

    private int roomNumber;

    /**
     * Constructor to save room's data (without id)
     *
     * @param price price of a room
     * @param capacity capacity
     * @param amenities the amenities that a room has
     * @param roomView the type of view that a room has
     * @param roomExtension if a room can have an extension
     * @param damages the damages to a room
     * @param roomNumber the room number
     */
    public Room(int price, int capacity, String[] amenities, String roomView, String roomExtension, String[] damages, int roomNumber) {
        this.price = price;
        this.capacity = capacity;
        this.amenities = amenities;
        this.roomView = roomView;
        this.roomExtension =  roomExtension;
        this.damages = damages;
        this.roomNumber = roomNumber;
    }

    /* Getters */
    public int getID() {return this.roomID; }
    public int getPrice() {return this.price; }
    public int getCapacity() {return this.capacity; }
    public String[] getAmeneties() {return this.amenities; }
    public String getRoomView() {return this.roomView; }
    public String getRoomExtension() {return this.roomExtension; }
    public String[] getDamages() {return this.damages;}
    public int getRoomID() {return this.roomID;}

    /* Setters */
    public void setRoomID(int roomID) {this.roomID = roomID; }
    public void setPrice(int price) {this.price = price; }
    public void setCapacity(int capacity) {this.capacity = capacity; }
    public void setAmenities(String[] amenities) {this.amenities = amenities; }
    public void setRoomView(String roomView) {this.roomView = roomView; }
    public void setRoomExtension(String roomExtension) {this.roomExtension = roomExtension; }
    public void setDamages(String[] damages) {this.damages = damages; }
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


