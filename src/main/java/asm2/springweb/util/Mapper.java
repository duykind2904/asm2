package asm2.springweb.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Mapper {
	
	private Mapper() {}
	
	private static final ObjectMapper MAPPER = new ObjectMapper();
	
	public static <T> String toJSON(T object) {
		try {
			return MAPPER.writeValueAsString(object);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return null;
		}
	}

}
