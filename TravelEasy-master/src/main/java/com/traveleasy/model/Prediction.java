package com.traveleasy.model;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonSetter;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Prediction {
	 private String country;
	    private String month;
	    private String budget;

	    @JsonGetter("country")
	    public String getCountry() {
	        return country;
	    }

	    @JsonSetter("country")
	    public void setCountry(final String country) {
	        this.country = country;
	    }

	    @JsonGetter("month")
	    public String getMonth() {
	        return month;
	    }

	    @JsonSetter("month")
	    public void setMonth(final String month) {
	        this.month = month;
	    }

	    @JsonGetter("budget")
	    public String getBudget() {
	        return budget;
	    }

	    @JsonSetter("budget")
	    public void setBudget(final String budget) {
	        this.budget = budget;
	    }

	    public String toString() {
	        ObjectMapper mapper = new ObjectMapper();
	        try {
	            return mapper.writeValueAsString(this);
	        } catch (JsonProcessingException e) {
	            e.printStackTrace();
	        }
	        return "Unable to convert object to JSON";
	    }
}
