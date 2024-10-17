package poly.edu.controller;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import poly.edu.model.ChatRequest;
import java.util.HashMap;
import java.util.Map;

@RestController
public class ChatbotController {

	@PostMapping("/chat")
	public Map<String, String> chatWithBot(@RequestBody ChatRequest request) {
		String apiKey = ""; 
		String apiUrl = "https://api.openai.com/v1/chat/completions"; // Đổi endpoint đúng

		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + apiKey);
		headers.set("Content-Type", "application/json");

		// Tạo payload với tham số model và messages
		String prompt = request.getMessage();
		String body = "{" +
			"\"model\": \"gpt-3.5-turbo\"," +
			"\"messages\": [{" +
			"\"role\": \"user\"," +
			"\"content\": \"" + prompt + "\"" +
			"}]," +
			"\"max_tokens\": 100" +
		"}";

		HttpEntity<String> entity = new HttpEntity<>(body, headers);

		 try {
		        ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.POST, entity, String.class);
		        Map<String, String> responseBody = new HashMap<>();
		        responseBody.put("reply", response.getBody());
		        return responseBody;
		    } catch (HttpClientErrorException e) {
		        if (e.getStatusCode() == HttpStatus.TOO_MANY_REQUESTS) {
		            // Xử lý lỗi 429
		            Map<String, String> errorResponse = new HashMap<>();
		            errorResponse.put("reply", "Đã vượt quá hạn mức yêu cầu. Vui lòng thử lại sau.");
		            return errorResponse;
		        }
		        throw e; // Ném lỗi khác lên
		    }
	}
}
