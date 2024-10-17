package poly.edu.model;

public class ChatGPTRequest {
    private String prompt;

    public ChatGPTRequest(String prompt) {
        this.prompt = prompt;
    }

    // Getter và Setter
    public String getPrompt() {
        return prompt;
    }

    public void setPrompt(String prompt) {
        this.prompt = prompt;
    }
}
