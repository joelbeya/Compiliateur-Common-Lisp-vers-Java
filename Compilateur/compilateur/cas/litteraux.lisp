;; Compilation de littéraux.

(defun compilation-const (exp)
  (list (concatenate 'string "ldc " (write-to-string exp))))

(defun compilation-varg (exp)
  (list (concatenate 'string "iload 0")))

(defun compilation-litt (exp env fenv nomf)
  (let ((var (assoc exp env)))
    (cond ((not (null var))
    (if (eql (cadr var) 'loc) (if (numberp (cadr var))
	    (compilation-const (cdr var)))))
     ((and (symbolp exp) (not (null exp))) (compilation-varg exp))
     (t (compilation-const exp)))))
