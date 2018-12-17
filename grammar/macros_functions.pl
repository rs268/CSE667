% Noun phrase
np(A,V,C) macro (syn_sign, syn: (head: (noun,                        
                                        agr: A,
                                        case: C),
                                 val: (spr: [ ],
                                       comps: [ ] )),
                            sem: index: V).

% Optional Determiners
opt_det(X,Y,Z) macro ([] ; [ (syn_sign, (syn: (head: (det,
                                                      agr: X,
                                                      count: Y)),
                                         sem: (index: Z))) ]).

% Nominal
n(A) macro (syn_sign, syn: (head : (noun,
                                    agr: A),                        
                         val : (spr :  [ _ ],
                                comps: [ ] ))).

% frst_psn_prn_sing macro (syn: (head: (noun, agr: num: sg),
%                                val: (spr: [ ],
%                                      comps: [ ],
%                                      mod: none)),
%                          sem : store : (a_ [ _-[_,(speaker-_) & _ ]]  )).