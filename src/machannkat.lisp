(defpackage :machannkat
  (:use
   :common-lisp))

(in-package :machannkat)

(defparameter *base-dir* (uiop:native-namestring "~/machannkat/"))

(defun init ()
  (ensure-directories-exist *base-dir*))

(defclass project ()
  ((project-type :initarg :type-project 
                 :initform :mixtape
                 :reader project-type)
   (audios :initarg :audios :accessor audios)
   (title :initarg :title :accessor title)))

(defmethod print-object  ((p project) stream)
  (with-slots (project-type title audios) p
    (format stream "#<~a ~a with title ~a and ~a songs>" (type-of p) project-type title (length audios))))
