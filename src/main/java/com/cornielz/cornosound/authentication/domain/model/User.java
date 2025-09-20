package com.cornielz.cornosound.authentication.domain.model;

import com.cornielz.cornosound.authentication.domain.model.AccountStatus;

import java.util.UUID;

public class User {
    private final UUID id;

    private String name;
    private String nickname;

    private String email;

    private String about_me;

    private AccountStatus accountStatus;

    public User(UUID id, String name, String nickname, String email, String about_me, AccountStatus accountStatus) {
        this.id = id;

        this.name = name;
        this.nickname = nickname;

        this.email = email;

        this.about_me = about_me;

        this.accountStatus = accountStatus;
    }

    // Setters

    public UUID getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getNickname() {
        return nickname;
    }

    public String getEmail() {
        return email;
    }

    public String getAboutMe() {
        return about_me;
    }
    public AccountStatus getAccountStatus() {
        return accountStatus;
    }
}
