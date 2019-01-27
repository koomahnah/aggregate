package Internals;

import java.util.ArrayList;
import java.util.List;

public class AppContext {
    private static AppContext ourInstance = new AppContext();

    public static AppContext getInstance() {
        return ourInstance;
    }
    private HibernateMe hibernate;
    private User currentUser;

    private List<User> users;
    private List<Content> contents;
    private AppContext() {
        hibernate = new HibernateMe();
        users = hibernate.dehibernateUsers();
        contents = hibernate.dehibernateContents();
        if (contents == null) {
            contents = new ArrayList<Content>();
        }
        if (users == null)
            users = new ArrayList<User>();
    }
    public Boolean addUser(User u) {
        if (users.contains(u)) {
            return false;
        }
        hibernate.hibernateUser(u);
        users.add(u);
        return true;
    }
    public void addContent(Content c) {
        hibernate.hibernateContent(c);
        contents.add(c);
    }
    public void voteContent(Content c, User u) {
        c.vote(u);
        hibernate.updateContent(c, u);
    }
    public void downvoteContent(Content c, User u) {
        c.downvote(u);
        hibernate.updateContent(c, u);
    }

    public User getCurrentUser() {
        return currentUser;
    }
    public Boolean login(String login, String password) {
        for (User u: users)
            if (u.getLogin().equals(login) && u.checkPassword(password)) {
                currentUser = u;
                return true;
            }
        return false;
    }

    public void logout() {
        currentUser = null;
    }
    public List<User> getUsers() {
        return users;
    }

    public List<Content> getContents() {
        return contents;
    }

    static public void main(String [] args)
    {
        HibernateMe hib = new HibernateMe();
        Content c = new Content("brand new content check it out",
                "https://www.youtube.com/watch?v=vTIIMJ9tUc8",
                "Tunak tunak tun, da da da.", null);
        hib.hibernateContent(c);
        List <User> u = hib.dehibernateUsers();
        for (User user: u) {
            System.out.println(user.getLogin());
        }
        List <Content> cp = hib.dehibernateContents();
        for (Content cont: cp) {
            System.out.println(cont.getTitle());
        }
    }
}
