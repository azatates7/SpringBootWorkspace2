package structure.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Log4jController {

    private static final Logger logger = LogManager.getLogger(Log4jController.class);

    @RequestMapping("/")
    @ResponseBody
    public String testMethod() {

        logger.trace("This is a trace log example");
        logger.info("This is an info log example");
        logger.debug("This is a debug log example");
        logger.error("This is an error log example");
        logger.fatal("This is a fatal log example");
        logger.warn("This is a warn log example");

        return "Check the Console Logs";
    }
}
