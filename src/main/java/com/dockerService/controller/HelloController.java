package com.dockerService.controller;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.concurrent.atomic.AtomicInteger;
@Slf4j
@RestController
@RequestMapping("/")
public class HelloController {
    private AtomicInteger hitCounter = new AtomicInteger(1);
    @GetMapping("hello/")
    public ResponseEntity<String> helloJava(){
        int hits = hitCounter.getAndIncrement();
        log.info("number of hit count is:{}",hits);
        return new ResponseEntity<>("welcome to docker world! hit count is: "+hits, HttpStatus.OK);
    }
}
