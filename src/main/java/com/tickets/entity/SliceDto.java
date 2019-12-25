package com.tickets.entity;

/**
 * 排片Dto
 */
public class SliceDto {
    /**
     * 排片id
     */
    private Integer sid;

    /**
     *影院名
     */
    private String cname;

    /**
     * 影院地址
     */
    private String address;

    /**
     * 影厅名
     */
    private String hname;

    /**
     * 电影名
     */
    private String mname;

    /**
     * 电影价格
     */
    private Double price;

    /**
     * 播出时间
     */
    private String playTime;


    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getHname() {
        return hname;
    }

    public void setHname(String hname) {
        this.hname = hname;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getPlayTime() {
        return playTime;
    }

    public void setPlayTime(String playTime) {
        this.playTime = playTime;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
