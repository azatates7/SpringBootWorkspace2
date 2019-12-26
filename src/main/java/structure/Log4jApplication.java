package structure;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages={"structure.controller"})

public class Log4jApplication extends SpringBootServletInitializer implements CommandLineRunner {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(Log4jApplication.class);
    }

    public static void main(String[] args) {
            SpringApplication.run(Log4jApplication.class, args);
    }

    @Override
    public void run(String... args) {
        System.out.println("Run Ok!");
    }

}