package com.haramasu.assembly.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author: Ding, Shuo
 * @description:
 * @create: 2019-03-15 16:04
 **/
@RestController
public class TestController {

    @Value("${nihao.aa}")
    String strTepm;

    @GetMapping("/")
    public String test(){
        return strTepm;
    }
}
