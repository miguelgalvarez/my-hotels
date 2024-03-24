package com.hotels;

public class Room {
    private int roomID;

    private int price;

    private int capacity;

    private String[] amenities;

    private String roomView;

    private String roomExtension;

    private String[] damages;

    private int roomNumber;

    public Room(int roomID, int price, int capacity, String[] amenities, String roomView, String roomExtension, String[] damages) {
        this.roomID = roomID;
        this.price = price;
        this.capacity = capacity;
        this.amenities = amenities;
        this.roomView = roomView;
        this.roomExtension =  roomExtension;
        this.damages = damages;
    }

    public Room(int price, int capacity, String[] amenities, String roomView, String roomExtension, String[] damages) {
        this.price = price;
        this.capacity = capacity;
        this.amenities = amenities;
        this.roomView = roomView;
        this.roomExtension =  roomExtension;
        this.damages = damages;
    }

    /* Getters */
    public int getID() {return this.roomID; }
    public int getPrice() {return this.price; }
    public int getCapacity() {return this.capacity; }
    public String[] getAmeneties() {return this.amenities; }
    public String getRoomView() {return this.roomView; }
    public String getRoomExtension() {return this.roomExtension; }
    public String[] getDamages() {return this.damages; }

    /* Setters */
    public void setRoomID(int roomID) {this.roomID = roomID; }
    public void setPrice(int price) {this.price = price; }
    public void setCapacity(int capacity) {this.capacity = capacity; }
    public void setAmenities(String[] amenities) {this.amenities = amenities; }
    public void setRoomView(String roomView) {this.roomView = roomView; }
    public void setRoomExtension(String roomExtension) {this.roomExtension = roomExtension; }
    public void setDamages(String[] damages) {this.damages = damages; }


}
