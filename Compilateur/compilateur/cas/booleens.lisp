;; Compilation d'opérateurs de comparaison.

(defun compilation-comp (exp env fenv nomf)
  (let ((op (car exp)) (fin (gensym "finTest")))
    (append (compilation (cadr exp) env fenv nomf)
	  (compilation (caddr exp) env fenv nomf) (case op
	  ('= (list "if_icmpeq false")) ('< (list "if_icmpge false"))
	  ('> (list "if_icmple false")) ('<= (list "if_icmpgt false"))
	  ('>= (list "if_icmplt false"))))))

(defun compilation-and (exp etiqfin env fenv nomf)
  (if (null exp) ()  (append (compilation (car exp) env fenv nomf)
	  (compilation-and (cdr exp) etiqfin env fenv nomf))))

(defun compilation-or (exp etiqfin env fenv nomf)
  (if (null exp) () (append (compilation (car exp) env fenv nomf)
	  (compilation-or (cdr exp) etiqfin env fenv nomf))))
