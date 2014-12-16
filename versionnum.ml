(*  Copyright 2008 INRIA  *)
Version.add "$Id$";;

open Printf;;

let number = 1;;      (* strictly increasing *)
let date = "2014-12-13";;

let major = 0;;
let minor = 3;;
let bugfix = 1;;

let short = sprintf "%d.%d.%d" major minor bugfix;;
let full = sprintf "%d.%d.%d [a%d] %s" major minor bugfix number date;;
