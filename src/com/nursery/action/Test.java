package com.nursery.action;

public class Test {

	public static void main(String[] args) {
		
		/*String number = "DSC_0004___G3+E+LM+0206K+300";
		
		number = number.substring(number.indexOf("_")+1);
		
		number = number.substring(number.indexOf("_")).replaceAll("_", "");
		
		String s1 = number.substring(0,number.indexOf("+"));
		
		number = number.substring(number.indexOf("+")+1);
		
		number = number.substring(number.indexOf("+")+1);
		
		number = number.substring(number.indexOf("+")+1);
		
		number = number.replaceAll("\\+", "");
		
		System.out.println(s1+number);*/
		
		String str = "1.2.3.4.5";
		System.out.println(str.substring(str.lastIndexOf(".")+1));
	}

}
