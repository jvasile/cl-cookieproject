(in-package :asdf-user)
(defsystem "{{ cookiecutter.project_name }}-tests"
  :description "Test suite for the {{ cookiecutter.project_name }} system"
  :author "{{ cookiecutter.author }} <{{ cookiecutter.email }}>"
  :version "{{ cookiecutter.version }}"
  :license "BSD"
  
  :class :package-inferred-system

  :depends-on (":{{ cookiecutter.project_name }}-tests/tests/{{ cookiecutter.project_name }}-tests")
  
  ;; The following would not return the right exit code on error, but still 0.
  ;; :perform (test-op (op _) (symbol-call :fiveam :run-all-tests))
  )
