### BEYA NTUMBA Joel    N° 215 11 843
### ZORO-BI Zah         N° 215 10 330

# Implémention de la Machine Virtuelle LISP et le compilateu
## Compilateur et machine virtuelle LISP

Ce projet contient un compilateur LISP -> Assembleur Common Lisp et la machine virtuelle exécutant le code assembleur généré en Jasmin.

## Démarrage express

- `(load "go.lisp")` Charge tout le code.
- Exemple : `(compilation '(defun f (x) (+ 1 x)))`

## Arborescence du code source

Racine :

- `go.lisp` charge le code  du compilateur.
- Les répertoires ``/compilateur` et `contient le code du compilateur.

Répertoire compilateur:

- `compilateur.lisp` contient la fonction principale du compilateur ("compilation").
- `cas.lisp` et `/cas` contiennent les différents cas de la compilation.



## Capacités du compilateur

* Les opérations arithmétiques: `+, -, *, /`
* Les opérateurs de comparaison: `=, !=, <, >, <=, >=`
* Les structures de condition: `if` et `cond`
* Les opérateurs booléens: `and`, `or`
* La création de fonctions et lambda-expressions: `defun`, `lambda`
* La déclaration de variables: `setf`, `let`
* Les structures de contrôle: `while`, `until`, `progn`
* La récursivité, double récursivité, récursivité terminale

## Guide d'utilisation

Depuis le répertoire racine, `(load "go.lisp")` charge le code de la machine et celui du compilateur. 

Compilation:

> - `(compilation '(code en lisp))`

Extraction en Jasmin :

> - `(write-list-to-file-iterate (compilation '(code en lisp)) "nom de fichier de sortie")`

> Retourner du code ASM au format de la machine virtuelle.



## Fonctions principales

### Fonction principale du compilateur

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
