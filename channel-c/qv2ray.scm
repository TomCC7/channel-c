(define-module (qv2ray)
  #:use-module (gnu packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix build-system qt)
  #:use-module ((guix licenses) #:prefix l:)
  #:use-module (guix modules)
  #:use-module (gnu packages rpc)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages adns)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages regex)
  #:use-module (gnu packages curl))

(define-public qv2ray
  (package
    (name "qv2ray")
    (version "2.7.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/Qv2ray/Qv2ray")
              (commit (string-append "v" version))
              (recursive? #t)))
        (file-name (git-file-name name version))
        (sha256
        (base32 "14rvhv7zk5p7i6vxm33vwdckim80zr4dcscyzqm7rbpkgwcm7wb9"))))
    (build-system qt-build-system)
    (arguments
    `(#:configure-flags '("-DQV2RAY_DISABLE_AUTO_UPDATE=ON"
                          "-DCMAKE_BUILD_TYPE=Release"
                          "-DQV2RAY_BUILD_INFO=Qv2ray for GNU Guix")
      #:tests? #f))
    (native-inputs
      `(("pkg-config" ,pkg-config)
        ("qttools" ,qttools)))
    (inputs
      `(("grpc" ,grpc)
        ("protobuf" ,protobuf)
        ("openssl" ,openssl)
        ("qtbase" ,qtbase-5)
        ("qtsvg" ,qtsvg)
        ("qtdeclarative" ,qtdeclarative) ;unnecessary?
        ("zlib" ,zlib)
        ("c-ares" ,c-ares)
        ("abseil-cpp" ,abseil-cpp)
        ("re2" ,re2)
        ("qtsvg" ,qtsvg)
        ("curl" ,curl)))
    (home-page "https://github.com/Qv2ray/Qv2ray/")
    (synopsis "A cross-platform connection manager for V2Ray and other backends")
    (description "Binary version of Qv2ray")
    (license l:gpl3)))