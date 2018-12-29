package Internals;

import java.util.ArrayList;

public class AppContext {
    private static AppContext ourInstance = new AppContext();

    public static AppContext getInstance() {
        return ourInstance;
    }
    private User currentUser;

    private ArrayList<User> users;
    private ArrayList<Content> contents;
    private AppContext() {
        users = new ArrayList<User>();
        contents = new ArrayList<Content>();
        contents.add(new Content("India national anthem remake",
                "https://www.youtube.com/watch?v=vTIIMJ9tUc8",
                "Tunak tunak tun, da da da.", null));
    }
    public Boolean addUser(User u) {
        if (users.contains(u)) {
            return false;
        }
        users.add(u);
        return true;
    }
    public void addContent(Content c) {
        contents.add(c);
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
    public ArrayList<User> getUsers() {
        return users;
    }

    public ArrayList<Content> getContents() {
        return contents;
    }
}
