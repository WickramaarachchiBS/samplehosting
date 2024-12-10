package org.example.demomerge.dto;

import java.util.List;

public class Theater {
    private int theaterId;
    private String theaterName;
    private List<String> timeSlots;

    // Constructors
    public Theater() {}

    public Theater(int theaterId, String theaterName, List<String> timeSlots) {
        this.theaterId = theaterId;
        this.theaterName = theaterName;
        this.timeSlots = timeSlots;
    }

    // Getters and Setters
    public int getTheaterId() {
        return theaterId;
    }

    public void setTheaterId(int theaterId) {
        this.theaterId = theaterId;
    }

    public String getTheaterName() {
        return theaterName;
    }

    public void setTheaterName(String theaterName) {
        this.theaterName = theaterName;
    }

    public List<String> getTimeSlots() {
        return timeSlots;
    }

    public void setTimeSlots(List<String> timeSlots) {
        this.timeSlots = timeSlots;
    }
}
