;; Compilation de fonctions.

(defun compilation-defun (exp env fenv nomf)
  (let ((nivem (assoc nomf fenv)))
    (concatenate 'string
    	".class public "
    	(string-capitalize (car exp))
    	" .super /java/lang/Object"
    	" method public static "
    	(string-downcase (car exp))"(I)I "
    	" .limit locals 1"
    	" .limit stack 3"
	    (write-to-string (compilation-progn (cddr exp)
			       (param-env (cadr exp) env 1 (if nivem (+ 1 (cadr nivem)) 0))
			       (fun-env (list exp) fenv (if nivem (+ 1 (cadr nivem)) 0))
			       (car exp)))
    	" return"
    	" .end method"
    )
  )
)

(defun param-env (exp env dep nivem)
    ()
  )

(defun fun-env (exp fenv nivem)
  (if (atom exp)
      fenv
    (fun-env (cdr exp) (cons `(,(caar exp) ,nivem) fenv) nivem)
    )
  )

(defun compilation-appel (exp env fenv nomf)
  (concatenate 'string
    (compilation-param (cdr exp) env fenv nomf)
    " getstatic java/lang/System/out Ljava/io/PrintStream;"
    " ldc \'"
    (car exp)
    "\' invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V"
  )
)

(defun compilation-param (exp env fenv nomf)
  (if (atom exp)
      ()
    (concatenate 'string
      (compilation (car exp) env fenv nomf)
	    (compilation-param (cdr exp) env fenv nomf))
    )
  )

(defun compilation-lambda (exp env fenv nomf)
  (let ((lambdaexpr (gensym "lambdaexpr"))
	(n (length (cdr exp)))
	(nivem (assoc nomf fenv)))
    (append (compilation-param (cdr exp) env fenv nomf)
	    `((PUSH (:DIESE ,n)))
	    `((MOVE :FP :R1))
	    `((MOVE :SP :FP))
	    `((MOVE :SP :R2))
	    `((SUB  (:DIESE ,n) :R2))
	    `((SUB  (:DIESE 1) :R2))
	    `((PUSH :R2))
	    `((PUSH :R1))
	    (if nivem  `((PUSH (:DIESE ,(+ 1 (cadr nivem)))))  `((PUSH (:DIESE ,0))))
	    `((PUSH (:DIESE 0)))
	    (compilation (caddar exp)
			 (param-env (cadar exp) env 1 (if nivem   (+ 1 (cadr nivem)) 0))
			 (fun-env  (list (cons lambdaexpr (cdar exp))) fenv (if nivem (+ 1 (cadr nivem)) 0))
			 lambdaexpr)
	    `((MOVE ( 1 :FP) :SP))
	    `((MOVE ( 2 :FP) :FP)))
    )
  )
