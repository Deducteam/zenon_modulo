
(*
copyright (c) 2014, guillaume bury
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

(* TODO: Re-order the definitions *)

(** Modular and incremental implementation of the simplex. *)

(** The types of the variables used by the equations to solve. While it is
    important that functions 'equal' and 'hash' are compatible, no relation
    with 'compare' is required. 'hash' and 'equal' are only used to make the
    Hashtbl module. *)
module type VarType = sig
    type t
    val hash : t -> int
    val equal : t -> t -> bool
    val compare : t -> t -> int
end

module type S = sig
    (** The given type of the variables *)
    type var

    (** The type of a (possibly not solved) linear system *)
    type t

    (** Generic type returned when solving the simplex. A solution is a list of bindings
        that satisfies all the constraints inside the system. If the system is unsatisfiable,
        an explanation of type ['cert] is returned. *)
    type 'cert res =
        | Solution of (var * Q.t) list
        | Unsatisfiable of 'cert

    (** An unsatisfiability explanation is a couple [(x, expr)]. If [expr] is the empty list, then there is a contradiction
        between two given bounds of [x]. Else, the explanation is an equality [x = expr] that is valid (it can be derived
        from the original equations of the system) from which a bound can be deduced which contradicts an already given bound of the system. *)
    type k_cert = var * (Q.t * var) list

    type n_cert = cert_tree option ref
    and cert_tree =
        | Branch of var * Z.t * n_cert * n_cert
        | Explanation of k_cert
    (* TODO: Better explanation ? *)
    (** The type of explanation for integer systems. In one case, the system is unsatisfiable when seen as a rational system.
        In the other case, two cases are considered : for a given variable [x] and a bound [b], either [x] is lower than [b],
        or it is greater then [b + 1]. *)

    type k_res = k_cert res
    type n_res = n_cert res
    (** Types returned when solving a system. *)

    (** The type of traces of the optimizations performed on a simplex. *)
    type optim =
        | Tight of var
        | Multiply of var * Q.t

    (** TODO *)
    type debug_printer = Format.formatter -> t -> unit

    (** {3 Simplex construction} *)

    (** The empty system *)
    val create      : unit -> t

    (** Returns a copy of the given system *)
    val copy        : t -> t

    (** [add_eq s (x, eq)] adds the equation (x = eq) to the system (in place). *)
    val add_eq      : t -> var * (Q.t * var) list -> unit

    (** [add_bounds s (x, lower, upper)] adds the bounds [lower] and [upper] for the given variable [x] to the system [s] (in place).
        If the bound is loose on one side (no upper bounds for instance),
        the values [Zarith.Q.inf] and [Zarith.Q.minus_inf] can be used. By default, in a system, all variables have no bounds,
        i.e have lower bound [Zarith.Q.minus_inf] and upper bound [Zarith.Q.inf].
        Optional parameters allow to make the the bounds strict. Defaults to false, so that bounds are large by default. *)
    val add_bounds  : t -> ?strict_lower:bool -> ?strict_upper:bool -> var * Q.t * Q.t -> unit

    (** {3 Simplex solving} *)

    (** [ksolve s] solves the system [s] and returns a solution, if one exists. This function may chnge
        the internal representation of the system to that of an equivalent one (permutation of basic and
        non basic variables and pivot operation on the tableaux).
        @param debug An optional debug option can be given, and will be applied to all systems encountered
        while solving the system, including the initial and final states of the system. Can be used for
        printing intermediate states of the system. *)
    val ksolve       : ?debug:(debug_printer) -> t -> k_res

    (** [nsolve s int_vars] solve the system [s] considering the variables in [int_vars] as integers instead
        of rationals. There is no guarantee that this function will terminate (for instance, on the system
        ([1 <= 3 * x + 3 * y <= 2], [nsolve] will NOT terminate), it hence recommended to apply a global
        bounds to the variables of a system before trying to solve it with this function.
        @param debug An optional debug option can be given, and will be applied to all systems encountered
        at the end of a branch while solving the system. Can be used for printing intermediate states of the system. *)
    val nsolve      : t -> (var -> bool) -> n_res

    (** [safe_nsolve s int_vars] solves the system [s] considering the variables in [int_vars] as integers.
        This function always terminate, thanks to a global bound that is applied to all variables of int_vars.
        The global bound is also returned to allow for verification.
        Due to the bounds being very high, [safe_nsolve] may take a lot of time and memory. It is recommended to apply
        some optimizations before trying to solve system using this function. *)
    val nsolve_safe : t -> (var -> bool) -> Q.t * n_res

    (** Returns a function that can be called multiple times, each time trying to solve the system with an increasing
        maximum on the depth of the branching tree. *)
    val nsolve_incr : t -> (var -> bool) -> ( unit -> n_res option)

    (** {3 Simplex optimizations} *)
    (* TODO: do not modify simplexes in place/ export functions to apply optimization traces ?*)

    (** [tighten int_vars s] tightens all the bounds of the variables in [int_vars] and returns the list of optimizations
        performed on the system. *)
    val tighten : (var -> bool) -> t -> optim list

    (** [normalize int_vars s], normalizes the system [s] (in place), and returns the list of optimizations performed on it.
        [int_vars] is the list of variable that should be assigned an integer.
        A normalized system has only integer coeficients in his tableaux. Furthermore, in any line (i.e in the expression of a basic variable [x]),
        the gcd of all coeficients is [1]. This includes the bounds of [x], except in the following case.
        If all pertinent variables (have a non-zero coeficient) in the expression of [x] are in [int_vars], then the bounds are divided by the gcd
        of the coeficients in the expression, and then rounded (since we can deduce that [x] must be an integer as well). *)
    val normalize : (var -> bool) -> t -> optim list

    (** Apply all optimizations to a simplex. *)
    val preprocess  : t -> (var -> bool) -> optim list

    (** Apply the given optimizations to the simplex. *)
    val apply_optims : (t -> optim list) list -> t -> optim list

    (** {3 Access functions} *)

    (** [get_tab s] returns the current tableaux of [s] as a triple [(l, l', tab)] where [l] is the list of the
        non-basic variables, [l'] the list of basic variables and [tab] the list of the rows of the tableaux in
        the same order as [l] and [l']. *)
    val get_tab     : t -> var list * var list * Q.t list list

    (** [get_assign s] returns the current (partial) assignment of the variables in [s] as a list of bindings.
        Only non-basic variables (as given by [get_tab]) should appear in this assignent. As such, and according to
        simplex invariants, all variables in the assignment returned should satisfy their bounds.
        Valuations are returned as a pair (x, (v, e)) such that x = v + e * \delta, with \delta an
        infinitely small quantity. *)
    val get_assign  : t -> (var * (Q.t * Q.t)) list

    (* [get_full_assign s] returns the current values of all the variables present in the system.
        Notice that it doesn't mean the assignment returned satisfies all bounds.*)
    val get_full_assign : t -> (var * Q.t) list

    (** [get_bounds s x] returns the pair [(low, upp)] of the current bounds for the variable [x]. 
        Notice that it is possible that [low] is strictly greater than [upp]. *)
    val get_bounds : t -> var -> Q.t * Q.t

    (** [get_all_bounds s] returns the list of all the explicit bounds of [s]. Any variable not present
        in the return value is assumed to have no bounds (i.e lower bound [Zarith.Q.minus_inf] and
        upper bound [Zarith.Q.inf]). *)
    val get_all_bounds : t -> (var * (Q.t * Q.t)) list

    (** {3 Printing functions} *)

    (** [print_debug print_var] returns a suitable function for printing debug info on the current state of a system.
        It can for instance be used as the debug function of [solve] to see the evolution of the simplex. *)
    val print_debug : (Format.formatter -> var -> unit) -> debug_printer

end

(** Functor building an implementation of the simplex solver given a totally ordered
    type for the variables *)
module Make : functor (Var : VarType) -> S with type var = Var.t


(** {2 Higher-Level Interface} *)

module type HELPER = sig
  (** User provided variable type *)
  type external_var

  type var = private
    | Intern of int
    | Extern of external_var

  (** Fresh internal variable *)
  val fresh_var : unit -> var

  (** Lift an external variable in the [var] type *)
  val mk_var : external_var -> var

  (** the usual system, but the extended variable type *)
  include S with type var := var

  type monome = (Q.t * external_var) list

  type op = Less | LessEq | Eq | Greater | GreaterEq

  type constraint_ = op * monome * Q.t

  val add_constraints : t -> constraint_ list -> unit
end

module MakeHelp(Var : VarType) : HELPER with type external_var = Var.t
