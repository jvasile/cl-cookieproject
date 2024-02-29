(defpackage :{{ cookiecutter.project_name }}-tests/tests/main
  (:use :common-lisp
        :fiveam
        :{{ cookiecutter.project_name }}/src/main))
(in-package :{{ cookiecutter.project_name }}-tests/tests/main)

;; Define your project tests here...

(def-suite testmain
    :description "test suite 1")

(in-suite testmain)

(test test1
  (is (= (+ 1 1)
         3)))
