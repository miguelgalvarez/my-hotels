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


    // Getters
    public int getRoomID() {
        return roomID;
    }

    public int getPrice() {
        return price;
    }

    public int getCapacity() {
        return capacity;
    }

    public String[] getAmenities() {
        return amenities;
    }

    public String getRoomView() {
        return roomView;
    }

    public String getRoomExtension() {
        return roomExtension;
    }

    public String[] getDamages() {
        return damages;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    // Setters
    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public void setAmenities(String[] amenities) {
        this.amenities = amenities;
    }

    public void setRoomView(String roomView) {
        this.roomView = roomView;
    }

    public void setRoomExtension(String roomExtension) {
        this.roomExtension = roomExtension;
    }

    public void setDamages(String[] damages) {
        this.damages = damages;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

}
