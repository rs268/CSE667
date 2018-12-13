% Grammar Rules
% ------------------------------------------------------------------------------

% ==== HEAD SPR RULE ====

head_spr_struc rule
(phrase,(syn:(head : Y, 
                    val : (spr:[], 
                            comps:[], 
                            mod : M))))
===>
cat> (X), 
cat> (syn_sign, syn:(head : Y,
                                val : (spr:[X], 
                                        comps:[],
                                        mod : M))).


% ==== HEAD COMPS RULE ====

head_comps_struc rule
(phrase,(syn:(head : Z, 
                    val : (spr: X, 
                             comps:[],
                             mod : M))))
===>
cat> (word, syn:(head : Z,
                 val : (spr: X, 
                         comps: (Y,ne_list),
                         mod : M ))),
cats> (Y). 


% ==== Rightward HEAD MOD RULE ====

r_head_mod_struc rule
(phrase,(syn: X))
===>
cat> (syn_sign, syn:(val : (spr: [ ], 
                                         comps : [ ],
                                         mod : (right, sign : Y)))),
cat> (Y, syn : X). 

% ==== Leftward HEAD MOD RULE ====

l_head_mod_struc rule
(phrase,(syn: X))
===>
cat> (Y, syn : X),
cat> (syn_sign, syn:(val : (spr: [ ], 
					comps : [ ],
					mod : (left, sign : Y)))).





