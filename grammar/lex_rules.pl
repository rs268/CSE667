% Lexical Rules
% ===================================================

% Ancillary constraints
dental_stop(X) :- member(X, [d,t]).
vowel(X) :- member(X, [a,e,i,o,u]).
consonant([H|T]) :- consonant(H), consonant(T).
consonant(X) :- member(X, [b,c,d,f,g,h,j,k,l,m,n,p,q,r,s,t,v,w,x,y,z]).
consonant([]).

% ===================================================
% Nominal Declension
% ===================================================

% Nominative Case

% Singular
sing_nom lex_rule  
   (cn_lxm, (syn: (head: agr: (gnd: G,
                               per: P)),
             sem: M))
   **> (word, (syn: (head: (noun,
                            agr: (gnd: G,
                                  per: P,
                                  num: sg),
                            case: nom)),
               sem: M))
 morphs
    X becomes X.

% Plural
plur_nom lex_rule 
   (count_sing_n_lxm, (syn: (head: agr: (gnd: G,
                                         per: P)),
                       sem: M))
   **> (word, (syn: (head: (noun,
                            agr: (gnd: G,
                                  per: P,
                                  num: pl),
                            case: nom)),
               sem: M))
   morphs
   (X, le) becomes (X, ler),
   (X, ie) becomes (X, ier),
   (X, a) becomes (X, ar),
   (X, o) becomes (X, or),
   (X, u) becomes (X, ur),
   (X, i) becomes (X, ir),
   (X, e) becomes (X, i),
   (X) becomes (X, i).

% Dual
dplur_n lex_rule
   (count_sing_n_lxm, (syn: (head: agr: (gnd: G,
                                         per: P)),
                       sem: M))
   **> (word, (syn: (head: (noun,
                            agr: (gnd: G,
                                  per: P,
                                  num: dl),
                            case: nom)),
               sem: M))
   morphs
   (X, [D, V]) becomes (X, [D], u) when dental_stop(D),
   (X, [V]) becomes (X, [V], t) when vowel(V),
   (X) becomes (X, u).

% Genitive Case

% Singular
sing_gen lex_rule  
   (cn_lxm, (syn: (head: agr: (gnd: G,
                               per: P)),
             sem: M))
   **> (word, (syn: (head: (noun,
                            agr: (gnd: G,
                                  per: P,
                                  num: sg),
                            case: gen),
                     val: mod: (right)),
               sem: M))
 morphs
    (X,a) becomes (X,o),
    (X,o) becomes (X,o),
    (X) becomes (X,o).

% Plural
plur_nom lex_rule 
   (count_sing_n_lxm, (syn: (head: agr: (gnd: G,
                                         per: P)),
                       sem: M))
   **> (word, (syn: (head: (noun,
                            agr: (gnd: G,
                                  per: P,
                                  num: pl),
                            case: gen),
                     val: mod: (right)),
               sem: M))
   morphs
   (X, le) becomes (X, leron),
   (X, ie) becomes (X, ieron),
   (X, a) becomes (X, aron),
   (X, o) becomes (X, oron),
   (X, u) becomes (X, uron),
   (X, i) becomes (X, iron),
   (X, e) becomes (X, ion),
   (X) becomes (X, ion).

% Dual
dplur_n lex_rule
   (count_sing_n_lxm, (syn: (head: agr: (gnd: G,
                                         per: P)),
                       sem: M))
   **> (word, (syn: (head: (noun,
                            agr: (gnd: G,
                                  per: P,
                                  num: dl),
                            case: gen),
                     val: mod: (right)),
               sem: M))
   morphs
   (X, [D, V]) becomes (X, [D], uo) when dental_stop(D),
   (X, [V]) becomes (X, [V], to) when vowel(V),
   (X) becomes (X, uo).

% Accusative

% Singular
sing_acc lex_rule  
   (cn_lxm, (syn: (head: agr: (gnd: G,
                               per: P)),
             sem: M))
   **> (word, (syn: (head: (noun,
                            agr: (gnd: G,
                                  per: P,
                                  num: sg),
                            case: acc)),
               sem: M))
   morphs
   X becomes X.

% Plural
plur_acc lex_rule
   (cn_lxm, (syn: (head: agr: (gnd: G,
                               per: P)),
             sem: M))
   **> (word, (syn: (head: (noun,
                            agr: (gnd: G,
                                  per: P,
                                  num: pl),
                            case: acc)),
               sem: M))
   morphs
   (X, le) becomes (X, ler),
   (X, ie) becomes (X, ier),
   (X, a) becomes (X, ar),
   (X, o) becomes (X, or),
   (X, u) becomes (X, ur),
   (X, i) becomes (X, ir),
   (X, e) becomes (X, i),
   (X) becomes (X, i).

% Dual
dplur_acc lex_rule
   (count_sing_n_lxm, (syn: (head: agr: (gnd: G,
                                         per: P)),
                       sem: M))
   **> (word, (syn: (head: (noun,
                            agr: (gnd: G,
                                  per: P,
                                  num: dl),
                            case: acc)),
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
   (adj_lxm, (syn: head: agr: A,
              sem: M))
   **> (word, (syn: head: (adj, agr: A),
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

% Adjective to Noun lexical rule
adj_to_n lex_rule
   (adj_lxm, (syn: S,
              sem: M))
   **> (cn_lxm, (syn: S,
                 sem: M))
   morphs
   X becomes X.

%===================================================
% Verbal rules
%===================================================

% Present tense lexical rule

% Weak Verbs
present_wv lex_rule
   (weak_v_lxm, (syn: head: agr: A,
                 sem: M))
   **> (word, (syn: head: (verb, agr: A),
               sem: M))
   morphs
   (X, [V, C]) becomes (X, [V, V, C, a]) when (vowel(V), consonant(C)).

% Strong Verbs
present_sv lex_rule
   (strong_v_lxm, (syn: head: agr: A,
                   sem: M))
   **> (word, (syn: head: (verb, agr: A),
               sem: M))
   morphs
   (X, a) becomes (X, ea).

% Past tense lexical rule
past_v lex_rule
    (v_lxm, (syn: head: agr: A,
             sem: M))
    **> (word, (syn: head: (verb, agr: A),
                sem: M))
    morphs
    (X, r) becomes (X, rne),
    (X, m) becomes (X, mne),
    (X, n) becomes (X, nne),
    (X, p) becomes (X, mpe),
    (X, l) becomes (X, lle),
    (X, Y) becomes (X, n, Y, e) when consonant(Y).
    (X) becomes (X, e).

% Future tense lexical rule
future_v lex_rule
    (v_lxm, (syn: head: agr: A,
             sem: M))
    **> (word, (syn: head: (verb, agr: A),
                sem: M))
    morphs
    (X, a) becomes (X, uva),
    (X) becomes (X, uva).

% Aorist tense lexical rule
% Strong Verbs
aorist_sv lex_rule
    (strong_v_lxm, (syn: head: agr: A,
                    sem: M))
    **> (word, (syn: head: (verb, agr: A),
                sem: M))
    morphs
    X becomes X.

% Weak Verbs
aorist_wv lex_rule
    (weak_v_lxm, (syn: head: agr: A,
                  sem: M))
    **> (word, (syn: head: (verb, agr: A),
                sem: M))
    morphs
    (X) becomes (X, i).

% Perfect tense lexical rule
perfect_v lex_rule
    (v_lxm, (syn: head: agr: A,
             sem: M))
    **> (word, (syn: head: (verb, agr: A),
                sem: M))
    morphs
    (X, ya) becomes (X, ie),
    (X, a) becomes (X, ie),
    (X) becomes (X, ie).