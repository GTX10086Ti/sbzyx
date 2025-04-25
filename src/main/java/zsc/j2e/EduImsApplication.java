package zsc.j2e;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("zsc.j2e.mapper")
public class EduImsApplication {

    public static void main(String[] args) {
        SpringApplication.run(EduImsApplication.class, args);
    }

}
