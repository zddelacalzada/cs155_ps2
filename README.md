# CS 155 Problem Set 2 Lexical Analyzer Using Flex
**Submitted by Zairra Dela Calzada (Student Number: 2019-05203)**    


To run:
1. Go to directory containing ps2.l and EASY test files
2. Run "flex ps2.l"
3. Run "gcc lex.yy.c -o ps2"
4. Run "./ps2 (name of EASY test file you want to test)"    


For convenience, I have also uploaded the 5 EASY test files provided in UVLE as well as the compiled version and executable file of my code (with list_invert.easy as test file).         


**Token classes:**  
- RESERVED_WORD  
- ARITHMETIC_OPERATOR  
- LOGICAL_OPERATOR  
- RELATIONAL_OPERATOR  
- IDENTIFIER  
- STRING_LITERAL  
- FLOAT  
- INTEGER  
- MOD  
- LOG  
- SPECIAL_CHARACTER  
- OPENING_BRACKET  
- CLOSING_BRACKET  
- ASSIGNMENT  
- WHITESPACE  
