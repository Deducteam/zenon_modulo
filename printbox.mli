(*
copyright (c) 2013-2014, simon cruanes
all rights reserved.

redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.  redistributions in binary
form must reproduce the above copyright notice, this list of conditions and the
following disclaimer in the documentation and/or other materials provided with
the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*)

(** {1 Pretty-Printing of nested Boxes}

Allows to print nested boxes, lists, arrays, tables in a nice way
on any monospaced support.

{[
  # let b = PrintBox.(
  frame
    (vlist [ line "hello";
             hlist [line "world"; line "yolo"]])
  );;
val b : Box.t = <abstr>
# PrintBox.output ~indent:2 stdout b;;
  +----------+
  |hello     |
  |----------|
  |world|yolo|
  +----------+
- : unit = ()
# let b2 = PrintBox.(
  frame
    (hlist [ text "I love\nto\npress\nenter";
             grid_text [| [|"a"; "bbb"|];
                          [|"c"; "hello world"|] |]])
  );;
val b2 : PrintBox.Box.t = <abstr>
# PrintBox.output stdout b2;; 
+--------------------+
|I love|a|bbb        |
|to    |-+-----------|
|press |c|hello world|
|enter | |           |
+--------------------+

- : unit = ()

]}

*)

type position = { x:int ; y: int }
(** Positions are relative to the upper-left corner, that is,
when [x] increases we go toward the right, and when [y] increases
we go toward the bottom (same order as a printer) *)

val origin : position
(** Initial position *)

module Output : sig
  type t = {
    put_char : position -> char -> unit;
    put_string : position -> string -> unit;
    put_sub_string : position -> string -> int -> int -> unit;
    flush : unit -> unit;
  }

  (** {6 Default Instance: a buffer} *)

  type buffer

  val make_buffer : unit -> buffer * t
  (** New buffer, and the corresponding output (buffers are mutable) *)

  val buf_to_lines : ?indent:int -> buffer -> string
  (** Print the content of the buffer into a string.
      @param indent number of spaces to insert in front of the lines *)

  val buf_output : ?indent:int -> out_channel -> buffer -> unit
  (** Print the buffer on the given channel *)
end

module Box : sig
  type t

  val size : t -> position
  (** Size needed to print the box *)
end

val line : string -> Box.t
(** Make a single-line box.
    @raise Invalid_argument if the string contains ['\n'] *)

val text : string -> Box.t
(** Any text, possibly with several lines *)

val lines : string list -> Box.t
(** Shortcut for {!text}, with a list of lines *)

val int_ : int -> Box.t

val bool_ : bool -> Box.t

val float_ : float -> Box.t

val frame : Box.t -> Box.t
(** Put a single frame around the box *)

val pad : Box.t -> Box.t
(** Pad the given box with some free space *)

val pad' : int -> Box.t -> Box.t
(** Pad with the given number of free cells *)

val grid : ?pad:bool -> ?framed:bool -> Box.t array array -> Box.t
(** Grid of boxes (no frame between boxes). The matrix is indexed
    with lines first, then columns. The array must be a proper matrix,
    that is, all lines must have the same number of columns!
    @param framed if [true], each item of the grid will be framed.
      default value is [true] *)

val grid_text : ?pad:bool -> ?framed:bool -> string array array -> Box.t
(** Same as {!grid}, but wraps every cell into a {!text} box *)

val transpose : 'a array array -> 'a array array
(** Transpose a matrix *)

val init_grid : ?pad:bool -> ?framed:bool ->
                line:int -> col:int -> (line:int -> col:int -> Box.t) -> Box.t
(** Same as {!grid} but takes the matrix as a function *)

val vlist : ?pad:bool -> ?framed:bool -> Box.t list -> Box.t
(** Vertical list of boxes *)

val hlist : ?pad:bool -> ?framed:bool -> Box.t list -> Box.t
(** Horizontal list of boxes *)

val grid_map : ?pad:bool -> ?framed:bool -> ('a -> Box.t) -> 'a array array -> Box.t

val vlist_map : ?pad:bool -> ?framed:bool -> ('a -> Box.t) -> 'a list -> Box.t

val hlist_map : ?pad:bool -> ?framed:bool -> ('a -> Box.t) -> 'a list -> Box.t

val render : Output.t -> Box.t -> unit

val to_string : Box.t -> string

val output : ?indent:int -> out_channel -> Box.t -> unit

