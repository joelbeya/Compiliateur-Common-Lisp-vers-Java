;; Compilation des labels.

(defun compilation-labels (exp env fenv nomf)
  (let ((nivem (assoc nomf fenv)) (corps (gensym "CORPS")))
    (append
	    (compilation-faux (car exp) env (fun-env (car exp) fenv (+ 1 (cadr nivem)) ) nomf)
	    (compilation (cadr exp) env (fun-env (car exp) fenv (+ 1 (cadr nivem)) ) nomf))
    )
  )

(defun compilation-faux (exp env fenv nomf)
  (if (null exp)
      ()
    (let ((nivem (assoc (caar exp) fenv)))
      (append 
	      (compilation (caddar exp)  (param-env (cadar exp) env 1 (cadr nivem) ) fenv (caar exp))
	      (compilation-faux (cdr exp) env fenv nomf))
      )
    )
  )
