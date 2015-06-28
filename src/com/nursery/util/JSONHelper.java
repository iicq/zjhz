package com.nursery.util;

import com.google.gson.Gson;


public class JSONHelper {
    private static Gson gson = new Gson();
    public static String toJSONString(Object object) {
        return gson.toJson(object);
    }
}
