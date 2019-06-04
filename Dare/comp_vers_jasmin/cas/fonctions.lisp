;; Compilation de fonctions.

(defun compilation-defun (exp env fenv nomf)
  (let ((nivem (assoc nomf fenv)))
    (append
    '(.class public)
    (list (car exp))
    '(.super java/lang/Object)
    '(.method public static)
    (list (car exp))
    '((I)I)
    '(.limit local 1)
    '(.limit stack 3)
    (compilation-progn (cddr exp)
		       (param-env (cadr exp) env 1 (if nivem (+ 1 (cadr nivem)) 0))
		       (fun-env (list exp) fenv (if nivem (+ 1 (cadr nivem)) 0))
		       (car exp))
    '(ireturn)
    '(.end method))
    )
  )

  (defun param-env (exp env dep nivem)
    (if (atom exp)
      env
      '(iload 0)
    )
  )