package com.mywork.pojo;

public class Major {
    private Integer id;
    private String majorno;
    private String majorname;

    @Override
    public String toString() {
        return "Major{" +
                "id=" + id +
                ", majorno='" + majorno + '\'' +
                ", majorname='" + majorname + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMajorno() {
        return majorno;
    }

    public void setMajorno(String majorno) {
        this.majorno = majorno;
    }

    public String getMajorname() {
        return majorname;
    }

    public void setMajorname(String majorname) {
        this.majorname = majorname;
    }


}
