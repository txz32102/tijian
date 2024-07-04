package com.shou.tijianserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 此类为整个程序的入口，也称为启动程序
 */
@SpringBootApplication
public class TijianServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(TijianServerApplication.class, args);
        System.out.println("系统已启动");
    }

}
