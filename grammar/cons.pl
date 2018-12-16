% Type constraints
% ========================================================

% "Singulare tantum" nouns are singular (e.g. cat, dog, house, gold, fun, etc.)

sing_n_lxm cons (syn:(head: (agr : (num: sg)))).

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

% Intransitive verbal lexemes require no complements.
%
intr_v_lxm cons (syn: (val : (comps: [   ] ) ),
                            sem: restr: (a_ [ _-[_,_-[_,_]]]  )).