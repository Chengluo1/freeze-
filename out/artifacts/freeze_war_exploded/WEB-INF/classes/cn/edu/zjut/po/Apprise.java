package cn.edu.zjut.po;

public class Apprise {
    private int appriseId;
    private String content;
    private int score;
    private Photographer photographer;
    private Employer employer;

    public Apprise() {
    }

    public int getAppriseId() {
        return this.appriseId;
    }

    public void setAppriseId(int appriseId) {
        this.appriseId = appriseId;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getScore() {
        return this.score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public Photographer getPhotographer() {
        return this.photographer;
    }

    public void setPhotographer(Photographer photographer) {
        this.photographer = photographer;
    }

    public Employer getEmployer() {
        return this.employer;
    }

    public void setEmployer(Employer employer) {
        this.employer = employer;
    }
}
