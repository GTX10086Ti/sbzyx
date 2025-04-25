package zsc.j2e.entity;

//课程类拓展
public class CourseCustom extends Course {

    //所属院系名
    private String collegeName;

    public void setcollegeName(String collegeName) {
        this.collegeName = collegeName;
    }

    public String getcollegeName() {
        return collegeName;
    }

    @Override
    public String toString() {
        return super.toString()+"CourseCustom{" +
                "collegeName='" + collegeName + '\'' +
                '}';
    }
}
