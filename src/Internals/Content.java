package Internals;

import java.util.ArrayList;
import java.util.Date;

public class Content {
    private String title;
    private String url;
    private String description;
    private User adder;
    private Integer votes = 0;
    private ArrayList<User> voted;
    private java.util.Date dateCreated;
    public Content (String title, String url, String description, User adder) {
        this.title = title;
        this.url = url;
        this.description = description;
        this.adder = adder;
        this.voted = new ArrayList<User>();
        this.dateCreated = new Date();
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public String getTitle() {
        return title;
    }

    public String getUrl() {
        return url;
    }

    public String getDescription() {
        return description;
    }

    public User getAdder() {
        return adder;
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

    public Boolean hasUserVoted(User u) {
        return voted.contains(u);
    }
}
