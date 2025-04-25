package zsc.j2e.entity;

public class EmailCode {
    private String email;
    private String code;

    public EmailCode(String email, String code) {
        this.email = email;
        this.code = code;
    }

    @Override
    public String toString() {
        return "EmailCode{" +
                "email='" + email + '\'' +
                ", code=" + code +
                '}';
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
