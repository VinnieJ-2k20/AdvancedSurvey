package com.gmail.ptimofejev;

import java.util.HashMap;

public class UserList {
    private static HashMap<String, User> userList = new HashMap<String, User>();

    public static HashMap<String, User> getUserList() {
        return userList;
    }

    public static void setUserList(HashMap<String, User> userList) {
        UserList.userList = userList;
    }
}
