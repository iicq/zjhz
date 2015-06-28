package com.nursery.dao.spring;

class SpringHelper {
    private static String getSQLName(String name, String pre) {
        char[] nameArray = name.toCharArray();
        StringBuilder buffer = new StringBuilder();
        if(pre != null) {
            buffer.append(pre).append("_");
        }
        int i;
        for (i = 0; i < nameArray.length; i++) {
            if (nameArray[i] <= 'Z' && nameArray[i] >= 'A') {
                if (i != 0) {
                    buffer.append("_");
                }
                buffer.append(String.valueOf(nameArray[i]).toLowerCase());
            } else {
                buffer.append(nameArray[i]);
            }
        }
        String result = buffer.toString();
        buffer.setLength(0);
        return result;
    }
    public static String getTableName(Class<?> clazz) {
        String simpleName = clazz.getSimpleName();
        //表名前缀
        return getSQLName(simpleName.substring(0, simpleName.length()), null);
    }

    public static String getColumnName(String fieldName) {
    	//列名前缀
        return getSQLName(fieldName, null);
    }
}
