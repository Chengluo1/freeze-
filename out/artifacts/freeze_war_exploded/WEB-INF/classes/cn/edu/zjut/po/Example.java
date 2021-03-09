package cn.edu.zjut.po;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

public class Example {
    private Integer exampleId;
    private String name;
    private String description;
    private String style;
    private Integer praise = 0;
    private Timestamp time;
    private String area;
    private Integer visits;
    private Photographer photographer;
    private Set panoramas = new HashSet(0);
    private Set pictures = new HashSet(0);
    private Set comments = new HashSet(0);
    private Set<Employer> em_collecters = new HashSet();

    public Example() {
    }

    public Example(Integer exampleId) {
        this.setExampleId(exampleId);
    }

    public Example(Integer exampleId, String name, String description, String style, Integer praise, Timestamp time, String area, Integer visits, Photographer photographer, Set panoramas, Set pictures, Set comments, Set<Employer> em_collecters) {
        this.exampleId = exampleId;
        this.name = name;
        this.description = description;
        this.style = style;
        this.praise = praise;
        this.time = time;
        this.area = area;
        this.visits = visits;
        this.photographer = photographer;
        this.panoramas = panoramas;
        this.pictures = pictures;
        this.comments = comments;
        this.em_collecters = em_collecters;
    }

    public Integer getExampleId() {
        return this.exampleId;
    }

    public void setExampleId(Integer exampleId) {
        this.exampleId = exampleId;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStyle() {
        return this.style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public Integer getPraise() {
        return this.praise;
    }

    public void setPraise(Integer praise) {
        this.praise = praise;
    }

    public Timestamp getTime() {
        return this.time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getArea() {
        return this.area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public Photographer getPhotographer() {
        return this.photographer;
    }

    public void setPhotographer(Photographer photographer) {
        this.photographer = photographer;
    }

    public Set getPanoramas() {
        return this.panoramas;
    }

    public void setPanoramas(Set panoramas) {
        this.panoramas = panoramas;
    }

    public Set getPictures() {
        return this.pictures;
    }

    public void setPictures(Set pictures) {
        this.pictures = pictures;
    }

    public Set getComments() {
        return this.comments;
    }

    public void setComments(Set comments) {
        this.comments = comments;
    }

    public Set<Employer> getEm_collecters() {
        return this.em_collecters;
    }

    public void setEm_collecters(Set<Employer> em_collecters) {
        this.em_collecters = em_collecters;
    }

    public Integer getVisits() {
        return this.visits;
    }

    public void setVisits(Integer visits) {
        this.visits = visits;
    }
}
