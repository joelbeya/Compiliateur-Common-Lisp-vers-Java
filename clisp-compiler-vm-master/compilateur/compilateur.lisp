(require "compilateur/fonctions.lisp")
(require "compilateur/cas.lisp")

;; Fonctions de lancement du compilateur LISP -> ASM.

(defun compilation (exp &optional (env ()) (fenv ())  (nomf ()) )
  (let ((arg (if (atom exp) () (cdr exp))))
    (cond
     ((atom exp) (compilation-litt exp env fenv nomf))
     ((member (car exp) '(+ - * /)) (compilation-op exp env fenv nomf))
     ((member (car exp) '(< > = <= >= )) (compilation-comp exp env fenv nomf))
     ((est-cas exp 'and) (compilation-and arg (gensym "finAnd") env fenv nomf))
     ((est-cas exp 'or) (compilation-or arg (gensym "finOr") env fenv nomf))
     ((est-cas exp 'if) (compilation-if arg env fenv nomf))
     ((est-cas exp 'cond) (compilation-cond arg (gensym "fincond") env fenv nomf))
     ((est-cas exp 'progn) (compilation-progn arg env fenv nomf))
     ((est-cas exp 'loop) (compilation-boucle arg env fenv nomf))
     ((est-cas exp 'setf) (compilation-setf arg env fenv nomf))
     ((est-cas exp 'defun) (compilation-defun arg env fenv nomf))
     ((est-cas exp 'let ) (compilation-let arg env fenv nomf))
     ((est-cas exp 'labels) (compilation-labels arg env fenv nomf))
     ((and (consp (car exp)) (eql (caar exp) 'lambda)) (compilation-lambda exp env fenv nomf))
     (`(function ,(car exp)) (compilation-appel exp env fenv nomf))
    )
  )
)

(defun write-to-file (name (compilation code))
  (with-open-file (stream  name :external-format charset:iso-8859-1
                         :direction :output
                         :if-exists :overwrite
                         :if-does-not-exist :create )
  (format stream content))
  name)
