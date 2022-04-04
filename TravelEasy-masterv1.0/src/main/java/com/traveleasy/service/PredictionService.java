package com.traveleasy.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amazonaws.auth.AWSCredentialsProvider;
import com.amazonaws.regions.Region;
import com.amazonaws.services.machinelearning.AmazonMachineLearning;
import com.amazonaws.services.machinelearning.AmazonMachineLearningClientBuilder;
import com.amazonaws.services.machinelearning.model.GetMLModelRequest;
import com.amazonaws.services.machinelearning.model.GetMLModelResult;
import com.amazonaws.services.machinelearning.model.PredictRequest;
import com.amazonaws.services.machinelearning.model.PredictResult;
import com.traveleasy.model.Prediction;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class PredictionService {
	
	    private static final String MODEL_ID = "ml-x8EemSk9irD";
	    private AmazonMachineLearning client;
	    
	    @Autowired
	 	public PredictionService(Region awsRegion, AWSCredentialsProvider awsCredentialsProvider, String awsS3Bucket,
	  			String endpointUrl) {
	   		this.client = AmazonMachineLearningClientBuilder.standard().withCredentials(awsCredentialsProvider)
	   				.withRegion(awsRegion.getName()).build();

	   	}

	    public Optional<Float> getPrediction(final Prediction prediction) {	    	
	    	PredictResult result = client.predict(buildPredictionRequest(prediction));
	        Map<String,Float> resultMap = result.getPrediction().getPredictedScores();
	        if (resultMap.isEmpty()) {
	            return Optional.empty();
	        }
	        return Optional.of(resultMap.get("0"));
	    
	        
	    }
	    public Optional<Float> getPrediction1(final Prediction prediction) {	    	
	    	PredictResult result = client.predict(buildPredictionRequest(prediction));
	        Map<String,Float> resultMap = result.getPrediction().getPredictedScores();
	        if (resultMap.isEmpty()) {
	            return Optional.empty();
	        }
	        return Optional.of(resultMap.get("1"));
	    
	        
	    }

	    private Map<String, String> buildCustomerMap(final Prediction prediction) {
	        Map<String, String> customerMap = new ObjectMapper().convertValue(prediction, Map.class);
	        Map<String, String> customerStringMap = new HashMap<>();
	        for (Map.Entry entry : customerMap.entrySet()) {
	            customerStringMap.put(entry.getKey().toString(), entry.getValue().toString());
	        }
	        return customerStringMap;
	    }

	    private PredictRequest buildPredictionRequest(final Prediction prediction) {
	    	Map<String, String> customerMap = buildCustomerMap(prediction);
	        return new PredictRequest()
	                .withMLModelId(MODEL_ID)
	                .withPredictEndpoint(getModelEndpoint())
	                .withRecord(customerMap);
	    }

	    private String getModelEndpoint() {
	        GetMLModelRequest request = new GetMLModelRequest().withMLModelId(MODEL_ID);
	        GetMLModelResult model = client.getMLModel(request);
	        return model.getEndpointInfo().getEndpointUrl();
	    }
	
}
