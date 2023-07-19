open Dkterm

val print_line          : out_channel -> line -> unit
val print_goal_type     : out_channel -> string -> dkterm -> unit
val print_dk_type       : out_channel -> dkterm -> unit
val print_dk_term       : out_channel -> dkterm -> unit
val print_proof         : out_channel -> string -> dkterm -> unit
