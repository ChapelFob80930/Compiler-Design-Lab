Enter an arithmetic expression:
10-(4/2)*3
Stack: NUMBER 
Input: 10
Action: Shift NUMBER
----------------------------
Stack: NUMBER NUMBER 
Input: 4
Action: Shift NUMBER
----------------------------
Stack: NUMBER NUMBER NUMBER 
Input: 2
Action: Shift NUMBER
----------------------------
Stack: NUMBER expr 
Input: /
Action: Reduce by expr -> expr / expr
----------------------------
Stack: NUMBER expr 
Input: (expr)
Action: Reduce by expr -> (expr)
----------------------------
Stack: NUMBER expr NUMBER 
Input: 3
Action: Shift NUMBER
----------------------------
Stack: NUMBER expr 
Input: *
Action: Reduce by expr -> expr * expr
----------------------------
Stack: expr 
Input: -
Action: Reduce by expr -> expr - expr
----------------------------
Result: 4

