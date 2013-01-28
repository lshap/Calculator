Calculator
Lauren Shapiro

I will use the Shunting Yard algorithm to parse a string in infix notation into reverse polish notation. The method that does this conversion will take in the input string and return a list of mathematical tokens. Tokens include numbers (decimals included) and infix operators such as +, -, *, /. Finally I'll write a method to parse the RPN token list into a number result. This method will take in the RPN list of tokens, will need a local stack to keep track of the operations and it will return a number value that is the result of the inputted mathematical expression.

There will be a Token interface extended by two classes, Num, and InfixOp. The two main methods will have the following signatures:

public List<Token> ShuntingYard(string s){...}
public double Calculate(List<Token>){...}