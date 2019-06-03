;; Fonctions de gestion du compilateur.

;; ********** Gestion de l'analyse par cas.

(defun est-cas (exp inst)
  (eql (car exp) inst)
  )
