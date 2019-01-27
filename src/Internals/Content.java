package Internals;

import java.util.ArrayList;
import java.util.Date;

public class Content {
    private String title;
    private String url;
    private String description;
    private String adder;
    private Integer votes = 0;
    private ArrayList<User> voted;
    private java.util.Date dateCreated;
    private int id;
    public Content() {};
    public Content (String title, String url, String description, User adder) {
        this.title = title;
        this.url = url;
        this.description = description;
        this.adder = adder.getLogin();
        this.voted = new ArrayList<User>();
        this.dateCreated = new Date();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAdder() {
        return adder;
    }

    public void setAdder(String adder) {
        this.adder = adder;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setVotes(Integer votes) {
        this.votes = votes;
    }

    public String getTitle() {
        return title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setVoted(ArrayList<User> voted) {
        this.voted = voted;
    }

    public ArrayList<User> getVoted() {
        return voted;
    }

    public void vote(User u) {
        if (hasUserVoted(u))
            return;
        voted.add(u);
        votes++;
    }
    public void downvote(User u) {
        if (hasUserVoted(u))
            return;
        voted.add(u);
        votes--;
    }

    public Integer getVotes() {
        return votes;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Boolean hasUserVoted(User u) {
        return voted.contains(u);
    }
}
