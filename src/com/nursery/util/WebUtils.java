package com.nursery.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import sun.misc.BASE64Encoder;

public class WebUtils {

	// 将日期转换为字符串,去0
	public static String date2String(Date date) {
		if (date == null)
			return null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}

	public static Date String2Date(String date) {
		if (date == null)
			return null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			return sdf.parse(date);
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}
	}

	// MD5
	public static String encrypt(String password) {
		try {
			return new BASE64Encoder().encode(MessageDigest.getInstance("md5").digest(password.getBytes()));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	//将Double 保留两位小数 
	public static double formatDoubleTwoDecimal(double dou){
		return (double)Math.round(dou*100)/100;
	}
	/**
	 * 将钱数由小写转为大写
	 */
	
	    private static final String NUM = "零壹贰叁肆伍陆柒捌玖";
	    private static final String UNIT = "仟佰拾个";
	    private static final String GRADEUNIT = "仟万亿兆";
	    private static final String DOTUNIT = "角分厘";
	    private static final int GRADE = 4;
	    private static final NumberFormat nf = new DecimalFormat("#0.###");

	    public static String toBigAmt(double amount) {
	        nf.setMinimumFractionDigits(3);//小数点后不足的补零
	        String amt = nf.format(amount);//将double类型的数格式化并转换成字符串,实际上进行了四舍五入
	        String dotPart = ""; //取小数位
	        String intPart = ""; //取整数位
	        int dotPos;

	        if ((dotPos = amt.indexOf('.')) != -1) {
	            intPart = amt.substring(0, dotPos);
	            dotPart = amt.substring(dotPos + 1);
	        } else {
	            intPart = amt;
	        }
	        if (intPart.length() > 16)
	            throw new java.lang.InternalError("The amount is too big.");
	        String intBig = intToBig(intPart);
	        String dotBig = dotToBig(dotPart);
	        //以下代码稍做修改，现在是完美的代码啦！
	        if ((dotBig.length() == 0) && (intBig.length() != 0)) {
	            return intBig + "元整";
	        } else if ((dotBig.length() == 0) && (intBig.length() == 0)) {
	            return intBig + "零元";
	        } else if ((dotBig.length() != 0) && (intBig.length() != 0)) {
	            return intBig + "元" + dotBig;
	        } else {
	            return dotBig;
	        }
	    }
	    //用来处理几角几分几厘
	    private static String dotToBig(String dotPart) {
	        //得到转换后的大写（小数部分）
	        String strRet = "";
	        for (int i = 0; i < dotPart.length() && i < 3; i++) {
	            int num;
	            if ((num = Integer.parseInt(dotPart.substring(i, i + 1))) != 0)
	                strRet += NUM.substring(num, num + 1)
	                        + DOTUNIT.substring(i, i + 1);
	        }
	        return strRet;
	    }
	    //用来处理多少元
	    private static String intToBig(String intPart) {
	        //得到转换后的大写（整数部分）
	        int grade; //级长
	        String result = "";
	        String strTmp = "";
	        //得到当级长
	        grade = intPart.length() / GRADE;
	        //调整级次长度
	        if (intPart.length() % GRADE != 0)
	            grade += 1;
	        //对每级数字处理，先处理最高级，然后再处理低级的
	        for (int i = grade; i >= 1; i--) {
	            strTmp = getNowGradeVal(intPart, i);//取得当前级次数字
	            result += getSubUnit(strTmp);//转换大写
	            result = dropZero(result);//除零 去掉连续的零
	            //加级次单位
	            if (i > 1) //末位不加单位
	                //单位不能相连续
	                //注意：连续4个零的时候要特殊处理
	                if(getSubUnit(strTmp).equals("零零零零")){
	                    result = result+"零";
	                }else{
	                 result += GRADEUNIT.substring(i - 1, i);
	                }
	        }
	        return result;
	    }
	    //得到当前级次的串
	    private static String getNowGradeVal(String strVal, int grade) {       
	        String rst;
	        if (strVal.length() <= grade * GRADE)
	            rst = strVal.substring(0, strVal.length() - (grade - 1) * GRADE);
	        else
	            rst = strVal.substring(strVal.length() - grade * GRADE, strVal
	                    .length()
	                    - (grade - 1) * GRADE);
	        return rst;
	    }
	    //数值转换
	    private static String getSubUnit(String strVal) {       
	        String rst = "";
	        for (int i = 0; i < strVal.length(); i++) {
	            String s = strVal.substring(i, i + 1);
	            int num = Integer.parseInt(s);
	            if (num == 0) {
	                //“零”作特殊处理
	                if (i != strVal.length()) //转换后数末位不能为零
	                    rst += "零";
	            } 
	            else {
	                //“壹拾”作特殊处理
	                rst += NUM.substring(num, num + 1);
	                //追加单位
	                if (i != strVal.length() - 1)//个位不加单位
	                    rst += UNIT.substring(i + 4 - strVal.length(), i + 4
	                            - strVal.length() + 1);
	            }
	        }
	        return rst;
	    }
	    //去除连继的“零”
	    private static String dropZero(String strVal) {     
	        String strRst;
	        String strBefore; //前一位置字符
	        String strNow; //现在位置字符
	        strBefore = strVal.substring(0, 1);
	        strRst = strBefore;
	        for (int i = 1; i < strVal.length(); i++) {
	            strNow = strVal.substring(i, i + 1);
	            if (strNow.equals("零") && strBefore.equals("零"))
	             ;//同时为零
	            else
	                strRst += strNow;
	            strBefore = strNow;
	        }
	        //末位去零
	        if (strRst.substring(strRst.length() - 1, strRst.length()).equals("零"))
	            strRst = strRst.substring(0, strRst.length() - 1);
	        return strRst;
	    }
}
