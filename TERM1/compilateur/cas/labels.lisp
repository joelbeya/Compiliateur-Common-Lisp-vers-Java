;; Compilation des labels.

(defun compilation-labels (exp env fenv nomf)
  (let ((nivem (assoc nomf fenv)) (corps (gensym "CORPS")))
    (append `((JMP (@ ,corps)))
	    (compilation-faux (car exp) env (fun-env (car exp) fenv (+ 1 (cadr nivem)) ) nomf)
	    `((@ ,corps))
	    (compilation (cadr exp) env (fun-env (car exp) fenv (+ 1 (cadr nivem)) ) nomf))
    )
  ) 

(defun compilation-faux (exp env fenv nomf)
  (if (null exp) 
      ()
    (let ((nivem (assoc (caar exp) fenv)))
      (append '((FENTRY))
	      `((@ ,(caar exp)))
	      (compilation (caddar exp)  (param-env (cadar exp) env 1 (cadr nivem) ) fenv (caar exp))
	      '((RTN))
	      '((FEXIT))
	      (compilation-faux (cdr exp) env fenv nomf))
      )
    )
  )