package zsc.j2e.entity;

public class ResultCode {
    String data;
    int code;

    public ResultCode(String data, int code) {
        this.data = data;
        this.code = code;
    }

    public ResultCode() {

    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return "ResultCode{" +
                "data='" + data + '\'' +
                ", code=" + code +
                '}';
    }
}
