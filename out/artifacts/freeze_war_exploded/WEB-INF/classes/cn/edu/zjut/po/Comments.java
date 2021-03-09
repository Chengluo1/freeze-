package cn.edu.zjut.po;

import java.sql.Timestamp;

public class Comments {
    private Integer commentsId;
    private String content;
    private Timestamp time;
    private Example example;
    private String reviewer;

    public Comments() {
    }

    public Comments(Integer commentsId) {
        this.setCommentsId(commentsId);
    }

    public Comments(Integer commentsId, String content, String reviewer, Timestamp time, Example example) {
        this.setCommentsId(commentsId);
        this.setContent(content);
        this.setReviewer(reviewer);
        this.setTime(time);
        this.setExample(example);
    }

    public Integer getCommentsId() {
        return this.commentsId;
    }

    public void setCommentsId(Integer commentsId) {
        this.commentsId = commentsId;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getTime() {
        return this.time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Example getExample() {
        return this.example;
    }

    public void setExample(Example example) {
        this.example = example;
    }

    public String getReviewer() {
        return this.reviewer;
    }

    public void setReviewer(String reviewer) {
        this.reviewer = reviewer;
    }
}
