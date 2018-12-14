% Lexical Rules
% ===================================================

% Ancillary constraints
dental_stop(X) :- member(X, [d,t]).
vowel(X) :- member(X, [a,e,i,o,u]).
consonant([H|T]) :- consonant(H), consonant(T).
consonant(X) :- member(X, [b,c,d,f,g,h,j,k,l,m,n,p,q,r,s,t,v,w,x,y,z]).
consonant([]).

% ===================================================
% Nominal Lexical Rules
% ===================================================

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

% ===================================================
% Adjectival Lexical Rules
% ===================================================

% Singular adjective lexical rule

sing_adj lex_rule  
   (adj_lxm, (syn: S,
              sem: M))
   **> (word, (syn: S,
               sem: M))
 morphs
    X becomes X.

% Plural adjective lexical rule

plur_adj lex_rule
   (adj_lxm, (syn: (head: agr: (gnd: G,
                                per: P)),
              sem: M))
   **> (word, (syn: (head: (adj, agr: (gnd: G,
                                 per: P,
                                 num: pl))),
               sem: M))
   morphs
   (X, ea) becomes (X, ie),
   (X, a) becomes (X, e),
   (X) becomes (X, i).

%===================================================
% Verbal rules
%===================================================

% Present tense lexical rule
present_v lex_rule
   (v_lxm, (syn: S,
            sem: M))
   **> (word, (syn: S,
               sem: M))
   morphs
   sil becomes siila.