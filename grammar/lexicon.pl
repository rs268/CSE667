% ==================================================
% Lexicon
% ==================================================

%  ================= Noun Lexemes ==================

% atan -->
% 	cn_lxm,
% 	(syn: (head: agr: gnd: neut),
% 	 sem: ( restr: (a_ [man-_] ) )).

alda --->
	simple_sn_lxm,
	(syn: (head: agr: gnd: neut),
	 sem: ( restr: (a_ [tree-_] ) )).

elda --->
	simple_sn_lxm,
	(syn: (head: agr: gnd: neut),
	 sem : ( restr: (a_ [elf-_] ) )).

elen --->
	simple_sn_lxm,
	(syn: (head: agr: gnd: neut),
	 sem: ( restr: (a_ [star-_] ) )).

malle --->
	simple_sn_lxm,
	(syn: (head: agr: gnd: neut),
     sem: (restr: (a_ [road-_] ) )).

rocco --->
	simple_sn_lxm,
	(syn: (head: agr: gnd: neut),
	 sem: (restr: (a_ [horse-_] ) )).

tyelle --->
	simple_sn_lxm,
	(sem: ( restr: (a_ [elf-_] ) )).

vala --->
	simple_sn_lxm,
	(syn: (head: agr: gnd: mas),
	 sem: ( restr: (a_ [angel-_] ) )).

valie --->
	simple_sn_lxm,
	(syn: (head: agr: gnd: fem),
     sem: ( restr: (a_ [angel-_] ) )).

% ==================================================
% Determiners 
% ==================================================

i --->
	(dt_lxm,
		sem: store: (a_ [ the-[_, _ & _] ] )).