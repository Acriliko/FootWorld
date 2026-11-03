package model;


import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

//Da usare come super classe
public class User {
    private String username;
    private String password;
    private String email;
    private boolean admin;

    public User(String username, String password, String email,boolean admin)  {
        this.username = username;
        this.password = hashPassword(password);//hashing pw
        this.email = email;
        this.admin = admin;
    }

    public User() {
        
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isAmministratore() {
        return admin;
    }

    public void setAmministratore(boolean amministratore) {
        this.admin = amministratore;
    }

    //Metodo per l'hashing della password
    private String hashPassword(String password) {
        String hashString = null;
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-512");
            byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
            hashString = "";
            for (int i = 0; i < hash.length; i++) {
                hashString += Integer.toString((hash[i] & 0xff) | 0x100, 16).substring(1,3);
            }
        } catch (NoSuchAlgorithmException e){
            e.printStackTrace();
        }
        return hashString;
    }
    
}   

