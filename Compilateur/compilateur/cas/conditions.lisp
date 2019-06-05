;; Compilation de structures de condition.

(defun compilation-if (exp env fenv nomf)
  (let ((sinon (gensym "sinon")) (finSi (gensym "finSi")))
  (append (compilation (car exp) env fenv nomf)
	    (compilation (cadr exp) env fenv nomf) (list "ireturn ")
      (list "false:") (compilation (caddr exp) env fenv nomf) (list "ireturn"))))

(defun compilation-cond (exp etiqfin env fenv nomf)
  (if (null exp) () (let ((etiqcond (gensym "etiqcond")))
      (append (compilation (caar exp) env fenv nomf)
	      (compilation (cadar exp) env fenv nomf)
	      (compilation-cond (cdr exp) etiqfin env fenv nomf)))))
