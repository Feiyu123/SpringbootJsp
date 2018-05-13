package com.lrq.demo.service;

import com.lrq.demo.model.User;

public interface UserService {
    User getUserByName(String name);
    void addUser(User user);
}
