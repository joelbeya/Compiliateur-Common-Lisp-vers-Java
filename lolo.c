#include <stdio.h>

int main(int argc, char const *argv[]) {
  int i = 2, j = 2;
  while (i + 1 ? --i : ++j) {
    printf("%d\n", i);
  }
  return 0;
}

(load "go.lisp")

(make-machine)

(compilation '(defun fact (n) (if (<= n 1) 1 (* n (fact (- n 1))))))

(car exp) => FACT
(cddr exp) => (if (<= n 1) 1 (* n (fact (- n 1))))
(cadr exp) => (n)

(compilation '(defun fact (n) (if (<= n 1) 1 (* n (fact (- n 1))))))

(compilation '(defun fibo (n) (if (< n 2) n (+ (fibo (- n 1)) (fibo (- n 2))))))
(.CLASS PUBLIC FACT .SUPER JAVA/LANG/OBJECT .METHOD PUBLIC STATIC
 FACT (I) I .LIMIT LOCAL 1 .LIMIT STACK 3 (PUSH :R0)
 (MOVE (:DIESE 1) :R0) (PUSH :R0) (POP :R0) (POP :R1)
 (CMP :R1 :R0) (MOVE (:DIESE T) :R0) (JLE (@ #:|finTest3351|))
 (MOVE (:DIESE NIL) :R0) (@ #:|finTest3351|)
 (CMP :R0 (:DIESE NIL)) (JEQ (@ #:|sinon3349|))
 (MOVE (:DIESE 1) :R0) (JMP (@ #:|finSi3350|)) (@ #:|sinon3349|)
 (PUSH :R0) (PUSH :R0) (MOVE (:DIESE 1) :R0) (PUSH :R0) (POP :R1)
 (POP :R0) (SUB :R1 :R0) (PUSH :R0) (PUSH (:DIESE 1))
 (MOVE :FP :R1) (MOVE :SP :FP) (MOVE :SP :R2) (SUB (:DIESE 1) :R2)
 (SUB (:DIESE 1) :R2) (PUSH :R2) (PUSH :R1) (PUSH (:DIESE 0))
 (JSR (@ FACT)) (PUSH :R0) (POP :R1) (POP :R0) (MULT :R1 :R0)

 (@ #:|finSi3350|) IRETURN .END METHOD)



 (.CLASS PUBLIC FACT .SUPER JAVA/LANG/OBJECT .METHOD PUBLIC STATIC
 FACT (I) I .LIMIT LOCAL 1 .LIMIT STACK 3 (MOVE (LOC -1 0) :R0)
 (PUSH :R0) (MOVE (:DIESE 1) :R0) (PUSH :R0) (POP :R0) (POP :R1)
 (CMP :R1 :R0) (MOVE (:DIESE T) :R0) (JLE (@ #:|finTest3331|))
 (MOVE (:DIESE NIL) :R0) (@ #:|finTest3331|)
 (CMP :R0 (:DIESE NIL)) (JEQ (@ #:|sinon3329|))
 (MOVE (:DIESE 1) :R0) (JMP (@ #:|finSi3330|)) (@ #:|sinon3329|)
 (MOVE (LOC -1 0) :R0) (PUSH :R0) (MOVE (LOC -1 0) :R0) (PUSH :R0)
 (MOVE (:DIESE 1) :R0) (PUSH :R0) (POP :R1) (POP :R0)
 (SUB :R1 :R0) (PUSH :R0) (PUSH (:DIESE 1)) (MOVE :FP :R1)
 (MOVE :SP :FP) (MOVE :SP :R2) (SUB (:DIESE 1) :R2)
 (SUB (:DIESE 1) :R2) (PUSH :R2) (PUSH :R1) (PUSH (:DIESE 0))
 (JSR (@ FACT)) (PUSH :R0) (POP :R1) (POP :R0) (MULT :R1 :R0)

 (@ #:|finSi3330|) IRETURN .END METHOD)
