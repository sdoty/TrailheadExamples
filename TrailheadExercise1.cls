/* this isn't actually code, just snippets that I created to test
certain examples in Trailhead and Udemy
*/


Integer firstNum=(50*2);
Integer secNum=(133*4);
Integer thirdNum=56;
System.debug('First Number is '+firstNum);
System.debug('secNum is '+secNum);
System.debug('thirdNum is '+thirdNum);
System.debug('total is '+firstNum+secNum+thirdNum );
System.debug('total is '+(firstNum+secNum+thirdNum ));

Date nowDate = Date.today();
system.debug('today is '+nowDate);
Date date1 = Date.newInstance(1967, 6,17);
Date date2 = Date.today();
Integer ageDate = date1.daysBetween(date2);
System.debug('Days on planet are '+ageDate);
Integer monthsDate = date1.monthsBetween(date2);
System.debug('Months on planet are '+monthsDate);
    

Datetime myDatetime = Datetime.newInstance(2019, 5, 27, 15,14, 32);
String myDateString=myDatetime.format();
System.debug('make this work. ' +myDateString);
    
String s1= ('shelley');
String s2= ('doty');
System.debug('?' +s1+s2);

Date date1 = Date.today();
System.debug('today is '+today);
