
(load "{{ cookiecutter.project_name}}.asd")
(load "{{ cookiecutter.project_name}}-tests.asd")

(ql:quickload "{{ cookiecutter.project_name}}-tests")

(in-package :{{ cookiecutter.project_name}}-tests/tests/main)

(uiop:quit (if (5am:run! 'testmain) 0 1)) 
;(uiop:quit (if (run-all-tests) 0 1))
