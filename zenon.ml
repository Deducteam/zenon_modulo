(*  Copyright 2013 Inria  *)
Version.add "$Id$";;

Printexc.record_backtrace true;;
Extension.activate "recfun";;
Main.parse_command_line Main.argspec;;
Main.do_main ();;
