;; Compilation d'opérations arithmétiques

(defun compilation-op (exp env fenv nomf)
  (let ((op (car exp)) (arg (cdr exp)))
    (if (null (cddr arg)) (append (compilation (car arg) env fenv nomf)
		(compilation (cadr arg) env fenv nomf) (case op
		  ('+ (list "iadd")) ('- (list "isub"))
		  ('* (list "imul")) ('/ (list "idiv"))))
      (append (compilation  `(,op ,(list op (car arg)
       (cadr arg)) ,@(cddr arg)) env fenv nomf))
      )
    )
  )
