% Lexical Rules
% ===================================================

% Ancillary constraints
dental_stop(X) :- member(X, [d,t]).
vowel(X) :- member(X, [a,e,i,o,u]).

% Singular common noun lexical rule

sing_n lex_rule  
   (cn_lxm, (syn: S,
             sem: M))
   **> (word, (syn: S,
               sem: M))
 morphs
    X becomes X.

% Plural noun lexical rule

plur_n lex_rule 
   (count_sing_n_lxm, (syn: (head: agr: (gnd: G,
                                         per: P)),
                       sem: M))
   **> (word, (syn: (head: (noun,
                            agr: (gnd: G,
                                  per: P,
                                  num: pl))),
               sem: M))
   morphs
   (X, le) becomes (X, ler),
   (X, ie) becomes (X, ier),
   (X, a) becomes (X, ar),
   (X, o) becomes (X, or),
   (X, u) becomes (X, ur),
   (X, i) becomes (X, ir),
   (X) becomes (X, i).

% Dual plural noun lexical rule

dplur_n lex_rule
   (count_sing_n_lxm, (syn: (head: agr: (gnd: G,
                                         per: P)),
                       sem: M))
   **> (word, (syn: (head: (noun,
                            agr: (gnd: G,
                                  per: P,
                                  num: dl))),
               sem: M))
   morphs
   (X, [D, V]) becomes (X, [D], u) when dental_stop(D),
   (X, [V]) becomes (X, [V], t) when vowel(V),
   (X) becomes (X, u).