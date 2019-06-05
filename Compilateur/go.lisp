(require "compilateur/compilateur.lisp")
(format t "~%***** Composant compilateur chargé.~%~%")

(defun run-express (mv code &optional (code-bis ()))
  (if (not (null code-bis)) (load-machine mv (compilation code-bis)))
  (load-machine mv (compilation code))
  (run-machine mv)
  )
  (defun comp-in-file (mylist destination)
    (with-open-file (str destination
                         :direction :output
                         :if-exists :overwrite
                         :if-does-not-exist :create)
      (dolist (el mylist)
        (format str "~A~%" el))))


;(comp-in-file (compilation '(defun fact (n) (if (<= n 1) 1 (* n (fact (- n 1)))))) "Fact.j")
;(comp-in-file (compilation '(defun fibo (n) (if (< n 2) n (+ (fibo (- n 1)) (fibo (- n 2))))) "Fibo.j")
