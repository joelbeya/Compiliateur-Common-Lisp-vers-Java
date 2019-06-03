;; Compilation d'opérateurs de comparaison.

(defun compilation-comp (exp env fenv nomf)
  "Documentation for compilation-comp."
  (let ((op (car exp)))
    (concatenate 'string
      (compilation (cadr exp) env fenv nomf)
      (compilation (caddr exp) env fenv nomf)
      (case op
        ('= " if_icmpeq ")
        ('< " if_icmpge ")
        ('> " if_icmple ")
        ('<= " if_icmpgt ")
        ('>= " if_icmplt ")
      )
      "recursivecall ireturn"
      )
    )
  )


(defun compilation-and (exp etiqfin env fenv nomf)
  (if (null exp)
      (append '((MOVE (:DIESE T) :R0)) `((@ ,etiqfin)))
    (append (compilation (car exp) env fenv nomf)
	    '((CMP :R0 (:DIESE T)))
	    `((JNE (@ ,etiqfin)))
	    (compilation-and (cdr exp) etiqfin env fenv nomf))
    )
  )

(defun compilation-or (exp etiqfin env fenv nomf)
  (if (null exp)
      (append '((MOVE (:DIESE NIL) :R0)) `((@ ,etiqfin)))
    (append (compilation (car exp) env fenv nomf)
	    '((CMP :R0 (:DIESE T)))
	    `((JEQ (@ ,etiqfin)))
	    (compilation-or (cdr exp) etiqfin env fenv nomf))
    )
  )
