% Type constraints
% ========================================================

cn_lxm cons (syn: (head: (noun,
                          agr: X),
                   val: (spr: @opt_det(X,_,Z),
                         mod: none)),
             sem: (index: Z,
                   store: (a_ [ ]),
                   top: (a_ [ ]))).

% "Singulare tantum" nouns are singular (e.g. cat, dog, house, gold, fun, etc.)

sing_n_lxm cons (syn: (head: (agr: (num: sg)))).

% Simple count nouns take no complements or semantic arguments

simple_sn_lxm cons (syn: (val: (comps: [  ] )),
                    sem: (index: (a_ X),
                          restr: (a_ [_-[X]]))).

% ========================================================
% Adjectival constraints
% ========================================================


% All simple adjectives have empty comps and modify rightwards for now
%
adj_lxm cons (syn: (val: (comps: [  ],
                          mod: (right))),
              sem: (restr: (a_ [ _-[_,_] ] ))).

% ========================================================
% Verbal constraints
% ========================================================

% Verbal lexemes select a nominative NP specifier and agree with it.***********
%
v_lxm cons (syn: (head: (verb, agr: A),
                  val: (spr: [  @np(A,(a_ X),nom)  ],
                  mod: none )) ,
            sem: (index: (a_ E), 
                  restr: (a_  [  exists-[E,_-[E,X|_]]]  ),
                  top: (a_ []),
                  store: (a_ []))).

% Transitive verbal lexemes require one accusative NP complement.
%
trans_v_lxm cons (syn: (val: (comps: [  @np(_,(a_ V),acc)  ] )),
                              sem : (restr : (a_ [ _-[_,_-[_,_,V]]] ))).

% Intransitive verbal lexemes require no complements.
%
intr_v_lxm cons (syn: (val: (comps: [ ] )),
                 sem: restr: (a_ [ _-[_,_-[_,_]]]  )).

% =======================================================
% Determiner constraints
% =======================================================

% All determiners have empty valence
%
dt_lxm cons (syn:(head: (det),
                  val: (spr: [ ],
                        comps: [ ],
                        mod: none ) ),
             sem: (index: (a_ X),
                   restr: (a_ [ ]),
                   top: (a_ []),
                   store: (a_  [_-[X,_]] ) )).