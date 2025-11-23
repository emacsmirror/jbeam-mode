;;; jbeam-mode.el --- Major mode for JBeam files -*- lexical-binding: t; -*-
;;
;; Author: August Johansson
;; URL: https://github.com/webdevred/jbeam-mode
;; Version: 0.1
;; Keywords: languages
;; Package-Requires: ((emacs "24.4"))
;;
;; This file is NOT part of GNU Emacs.
;;
;; Copyright 2025 August Johansson
;;
;;   Licensed under the Apache License, Version 2.0 (the "License");
;;   you may not use this file except in compliance with the License.
;;   You may obtain a copy of the License at
;;
;;       http://www.apache.org/licenses/LICENSE-2.0
;;
;;   Unless required by applicable law or agreed to in writing, software
;;   distributed under the License is distributed on an "AS IS" BASIS,
;;   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;;   See the License for the specific language governing permissions and
;;   limitations under the License.
;;
;;; Commentary:
;;
;; This package provides a major mode `jbeam-mode` for editing
;; JBeam configuration files used in BeamNG.drive.
;;
;; Features:
;; - Syntax highlighting
;; - Comment handling
;;
;; To enable automatically:
;;   (require 'jbeam-mode)
;;   ;; or via auto-mode-alist
;;   (add-to-list 'auto-mode-alist '("\\.jbeam\\'" . jbeam-mode))
;;; Code:

(defvar jbeam-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?/ ". 124b" st)
    (modify-syntax-entry ?* ". 23" st)
    (modify-syntax-entry ?\n "> b" st)
    (modify-syntax-entry ?\" "\"" st)
    (modify-syntax-entry ?: "." st)
    st)
  "Syntax table for `jbeam-mode'.")

(defvar jbeam-font-lock-keywords
  `(
    ("\"\\([A-Za-z0-9_]+\\)\"\\s-*:" 1 font-lock-keyword-face)

    ("\\b[0-9]+\\(\\.[0-9]+\\)?\\b" . font-lock-constant-face)

    ("\\b\\(true\\|false\\)\\b" . font-lock-constant-face)

    ("[{}\\[\\]]" . font-lock-builtin-face)

    ("//.*$" . font-lock-comment-face))
  "Highlighting for `jbeam-mode'.")

;;;###autoload
(define-derived-mode jbeam-mode prog-mode "JBeam"
  "Major mode for editing JBeam files."
  :syntax-table jbeam-mode-syntax-table
  (setq-local font-lock-defaults '(jbeam-font-lock-keywords)))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.jbeam\\'" . jbeam-mode))


(with-eval-after-load 'markdown-mode
  (add-to-list 'markdown-code-lang-modes '("jbeam" . jbeam-mode)))

(provide 'jbeam-mode)
;;; jbeam-mode.el ends here
