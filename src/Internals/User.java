package Internals;

import java.io.Serializable;

public class User implements Serializable {
    private String login;
    private String password;
    private int id;

    public User() {}
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User(String login, String password) {
        this.login = login;
        this.password = password;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public Boolean checkPassword(String password) {
        return this.password.equals(password);
    }

    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof User))
            return false;
        User u = (User)obj;
        return this.login.equals(u.login);
    }

    @Override
    public int hashCode() {
        return login.hashCode();
    }
}
