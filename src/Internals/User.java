package Internals;

public class User {
    private String login;
    private String password;
    public User(String login, String password) {
        this.login = login;
        this.password = password;
    }

    public String getLogin() {
        return login;
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
