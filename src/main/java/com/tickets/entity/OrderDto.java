package com.tickets.entity;

public class OrderDto {

    /**
     * 订单id
     */
    private String oid;

    /**
     * 用户id
     */
    private Integer uid;

    /**
     * 排片id
     */
    private Integer sid;

    /**
     * 用户名
     */
    private String uname;

    /**
     * 影院名
     */
    private String cname;

    /**
     * 影厅名
     */
    private String hname;

    /**
     * 电影名
     */
    private String mname;

    /**
     * 播放时间
     */
    private String playTime;

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
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

    public String getPlayTime() {
        return playTime;
    }

    public void setPlayTime(String playTime) {
        this.playTime = playTime;
    }
}
