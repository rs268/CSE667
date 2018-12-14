% Type constraints
% ========================================================

% All common nouns are nominal and third person.

% cn_lxm cons (syn : (head: (noun, 
%                            agr : (per : trd)),
%                            mod : none ),
%              sem: (store: (a_ [ ]),
%                    top: (a_ [ ]) ) ).

cn_lxm cons (syn: (head: (noun, agr: (per: trd)))).

% "Singulare tantum" nouns are singular (e.g. cat, dog, house, gold, fun, etc.)

sing_n_lxm cons (syn:(head: (agr : (num: sg)))).

% Simple count nouns take no complements or semantic arguments

simple_sn_lxm cons (syn: (val : (comps : [  ] )),
                    sem : (index : (a_ X),
                           restr : (a_ [_-[X]]))).