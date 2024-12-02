package com.heetae.jspproject.admin.model;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.sql.Timestamp;

@Setter
@Getter
public class MemberDTO {
    private int memberId;
    private String name;
    private String email;
    private String address;
    private String phoneNumber;
    private Timestamp createdAt;

}