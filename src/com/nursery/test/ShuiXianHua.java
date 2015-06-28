package com.nursery.test;

public class ShuiXianHua {

	public static void main(String[] args) {

		for(int i = 100 ; i < 999; i ++){
			if(isTure(i))System.out.println(i);
		}
	 }
	
	public static boolean isTure(int number){
		int a = number / 100;
		int b = ( number - a * 100 ) / 10;
		int c = number - a * 100 - b * 10;
		int i = (int) (Math.pow(a, 3) + Math.pow(b, 3)+Math.pow(c, 3));
		
		if(number == i){
			return true;
		}
		return false;
	}
	


}
