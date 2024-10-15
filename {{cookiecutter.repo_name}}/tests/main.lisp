(defpackage :{{ cookiecutter.project_name }}-tests/tests/main
  (:use :common-lisp
        :fiveam
        :{{ cookiecutter.project_name }}/src/main))
(in-package :{{ cookiecutter.project_name }}-tests/tests/main)

;; C-c C-c will compile a test function, but that doesn't normally
;; trigger the test to run.  Setting this var to true makes the test
;; fire when I compile it.  However, it appears you don't want this
;; set during initial compilation. -- it causes compile failure.
;; (setf fiveam:*run-test-when-defined* t)
;;
;; We can also set these to add in debugging
;; (setf fiveam:*on-failure* :debug)
;; (setf fiveam:*on-error* :debug)

(defun substringp (needle haystack &key (test 'char=))
  "Returns the index of the first occurrence of the string designated
by NEEDLE within the string designated by HAYSTACK, or NIL if it does
not occur.  Characters within the string are compared by TEST, which
defaults to CHAR= (for case-sensitive comparison).

From https://stackoverflow.com/questions/34620352/function-which-verifies-if-a-string-is-includes-in-an-other-one-in-lisp"
  (search (string needle)
          (string haystack)
          :test test))

;; CLI tests don't get run from the commandline, so instead, do
;; something like (5am:run! 'cli) or (5am:run-all-tests)
(def-suite* cli
  :description "CLI interface tests")

(test help
  "Test that basic clingon help functionality works."
  (is (not (eq nil 
  (let ((help-msg (with-output-to-string (*standard-output*) (%main "--help")) ))
    (substringp "USAGE:" help-msg)
    )
  ))))


;; We're putting our non-cli tests in a separate test suite because
;; the CLI tests redirect stdout, which messes with running those
;; tests from the CLI using dosh.  So now from the CLI, we run
;; everything except the CLI tests.
(def-suite* testmain
  :description "Main test suite")

(test test1
  (is (= (+ 1 1)
         2)))
