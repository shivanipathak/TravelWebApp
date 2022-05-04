package com.traveleasy.client;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;


public class ClientUtils {

	public static String userName;
	public String sendGetRequest(String URL) {
		Client client = ClientBuilder.newClient();
		WebTarget target = client.target(URL);
		Response response = target.request().get();
		return response.readEntity(String.class);
	}
	
	
	
	public String sendPostRequest(String URL,String jsonPayload) {

	

	 Client client = ClientBuilder.newClient();

	 WebTarget target = client.target(URL);

	Response response = target.request().post(Entity.entity(jsonPayload,
	MediaType.APPLICATION_JSON));

	 return response.readEntity(String.class);
	 }


}
