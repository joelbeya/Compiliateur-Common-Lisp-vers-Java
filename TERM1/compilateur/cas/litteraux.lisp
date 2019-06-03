;; Compilation de littéraux.

(defun compilation-const (exp)
  (concatenate 'string
    " ldc "
    (write-to-string exp))
)

(defun compilation-varg (exp)
  (concatenate 'string
    " aload "
    (write-to-string exp)
  )
)

(defun compilation-litt (exp env fenv nomf)
  (let ((var (assoc exp env)))
    (cond
     ((not (null var))
      (if (eql (cadr var) 'loc)
	  `((MOVE ,(cdr var) :R0))
	(if (numberp (cadr var))
	    (compilation-const (cdr var)))
	)
      )
     ((and (symbolp exp) (not (null exp))) (compilation-varg exp))
     (t (compilation-const exp))
     )
    )
  )
