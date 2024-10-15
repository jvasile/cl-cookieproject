(in-package :{{ cookiecutter.project_name }}/src/main)

(declaim (ftype (function () (clingon/option-list-t)) listen/options))
(defun listen/options ()
  "Return a list of options for the `listen` command"
  (list
   (clingon:make-option
    :integer
    :description "port to listen on"
    :short-name #\p
    :long-name "port"
    :initial-value 4949
    :env-vars '("{{ cookiecutter.project_name | upper }}-LISTEN-PORT")
    :key :port)
   ))

(declaim (ftype (function(clingon.command:command)) listen/handler))
(defun listen/handler (cmd)
  "The handler for the `listen` command"
  (let ((args (mapcar #'string-upcase (clingon:command-arguments cmd)))
        (port (clingon:getopt cmd :port))) ;; <- a global option
    (format t "HEY, ~d!~%" port)
    (format t "~A!~%" (clingon:join-list args #\Space))))

(declaim (ftype (function () clingon.command:command) listen/command))
(defun listen/command ()
  "Returns a command which SHOUTS back anything we write on the command-line"
  (clingon:make-command
   :name "listen"
   :description "Starts org-roam listening for connections"
   :usage "[options] [arguments ...]"
   :options (listen/options)
   :handler #'listen/handler))

