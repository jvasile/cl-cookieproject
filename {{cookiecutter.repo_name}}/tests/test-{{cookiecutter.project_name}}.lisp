(defpackage :{{ cookiecutter.project_name }}-tests/tests/{{ cookiecutter.project_name }}-tests
  (:use :common-lisp
        :fiveam
        :{{ cookiecutter.project_name }}))
(in-package :{{ cookiecutter.project_name }}-tests/tests/{{ cookiecutter.project_name }}-tests)

;; Define your project tests here...

(def-suite testmain
    :description "test suite 1")

(in-suite testmain)

(test test1
  (is (= (+ 1 1)
         3)))
