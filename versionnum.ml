(*  Copyright 2008 INRIA  *)
Version.add "$Id$";;

open Printf;;

let number = 1;;      (* strictly increasing *)
let date = "2015-05-19";;

let major = 0;;
let minor = 1;;
let bugfix = 0;;

let short = sprintf "%d.%d.%d" major minor bugfix;;
let full = sprintf "%d.%d.%d [a%d] %s" major minor bugfix number date;;
