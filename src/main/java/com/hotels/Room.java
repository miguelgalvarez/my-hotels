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

    public Room()
}
