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
   (cn_lxm, (syn: S,
             sem: M))
   **> (word, (syn: (S, head: (noun,
                               agr: num: sg,
                               case: nom)),
               sem: M))
 morphs
    X becomes X.

% Plural
plur_nom lex_rule 
   (count_sing_n_lxm, (syn: (head: agr: gnd: G,
                             val: E),
                       sem: M))
   **> (word, (syn: (head: (noun,
                            agr: (gnd: G,
                                  num: pl),
                            case: nom),
                     val: E),
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
dplur_nom lex_rule
   (count_sing_n_lxm, (syn: (head: agr: gnd: G,
                             val: E),
                       sem: M))
   **> (word, (syn: (head: (noun,
                            agr: (gnd: G,
                            num: dl),
                            case: nom),
                     val: E),
               sem: M))
   morphs
   (X, [D, V]) becomes (X, [D], u) when dental_stop(D),
   (X, [V]) becomes (X, [V], t) when vowel(V),
   (X) becomes (X, u).

% Genitive Case

% Singular
sing_gen lex_rule  
   (cn_lxm, (syn: (head: agr: gnd: G,
                  val: (spr: S,
                        comps: C)),
             sem: M))
   **> (word, (syn: (head: (noun,
                            agr: (gnd: G,
                                  num: sg),
                            case: gen),
                     val: (spr: S,
                           comps: C,
                           mod: (right; left))),
               sem: M))
 morphs
    (X,a) becomes (X,o),
    (X,o) becomes (X,o),
    (X) becomes (X,o).

% Plural
plur_gen lex_rule 
   (count_sing_n_lxm, (syn: (head: agr: gnd: G,
                             val: (spr: S,
                                   comps: C)),
                       sem: M))
   **> (word, (syn: (head: (noun,
                            agr: (gnd: G,
                                  num: pl),
                            case: gen),
                     val: (spr: S,
                           comps: C,
                           mod: (right ; left))),
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
dplur_gen lex_rule
   (count_sing_n_lxm, (syn: (head: agr: gnd: G),
                       sem: M))
   **> (word, (syn: (head: (noun,
                            agr: (gnd: G,
                                  num: dl),
                            case: gen),
                     val: mod: (right ; left)),
               sem: M))
   morphs
   (X, [D, V]) becomes (X, [D], uo) when dental_stop(D),
   (X, [V]) becomes (X, [V], to) when vowel(V),
   (X) becomes (X, uo).

% Accusative

% Singular
sing_acc lex_rule  
   (cn_lxm, (syn: (head: agr: gnd: G,
                   val: E),
             sem: M))
   **> (word, (syn: (head: (noun,
                            agr: (gnd: G,
                                  num: sg),
                            case: acc),
                     val: E),
               sem: M))
   morphs
   X becomes X.

% Plural
plur_acc lex_rule
   (cn_lxm, (syn: (head: agr: gnd: G,
                   val: E),
             sem: M))
   **> (word, (syn: (head: (noun,
                            agr: (gnd: G,
                                  num: pl),
                            case: acc),
                     val: E),
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
   (count_sing_n_lxm, (syn: (head: agr: gnd: G,
                             val: E),
                       sem: M))
   **> (word, (syn: (head: (noun,
                            agr: (gnd: G,
                                  num: dl),
                            case: acc),
                     val: E),
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
   **> (word, (syn: (S, head: adj),
               sem: M))
 morphs
    X becomes X.

% Plural adjective lexical rule
plur_adj lex_rule
   (adj_lxm, (syn: S,
              sem: M))
   **> (word, (syn: (S, head: (adj, agr: num: pl)),
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

% Singular
present_wv_sing lex_rule
   (weak_v_lxm, (syn: S,
                 sem: M))
   **> (word, (syn: (S, head: agr: num: sg),
               sem: M))
   morphs
   (X, [V, C]) becomes (X, [V, V, C, a]) when (vowel(V), consonant(C)).

% Plural
present_wv_plur lex_rule
   (weak_v_lxm, (syn: S,
                 sem: M))
   **> (word, (syn: (S, head: agr: num: (pl ; dl)),
               sem: M))
   morphs
   (X, [V, C]) becomes (X, [V, V, C, a, r]) when (vowel(V), consonant(C)).

% Strong Verbs

% Singular
present_sv_sing lex_rule
   (strong_v_lxm, (syn: S,
                   sem: M))
   **> (word, (syn: (S, head: agr: num: sg),
               sem: M))
   morphs
   (X, a) becomes (X, ea).

% Plural
present_sv_plur lex_rule
   (strong_v_lxm, (syn: S,
                   sem: M))
   **> (word, (syn: (S, head: agr: num: (pl ; dl)),
               sem: M))
   morphs
   (X, a) becomes (X, ear).

% Past tense lexical rule

% Singular
past_v_sing lex_rule
    (v_lxm, (syn: S,
             sem: M))
    **> (word, (syn: (S, head: agr: num: sg),
                sem: M))
    morphs
    (X, r) becomes (X, rne),
    (X, m) becomes (X, mne),
    (X, n) becomes (X, nne),
    (X, p) becomes (X, mpe),
    (X, l) becomes (X, lle),
    (X, Y) becomes (X, n, Y, e) when consonant(Y).
    (X) becomes (X, ne).

% Plural
past_v_plur lex_rule
    (v_lxm, (syn: S,
             sem: M))
    **> (word, (syn: (S, head: agr: num: (pl ; dl)),
                sem: M))
    morphs
    (X, r) becomes (X, rner),
    (X, m) becomes (X, mner),
    (X, n) becomes (X, nner),
    (X, p) becomes (X, mper),
    (X, l) becomes (X, ller),
    (X, Y) becomes (X, n, Y, er) when consonant(Y).
    (X) becomes (X, ner).

% Future tense lexical rule

% Singular
future_v_sing lex_rule
    (v_lxm, (syn: S,
             sem: M))
    **> (word, (syn: (S, head: agr: num: sg),
                sem: M))
    morphs
    (X, a) becomes (X, uva),
    (X) becomes (X, uva).

% Plural
future_v_plur lex_rule
(v_lxm, (syn: S,
         sem: M))
**> (word, (syn: (S, head: agr: num: (pl ; dl)),
            sem: M))
morphs
(X, a) becomes (X, uvar),
(X) becomes (X, uvar).

% Aorist tense lexical rule
% Strong Verbs

% Singular
aorist_sv_sing lex_rule
    (strong_v_lxm, (syn: S,
                    sem: M))
    **> (word, (syn: (S, head: agr: num: sg),
                sem: M))
    morphs
    X becomes X.

% Plural
aorist_sv_plur lex_rule
   (strong_v_lxm, (syn: S,
                   sem: M))
   **> (word, (syn: (S, head: agr: num: (pl ; dl)),
               sem: M))
   morphs
   (X) becomes (X, r).

% Weak Verbs

% Singular
aorist_wv_sing lex_rule
    (weak_v_lxm, (syn: S,
                  sem: M))
    **> (word, (syn: (S, head: agr: num: sg),
                sem: M))
    morphs
    (X) becomes (X, i).

% Plural
aorist_wv_plural lex_rule
    (weak_v_lxm, (syn: S,
                  sem: M))
    **> (word, (syn: (S, head: agr: num: (pl ; dl)),
                sem: M))
    morphs
    (X) becomes (X, ir).

% Perfect tense lexical rule

% Singular
perfect_v_sing lex_rule
    (v_lxm, (syn: S,
             sem: M))
    **> (word, (syn: (S, head: agr: num: sg),
                sem: M))
    morphs
    (X, ya) becomes (X, ie),
    (X, a) becomes (X, ie),
    (X) becomes (X, ie).

% Plural
perfect_v_plur lex_rule
    (v_lxm, (syn: S,
             sem: M))
    **> (word, (syn: (S, head: agr: num: (pl ; dl)),
                sem: M))
    morphs
    (X, ya) becomes (X, ier),
    (X, a) becomes (X, ier),
    (X) becomes (X, ier).

%===================================================
% Determiner rules
%===================================================

det_w lex_rule
   (dt_lxm, (syn: S,
             sem: M))
   **> (word, (syn: S,
               sem: M))
   morphs
   X becomes X.