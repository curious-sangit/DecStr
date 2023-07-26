#DECSTR Function (Code, Text)  
Decreases a positive number or increase a negative number inside a string by one (1).  
NewString := DecStr(String)  

# Parameters
String  
Type: Text constant or code  
The string that you want to increase or decrease.  

# Remarks
If String contains more than one number, then only the number closest to the end of the string is changed. For example, 'A10B20' is changed to 'A10B19' and 'a12b12c' to 'a12b11c'.  
If String contains a negative number, then it is increased by one. For example, '-55' is changed to '-54'.
