%% :- write('Loading consistency checker...'),nl.

% ------------------------------------------------------------------------------
% Grammar consistency check 
%
% p_v/1 (verbose)
% p_s/1 (silent)
% ------------------------------------------------------------------------------

% Grammatical test set 
% ------------------------------------------------------------------------------
s(g,1,[i,alda,lantea]). % The tree falls (is falling).
s(g,2,[i,eldar,cendar,parmar]). % The elves read books (habitually).
s(g,3,[i,aiwe,mante,hendi]). % The bird ate eyes.
% s(g,3,[i,eldar,melir,i,calime,aldar]). % The elves love the bright trees (timelessly).
s(g,4,[i,vendeo,ohtar,fiira]). % The maiden warrior dies.
% s(g,5,[i,eldalieva,elen,calyuva,i,vanya,vende]). % The star of the elves will illuminate the beautiful maiden.
s(g,5,[i,naucor,eleerier,i,mooli]). % The dwarves have released the slaves.

% Ungrammatical test set
% ------------------------------------------------------------------------------
s(u,1,[i,aldar,lantea]).
s(u,2,[i,alda,lantear]).
s(u,3,[i,aiwe,mate,hendi]).
% s(u,3,[i,eldar,melir,i,calima,aldar]).
s(u,4,[i,vende,ohtar,fiira]).
% s(u,5,[i,eldalieva,elen,calyuva,i,vanya,vende]).
s(u,5,[i,naucor,elerier,i,mooli]).

s(_,0,stop).

% ------------------------------------------------------------------------------
% Parse with verbose output p_v/1
%   "p_v(g)" for grammatical examples
%   "p_v(u)" for ungrammatical examples
%   "p_v(_)" for both
% ------------------------------------------------------------------------------

p_v(Type) :-
        repeat,
            s(Type,N,S),
            parse_v(S,N,Type),
            !.

parse_v(stop,0,_).
                  
parse_v(S,N,Type) :-  
         write('Parsing '), write(Type), write(' sentence number '), write(N), write('... '),
        (call(time(rec(S,_,_,_,(phrase,sem:store:(a_ []))))) ; (tab(18), write('Failed.'), nl)),!,
         fail.

% ------------------------------------------------------------------------------         
% Parse with 'silent' output p_s/1
%  "p_s(g)" for grammatical examples
%  "p_s(u)" for ungrammatical examples
%  "p_s(_)" for both
% ------------------------------------------------------------------------------

p_s(Type) :-
        repeat,
            s(Type,N,S),
            parse_s(Type,S,N),
            !.

parse_s(_,stop,0).

parse_s(g,S,N) :-  
        (
            call(rec(S,_,_,_,(phrase,sem:store:(a_ [])))) ;
            (
                write('Failed: expected ('), write(N), write(') '),
                write(S),
                write(' to be grammatical, but it was ungrammatical'), nl
            )
        ),!,
        fail.
parse_s(u,S,N) :-  
        (
            call(rec(S,_,_,_,(phrase,sem:store:(a_ [])))) ,
            (
                write('Failed: expected ('), write(N), write(') '),
                write(S),
                write(' to be ungrammatical, but it was grammatical'), nl
            )
        ),!,
        fail.
