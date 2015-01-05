% Comments : Branch&Bound does not terminate on this system
%------------------------------------------------------------------------------
tff(test,conjecture,(
    ! [X1 : $int, X2: $int, X3: $int, Y1: $int, Y2: $int, Y3: $int] : (
    (X1 = X2 & X2 = X3 & Y1 = Y2 & Y2 = Y3) => (
        $lesseq($difference($sum(X1,$sum(X2,X3)),$sum(Y1,$sum(Y2,Y3))), 0) |
        $greatereq($difference($sum(X1,$sum(X2,X3)),$sum(Y1,$sum(Y2,Y3))), 3)
    )))).
%------------------------------------------------------------------------------
