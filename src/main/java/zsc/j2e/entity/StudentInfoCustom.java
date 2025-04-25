package zsc.j2e.entity;

public class StudentInfoCustom extends StudentInfo{
    private String collegeName;

    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName;
    }

    @Override
    public String toString() {
        return "StudentInfo{" +
                "userid=" + getUserid() +
                ", username='" + getUsername() + '\'' +
                ", sex='" + getSex() + '\'' +
                ", birthyear=" + getBirthyear() +
                ", grade=" + getGrade() +
                ", collegeid=" + getCollegeid() +
                ", phone='" + getPhone() + '\'' +
                ", nation='" + getNation() + '\'' +
                ", postcode='" + getPostcode() + '\'' +
                ", hometown='" + getHometown() + '\'' +
                ", language='" + getLanguage() + '\'' +
                ", address='" + getAddress() + '\'' +
                ", collage='" + getCollegeName() + '\'' +
                ", email='" + getEmail() + '\'' +
                '}';
    }
}
