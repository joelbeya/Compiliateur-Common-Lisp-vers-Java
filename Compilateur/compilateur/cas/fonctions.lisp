(defun list-to-string (lst)
  (format nil "~{~A~}" lst))

(defun concatString (list)
  (if (listp list)
    (with-output-to-string (s)
      (dolist (item list)
        (if (stringp item)
          (format s "~a" item))))))
;; Compilation de fonctions.

(defun compilation-defun (exp env fenv nomf)
  (let ((nivem (assoc nomf fenv))) (append (list (concatenate 'string ".class public "
    (string-capitalize (list-to-string (list (car exp)))))) (list ".super java/lang/Object" )
    (list (concatenate 'string ".method public static "
    (string-downcase (list-to-string (list (car exp)))) "(I)I")) (list ".limit locals 1")
    (list ".limit stack 3") (compilation-progn (cddr exp)
		       (param-env (cadr exp) env 1 (if nivem (+ 1 (cadr nivem)) 0))
		       (fun-env (list exp) fenv (if nivem (+ 1 (cadr nivem)) 0)) (car exp))
    (list "ireturn") (list ".end method") (list ".method public static print(I)V")
    (list ".limit locals 1") (list ".limit stack 2")
    (list "getstatic java/lang/System.out Ljava/io/PrintStream;") (list "iload 0")
    (list "invokevirtual java/io/PrintStream/println(I)V") (list "return")
    (list ".end method") (list ".method public static  main([Ljava/lang/String;)V")
    (list ".limit locals 1") (list ".limit stack 3") (list "aload 0") (list "iconst_0")
    (list "aaload") (list "invokestatic java/lang/Integer/parseInt(Ljava/lang/String;)I")
    (list (concatenate 'string "invokestatic "
      (string-capitalize (list-to-string (list (car exp)))) "/"
        (string-downcase (list-to-string (list (car exp)))) "(I)I"))
    (list (concatenate 'string "invokestatic "
      (string-capitalize (list-to-string (list (car exp)))) "/print(I)V"))
    (list "return") (list ".end method"))))

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
  (let ((n (length (cdr exp))) (nivem (assoc (car exp) fenv)))
    (append (compilation-param (cdr exp) env fenv nomf)
    (list (concatenate 'string "invokestatic "
      (string-capitalize (list-to-string (list (car exp)))) "/"
        (string-downcase (list-to-string (list (car exp)))) "(I)I")))))

(defun compilation-param (exp env fenv nomf)
  (if (atom exp) () (append (compilation (car exp) env fenv nomf)
	  (compilation-param (cdr exp) env fenv nomf))))
