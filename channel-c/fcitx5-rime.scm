(use-modules (guix packages))
(use-modules (guix download))
(use-modules (guix git-download))
(use-modules (guix build-system cmake))
(use-modules (guix build-system copy))
(use-modules ((guix licenses) #:prefix license:))
(use-modules (gnu packages boost))
(use-modules (gnu packages curl))
(use-modules (gnu packages datastructures))
(use-modules (gnu packages enchant))
(use-modules (gnu packages fcitx5))
(use-modules (gnu packages freedesktop))
(use-modules (gnu packages gcc))
(use-modules (gnu packages gettext))
(use-modules (gnu packages glib))
(use-modules (gnu packages gtk))
(use-modules (gnu packages ibus))
(use-modules (gnu packages iso-codes))
(use-modules (gnu packages kde-frameworks))
(use-modules (gnu packages libevent))
(use-modules (gnu packages linux))
(use-modules (gnu packages lua))
(use-modules (gnu packages pkg-config))
(use-modules (gnu packages pretty-print))
(use-modules (gnu packages python))
(use-modules (gnu packages qt))
(use-modules (gnu packages textutils))
(use-modules (gnu packages unicode))
(use-modules (gnu packages web))
(use-modules (gnu packages xdisorg))
(use-modules (gnu packages xml))
(use-modules (gnu packages xorg))

(define-public fcitx5-rime
  (package
   (name "fcitx5-rime")
   (version "5.0.2")
   (source
    (origin
     (method url-fetch)
     (uri (string-append
           "https://download.fcitx-im.org/fcitx5/fcitx5-rime/fcitx5-rime-"
           version ".tar.xz"))
     (sha256
      (base32 "0x0cdnqrr5pldmgh2vx2aklhx008xvazjrwywbajk4dfkwf1da89"))))
   (build-system cmake-build-system)
   (arguments
    `(#:tests? #f                      ;No test
      #:configure-flags
      (list (string-append "-DRIME_DATA_DIR="
                           (assoc-ref %build-inputs "rime-data")
                           "/share/rime-data"))))
   (inputs
    `(("fcitx5" ,fcitx5)
      ("gettext" ,gettext-minimal)
      ("librime" ,librime)
      ("rime-data" ,rime-data)))
   (native-inputs
    `(("extra-cmake-modules" ,extra-cmake-modules)
      ("pkg-config" ,pkg-config)))
   (home-page "https://github.com/fcitx/fcitx5-rime")
   (synopsis "Rime support for Fcitx 5")
   (description "Fcitx5-lua allows writing Fcitx5 extension in Lua.")
   (license license:lgpl2.1+)))

fcitx5-rime
