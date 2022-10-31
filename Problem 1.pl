%:- discontiguous(move/2).

%Substitute Procedure
substitute(_, [], _, []):-!.
substitute(X, [X|T], Y, [Y|T1]):-
  substitute(X, T, Y, T1),!.

substitute(X, [H|T], Y, [H|T1]):-
  substitute(X, T, Y, T1).
  

move(S,Snew):-
           move_right(S,Snew).
%MOVING RIGHT
move_right([R1,R2,R3,R4,R5,R6,R7,R8,R9],Snew):-
           R3 =\= 0,
           R6 =\= 0,
           R9 =\= 0,
           blank_right([R1,R2,R3,R4,R5,R6,R7,R8,R9],Snew).

%nth0(Index,List to search at, Value)
blank_right([R1,R2,R3,R4,R5,R6,R7,R8,R9],S):-
            nth0(N,[R1,R2,R3,R4,R5,R6,R7,R8,R9],0),
            Z is N+1,
            nth0(Z,[R1,R2,R3,R4,R5,R6,R7,R8,R9],R),
            substitute(R,[R1,R2,R3,R4,R5,R6,R7,R8,R9],10,Q),
            substitute(0,Q,R,V),
            substitute(10,V,0,S).
            
move(S,Snew):-
           move_left(S,Snew).

%MOVING LEFT
move_left([R1,R2,R3,R4,R5,R6,R7,R8,R9],Snew):-
           R1 =\= 0,
           R4 =\= 0,
           R7 =\= 0,
           blank_left([R1,R2,R3,R4,R5,R6,R7,R8,R9],Snew).

%nth0(Index,List to search at, Value)
blank_left([R1,R2,R3,R4,R5,R6,R7,R8,R9],S):-
            nth0(N,[R1,R2,R3,R4,R5,R6,R7,R8,R9],0),
            Z is N-1,
            nth0(Z,[R1,R2,R3,R4,R5,R6,R7,R8,R9],R),
            substitute(R,[R1,R2,R3,R4,R5,R6,R7,R8,R9],10,Q),
            substitute(0,Q,R,V),
            substitute(10,V,0,S).

move(S,Snew):-
           move_up(S,Snew).
           
%MOVING Up
move_up([R1,R2,R3,R4,R5,R6,R7,R8,R9],Snew):-
           R1 =\= 0,
           R2 =\= 0,
           R3 =\= 0,
           blank_up([R1,R2,R3,R4,R5,R6,R7,R8,R9],Snew).

%nth0(Index,List to search at, Value)
blank_up([R1,R2,R3,R4,R5,R6,R7,R8,R9],S):-
            nth0(N,[R1,R2,R3,R4,R5,R6,R7,R8,R9],0),
            Z is N-3,
            nth0(Z,[R1,R2,R3,R4,R5,R6,R7,R8,R9],R),
            substitute(R,[R1,R2,R3,R4,R5,R6,R7,R8,R9],10,Q),
            substitute(0,Q,R,V),
            substitute(10,V,0,S).

move(S,Snew):-
           move_down(S,Snew).
           
%MOVING DOWN
move_down([R1,R2,R3,R4,R5,R6,R7,R8,R9],Snew):-
           R7 =\= 0,
           R8 =\= 0,
           R9 =\= 0,
           blank_down([R1,R2,R3,R4,R5,R6,R7,R8,R9],Snew).

%nth0(Index,List to search at, Value)
blank_down([R1,R2,R3,R4,R5,R6,R7,R8,R9],S):-
            nth0(N,[R1,R2,R3,R4,R5,R6,R7,R8,R9],0),
            Z is N+3,
            nth0(Z,[R1,R2,R3,R4,R5,R6,R7,R8,R9],R),
            substitute(R,[R1,R2,R3,R4,R5,R6,R7,R8,R9],10,Q),
            substitute(0,Q,R,V),
            substitute(10,V,0,S).
            
%Solving the puzzle
game(I,G):- puzzle(I,[I],G).

puzzle([0,1,2,3,4,5,6,7,8],Visited,Visited).

puzzle(CurrentState,Visited,R):-

            move(CurrentState,NewState),

            \+ member(NewState,Visited),

            puzzle(NewState,[NewState|Visited],R).

%Input: game([1,2,4,6,3,0,8,7,5],Goal).
