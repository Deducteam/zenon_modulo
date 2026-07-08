let libdir =
  let root = try Sys.getenv "OPAM_SWITCH_PREFIX" with Not_found -> "/usr/local"
  in Filename.concat root "lib"
;;
