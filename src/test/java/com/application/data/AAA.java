package com.application.data;

public class AAA {

	public static void main(String[] args) {
		
		int count = updateBalance(5);
		if (count>0){
			System.out.println("11111111111111111111111111111111111111");
		}else {
			System.out.println("22222222222222222222222222222222222222");
		}
	}
	
	private static int updateBalance( int loopCount) {
		int index = 0 ;
		int count = 0;
		do{
			count = 1;
			index ++;
		}while(count>0 || index <= loopCount);
		
		return  count;
	}
	
}
