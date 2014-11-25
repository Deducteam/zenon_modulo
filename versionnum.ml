(*  Copyright 2008 INRIA  *)
Version.add "$Id$";;

open Printf;;

let number = 263;;      (* strictly increasing *)
let date = "2014-10-21";;

let major = 0;;
let minor = 8;;
let bugfix = 0;;

let short = sprintf "%d.%d.%d" major minor bugfix;;
let full = sprintf "%d.%d.%d [a%d] %s" major minor bugfix number date;;
