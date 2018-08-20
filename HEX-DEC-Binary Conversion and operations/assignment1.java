///////////////////////////////////////////////////////////////////////////////////////////
//
// Author: Mario Enriquez	A00909441s
// COMP 7615
// Assignment 1
//
// 1.	Write a function that receives a string containing a 16-bit binary integer.   
// The function must return the string’s integer value.
// 2.	Write a function that receives an integer.  The function must return a string 
// containing the hexadecimal representation of the integer.
// Optional:
// 3.	Write a function that adds two hexadecimal strings each as long as 1000 digits.  
// Returns a hexadecimal string that represents the sum of the inputs.
// 4.	Write a function of multiplies a single hex digit by a hex digit string as long as 
// 1000 digits.  Returns a hex string that represents the product.
//
///////////////////////////////////////////////////////////////////////////////////////////

import java.util.Scanner;

public class assignment1 {
	
	public static char int_to_char_hex(int i){
		//Returns the hexadecimal char value of an integer
		switch(i){
			case 1:
				return '1';
			case 2:
				return '2';
			case 3:
				return '3';
			case 4:
				return '4';
			case 5:
				return '5';
			case 6:
				return '6';
			case 7:
				return '7';
			case 8:
				return '8';
			case 9:
				return '9';
			case 0:
				return '0';
			case 10:
				return 'a';
			case 11:
				return 'b';
			case 12:
				return 'c';
			case 13:
				return 'd';
			case 14:
				return 'e';
			case 15:
				return 'f';
		}
		return ' ';
	}
	
	public static int char_to_int(char c){
		//Returns the integer value of a character from 0-9 and a-f
		switch(c){
			case '1':
				return 1;
			case '2':
				return 2;
			case '3':
				return 3;
			case '4':
				return 4;
			case '5':
				return 5;
			case '6':
				return 6;
			case '7':
				return 7;
			case '8':
				return 8;
			case '9':
				return 9;
			case '0':
				return 0;
			case 'a':
				return 10;
			case 'b':
				return 11;
			case 'c':
				return 12;
			case 'd':
				return 13;
			case 'e':
				return 14;
			case 'f':
				return 15;
		}
		return 0;
	}

	public static int binary_to_int(String chars){ //1
		//Transforms a char array containing a binary number into a decimal integer
		int decimal_number=0,i,j=1;
		for(i=(chars.length()-1);i>=0;i--){
			decimal_number+=(j*char_to_int(chars.charAt(i)));
			j=j*2;
		}
		return decimal_number;
	}
	
	public static String integer_to_hex(String chars){ //2
		//Converts an integer to a hexadecimal value
		int decimal_number=0,i,j=1;
		String hex="";
		for(i=(chars.length()-1);i>=0;i--){ //converts decimal char array into integer form
			decimal_number+=(j*char_to_int(chars.charAt(i)));
			j=j*10;
		}
		do{ //Creates hexadecimal number based on division and mod of 16
			j=decimal_number%16;
			hex=int_to_char_hex(j)+hex;
			decimal_number=decimal_number/16;
		} while(decimal_number>0);
		return hex;
	}
	
	public static String hex_sum(String hex1, String hex2){ //3
		//Sums two hex numbers by converting them to decimal value, adding them and then converting them to hexadecimal form again
		int decimal1=0,decimal2=0,i,j=1;
		String hex_result="";
		for(i=(hex1.length()-1);i>=0;i--){ //Converts hexadecimal value 1 into decimal form
			decimal1+=(j*char_to_int(hex1.charAt(i)));
			j=j*16;
		}
		j=1;
		for(i=(hex2.length()-1);i>=0;i--){ //Converts hexadecimal value 2 into decimal form
			decimal2+=(j*char_to_int(hex2.charAt(i)));
			j=j*16;
		}
		decimal1+=decimal2;
		hex_result=integer_to_hex(""+decimal1); //Calls function to convert into hex value
		return hex_result;
	}
	
	public static String hex_mult(String hex1, String hex2){ //4
		//Multiplies two hex numbers by converting them to decimal value, adding them and then converting them to hexadecimal form again
		int decimal1=0,decimal2=0,i,j=1;
		String hex_result="";
		for(i=(hex1.length()-1);i>=0;i--){ //Converts hexadecimal value 1 into decimal form
			decimal1+=(j*char_to_int(hex1.charAt(i)));
			j=j*16;
		}
		j=1;
		for(i=(hex2.length()-1);i>=0;i--){ //Converts hexadecimal value 2 into decimal form
			decimal2+=(j*char_to_int(hex2.charAt(i)));
			j=j*16;
		}
		decimal1*=decimal2;
		hex_result=integer_to_hex(""+decimal1); //Calls function to convert into hex value
		return hex_result;
	}
	
	public static void main(String[] args){
		//Main function, mainly calls the other functions
		Scanner scanner = new Scanner(System.in); 
		String option,chars,hex_result="",hex1,hex2;
		int number_result;
		do{				//Menu options will repeat until 0
			System.out.println("Press what you want to do:\n" +
							   "1 - Return a string integer value from a binary integer.\n" +
							   "2 - Return a hexadecimal string from an integer value.\n" +
							   "3 - Add two hexadecimal strings.\n" +
							   "4 - Multiply two hexadecimal strings.\n" +
							   "0 - To exit\n");
			option=scanner.nextLine();
			switch (option){
				default: //invalid option
					System.out.println("Please enter a valid option.");
					break;
				case "0": //Terminates program
					break;
				case "1": // Option 1 Return a decimal integer from a binary char array
					System.out.println("Enter a binary number:\n");
					chars=scanner.nextLine();
					if (chars.matches("^[01]+$") ){ //If char array contains these values, then execute the function 
						number_result=binary_to_int(chars);
						System.out.println("Result is:" + number_result);
					} else {
						System.out.println("Number not a binary number.");
					}
					break;
				case "2":
					System.out.println("Enter an integer:\n");
					chars=scanner.nextLine();
					if (chars.matches("^[0-9]+$") ){ //If char array contains these values, then execute the function 
						hex_result=integer_to_hex(chars);
						System.out.println("Result is:" + hex_result);
					} else {
						System.out.println("Number not a decimal number.");
					}
					break;
				case "3":
					System.out.println("Enter first hexadecimal value:\n");
					hex1=scanner.nextLine();
					hex1.toLowerCase(); //Lowercases value 1, just to simplify things
					System.out.println("Enter second hexadecimal value:\n");
					hex2=scanner.nextLine();
					hex2.toLowerCase(); //Lowercases value 2, just to simplify things
					if (hex1.matches("^[a-f0-9]+$") ){ //If first char array contains these values, then execute the function 
						if (hex2.matches("^[a-f0-9]+$") ){ //If second char array contains these values, then execute the function 
							hex_result=hex_sum(hex1,hex2);
							System.out.println("Result is:" + hex_result);
						} else {
							System.out.println("Second hexadecimal number is not valid.");
						}
					} else {
						System.out.println("First hexadecimal number is not valid.");
					}
					break;
				case "4":
					System.out.println("Enter first hexadecimal value:\n");
					hex1=scanner.nextLine();
					hex1.toLowerCase(); //Lowercases value 1, just to simplify things
					System.out.println("Enter second hexadecimal value:\n");
					hex2=scanner.nextLine();
					hex2.toLowerCase(); //Lowercases value 2, just to simplify things
					if (hex1.matches("^[a-f0-9]+$") ){ //If first char array contains these values, then execute the function 
						if (hex2.matches("^[a-f0-9]+$") ){ //If second char array contains these values, then execute the function 
							hex_result=hex_mult(hex1,hex2);
							System.out.println("Result is:" + hex_result);
						} else {
							System.out.println("Second hexadecimal number is not valid.");
						}
					} else {
						System.out.println("First hexadecimal number is not valid.");
					}
					break;
			}
		}while(!option.equals("0")); //Terminates the program when option 0 is received
	}
}