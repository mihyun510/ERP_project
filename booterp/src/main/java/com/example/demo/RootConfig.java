package com.example.demo;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

@Component
@ComponentScan(basePackages = {"erp.work"})
@ComponentScan(basePackages = {"erp.conference"})
@ComponentScan(basePackages = {"erp.myService"})
@ComponentScan(basePackages = {"erp.board"})
public class RootConfig {

}
