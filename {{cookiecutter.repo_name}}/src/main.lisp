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
    :long-name "verbose"
    :initial-value nil
    :env-vars '("{{ cookiecutter.project_name | upper }}-VERBOSE")
    :key :verbose)
   (clingon:make-option
    :string
    :description "Path to config file"
    :long-name "config"
    :env-vars '("{{ cookiecutter.project_name | upper }}-CONFIG-PATH")
    :initial-value "/etc/{{ cookiecutter.project_name }}/config.toml"
    :key :config)

   (clingon:make-option
     :choice
     :description "log level"
     :long-name "log-level"
     :env-vars '("{{ cookiecutter.project_name | upper }}-LOG-LEVEL")
     :items '("info" "warn" "error" "debug")
     :key :log-level)
   ))

(declaim (ftype (function(clingon.command:command)) cli/handler))
(defun cli/handler (cmd)
  "The top-level handler"
  (let ((args      (clingon:command-arguments cmd))
	(config-fname (clingon:getopt cmd :config))
        (verbose   (clingon:getopt cmd :verbose)))
    (declare (ignorable args verbose))
    (when (null args)
      (clingon:print-usage-and-exit cmd t))
    ;; insert commands here
    (write-line "Add code here")
    (format t "Command: ~S~%" cmd)
    (format t "Config fname: ~S~%" config-fname)
    (format t "Args: ~S~%" args)
    (format t "Verbose: ~B~%" verbose)
  ))
    
(declaim (ftype (function () clingon.command:command) cli/command))
(defun cli/command ()
  (clingon:make-command
   :name "{{ cookiecutter.project_name }}"
   :description "{{ cookiecutter.description }}"
   :version "{{ cookiecutter.version }}"
   :license "{{ cookiecutter.licence }}"
   :authors '("{{ cookiecutter.author }} <{{ cookiecutter.email }}>")
   :usage "[OPTIONS]"
   :options (cli/options)
   :handler #'cli/handler
   :sub-commands (list (listen/command))))

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
