;; Compilation des déclarations de variables.

(defun compilation-setf (exp env fenv nomf)
  (if (null exp) ()
    (append (compilation (cadr exp) env fenv nomf)
	    (let ((var (assoc (car exp) env)))
	      (if var
		  (if (eql (cadr exp) 'ldc) )
		)
	      )
	    (compilation-setf (cddr exp) env fenv nomf))
    )
  )

(defun compilation-let (exp env fenv nomf)
  (let ((nivem (assoc nomf fenv)))
    (append (compilation-local (car exp) env fenv nomf)
	    (compilation (cadr exp) (local-env (car exp) env 1 (cadr nivem)) fenv nomf)
	    (depile-local (car exp) env fenv nomf))
    )
  )

(defun compilation-local (exp env fenv nomf)
  (if (null exp)
      ()
    (append (compilation (cadar exp) env fenv nomf)
	    (compilation-local (cdr exp) env fenv nomf ))
    )
  )

(defun depile-local (exp env fenv nomf)
  (if (null exp)
      ()
    (append (depile-local (cdr exp) env fenv nomf))
    )
  )

(defun local-env (exp env dep nivem)
  (if (atom exp)
      env
    (local-env (cdr exp) (cons (cons (caar exp) `(LDC ,dep ,nivem)) env) (+ 1 dep) nivem)
    )
  )
