package com.spring.bank.user.vo;

import java.sql.Date;

//연금 
public class IrpVO {

   private int irp_id;                // 연금번호
   private String irp_product_name;       // 연금상품이름
   private String member_id;             // 가입 고객id
   private String account_id;             // 계좌번호
   private Date irp_joinDate;             // 연금가입날짜
   private int irp_state;                // 연금상태
   private float irp_rate;             // 연금금리
   private int irp_money;             // 연금금액
   private Date irp_endDate;          // 만기일

   public int getIrp_id() {
      return irp_id;
   }

   public void setIrp_id(int irp_id) {
      this.irp_id = irp_id;
   }

   public String getIrp_product_name() {
      return irp_product_name;
   }

   public void setIrp_product_name(String irp_product_name) {
      this.irp_product_name = irp_product_name;
   }

   public String getMember_id() {
      return member_id;
   }

   public void setMember_id(String member_id) {
      this.member_id = member_id;
   }

   public String getAccount_id() {
      return account_id;
   }

   public void setAccount_id(String account_id) {
      this.account_id = account_id;
   }

   public Date getIrp_joinDate() {
      return irp_joinDate;
   }

   public void setIrp_joinDate(Date irp_joinDate) {
      this.irp_joinDate = irp_joinDate;
   }

   public int getIrp_state() {
      return irp_state;
   }

   public void setIrp_state(int irp_state) {
      this.irp_state = irp_state;
   }

   public float getIrp_rate() {
      return irp_rate;
   }

   public void setIrp_rate(float irp_rate) {
      this.irp_rate = irp_rate;
   }

   public int getIrp_money() {
      return irp_money;
   }

   public void setIrp_money(int irp_money) {
      this.irp_money = irp_money;
   }

   public Date getIrp_endDate() {
      return irp_endDate;
   }

   public void setIrp_endDate(Date irp_endDate) {
      this.irp_endDate = irp_endDate;
   }

}