(uiop:define-package :{{ cookiecutter.project_name }}/src/main
  (:use :cl)
  (:import-from :clingon)
  (:export :main))
(in-package :{{ cookiecutter.project_name }}/src/main)

;; We use these for type checking
(defun clingon/option-list-p (list)
  (every (lambda (item) (typep item 'clingon:option)) list))
(deftype clingon/option-list-t ()
  `(satisfies clingon/option-list-p))


(declaim (ftype (function () (clingon/option-list-t)) cli/options))
(defun cli/options ()
  "Returns a list of options for our main command"
  (list
   (clingon:make-option
    :flag
    :description "verbose"
    :short-name #\v
    :initial-value nil
    :key :verbose)
   ))

(declaim (ftype (function(clingon.command:command)) cli/handler))
(defun cli/handler (cmd)
  "The top-level handler"
  (let ((args      (clingon:command-arguments cmd))
        (verbose   (clingon:getopt cmd :verbose)))
    (declare (ignorable args verbose))
    (when (null args)
      (clingon:print-usage-and-exit cmd t))
    ;; insert commands here
    (write-line "Add code here")
  ))
    
(declaim (ftype (function () clingon.command:command) cli/command))
(defun cli/command ()
  (clingon:make-command
   :name "{{ cookiecutter.project_name }}"
   :description "{{ cookiecutter.description }}"
   :version "{{ cookiecutter.version }}"
   :license "All rights reserved"
   :authors '("{{ cookiecutter.author }} <{{ cookiecutter.email }}>")
   :usage "[OPTIONS]"
   :options (cli/options)
   :handler #'cli/handler))

(declaim (ftype (function (&rest string)) %main))
(defun %main (&rest argv)
  (setf clingon:*default-help-flag*
    (clingon:make-option 
     :flag
     :description "display usage information and exit"
     :long-name "help"
     :short-name #\h
     :key :clingon.help.flag))
    (clingon:run (cli/command) argv))
        
(defun main ()
  "Entry point for the executable.
  Reads command line arguments."
  ;; uiop:command-line-arguments returns a list of arguments (sans the script name).
  ;; We defer the work of parsing to %main because we call it also from the Roswell script.
  (apply #'%main (uiop:command-line-arguments)))
