;(require "machine/machine.lisp")
;(format t "~%***** Composant machine virtuelle chargé.~%~%")

(require "compilateur/compilateur.lisp")
(format t "~%***** Composant compilateur chargé.~%~%")

(defun run-express (mv code &optional (code-bis ()))
  (if (not (null code-bis)) (load-machine mv (compilation code-bis)))
  (load-machine mv (compilation code))
  (run-machine mv)
  )

  (defun write-list-to-file-iterate (mylist destination)
    (with-open-file (str destination
                         :direction :output
                         :if-exists :append
                         :if-does-not-exist :create)
      (dolist (el mylist)
        (format str "~S~%" el))))


  ;(write-list-to-file-iterate (compilation '(defun fact (n) (if (<= n 1) 1 (* n (fact (- n 1)))))) "Fact.j")
