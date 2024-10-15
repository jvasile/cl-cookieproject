(defpackage {{ cookiecutter.project_name }}-system
  (:use :common-lisp :asdf))

(in-package :{{ cookiecutter.project_name }}-system)

(defsystem "{{ cookiecutter.project_name }}"
  :author "{{ cookiecutter.author }} <{{ cookiecutter.email }}>"
  :version "{{ cookiecutter.version }}"
  :license "{{ cookiecutter.licence }}"
  :description "{{ cookiecutter.description }}"
  :homepage ""
  :bug-tracker ""
  :source-control (:git "")

  :class :package-inferred-system

  ;; Dependencies.
  :depends-on ("{{ cookiecutter.project_name }}/src/main")

  :components ((:file "src/main"))

  ;; Build a binary:
  ;; don't change this line.
  :build-operation "program-op"
  ;; binary name: adapt.
  :build-pathname "{{ cookiecutter.project_name }}"
  ;; entry point: here "main" is an exported symbol. Otherwise, use a double ::
  :entry-point "{{ cookiecutter.project_name}}/src/main:main")
