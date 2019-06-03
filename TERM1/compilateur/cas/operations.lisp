;; Compilation d'opérations arithmétiques

(defun compilation-op (exp env fenv nomf)
  "Documentation for compilation-op."
  (let ((op (car exp)) (arg (cdr exp)))
    (if (null (cddr arg))
      (concatenate 'string
        (compilation (car arg) env fenv nomf)
        (compilation (cadr arg) env fenv nomf)
        (case op
          ('+ " iadd")
          ('- " isub")
          ('* " imult")
          ('/ " idiv")))
      (concatenate 'string
        (compilation `(,op ,(list op (car arg) (cadr arg)) ,@(cddr arg)) env fenv nomf))
    )
  )
)
