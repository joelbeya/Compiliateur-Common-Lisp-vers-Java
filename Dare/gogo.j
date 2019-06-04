(defun write-list-to-file-iterate (mylist destination)
  (with-open-file (str destination
                       :direction :output
                       :if-exists :append
                       :if-does-not-exist :create)
    (dolist (el mylist)
      (format str "~S~%" el))))


(write-list-to-file-iterate (compilation '(defun fact (n) (if (<= n 1) 1 (* n (fact (- n 1)))))) "fact.lisp")
