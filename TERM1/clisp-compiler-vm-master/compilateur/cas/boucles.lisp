;; Compilation de structures itératives.

(defun compilation-progn (exp env fenv nomf)
  (if (null exp) 
      ()
    (append (compilation (car exp) env fenv nomf) (compilation-progn (cdr exp) env fenv nomf))
    )
  )

(defun compilation-boucle (exp env fenv nomf)
  (case (car exp)
   ('while (compilation-while (cdr exp) env fenv nomf))
    ('until (compilation-until (cdr exp) env fenv nomf))
    )
  )

(defun compilation-while (exp env fenv nomf)
  (let ((fin (gensym "finwhile"))
	(boucle (gensym "while"))) 
    (if (eql (cadr exp) 'do) 
	(append `((@ ,boucle))
		(compilation (car exp) env fenv nomf) 
		`((CMP :R0 (:DIESE nil)))
		`((JEQ (@ ,fin)))
		(compilation (caddr exp) env fenv nomf) 
		`((JMP (@ ,boucle)))
		`((@, fin)))
      (error "Syntaxe incorrecte : ~s" exp)
      )
    )
  )

(defun compilation-until (exp env fenv nomf)  
  (let ((finuntil (gensym "FINUNTIL"))
	(boucle (gensym "UNTIL")))
    (append `((@ ,boucle))
	    (compilation (car exp) env fenv nomf)
	    '((CMP :R0 (:DIESE T)))
	    `((JEQ (@ ,finuntil)))
	    (compilation (caddr exp) env fenv nomf)
	    `((JMP (@ ,boucle)))
	    `((@ ,fin)))
    )
  )