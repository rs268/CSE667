% ==================================================
% Lexicon
% ==================================================

%  ================= Noun Lexemes ==================

%  =========== Count Singular Simple Noun ==========

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

% ==================================================
% Adjectives
% ==================================================

% ==================== Simple ======================

carne --->
	(adj_lxm,
	 sem: restr: (a_ [red-_] )).

firin --->
	(adj_lxm,
	 sem: restr: (a_ [dead-_] )).

laara --->
	(adj_lxm,
	 sem: restr: (a_ [flat-_] )).

melin --->
	(adj_lxm,
	 sem: restr: (a_ [dear-_] )).

more --->
	(adj_lxm,
	 sem: restr: (a_ [black-_] )).

ninque --->
	(adj_lxm,
	 sem: restr: (a_ [white-_] )).

vanya --->
	(adj_lxm,
	 sem: restr: (a_ [beautiful-_] )).

% ==================================================
% Verbs
% ==================================================

% Intransitive

linda --->
	(is_v_lxm,
	 sem: restr: (a_ [ _-[_,sing-_]] )).

sil --->
	(iw_v_lxm,
	 sem: restr: (a_ [  _-[_,shine-_]] )).

vil --->
	(iw_v_lxm,
	 sem: restr: (a_ [ _-[_,fly-_]] )).

% Transitive

henta --->
	(ts_v_lxm,
	 sem: restr: (a_ [ _-[_,eye-_]] )).

mat --->
	(tw_v_lxm,
	 sem: restr: (a_ [ _-[_,eat-_]] )).

tam --->
	(tw_v_lxm,
	 sem: restr: (a_ [ _-[_,tap-_]] )).

tir --->
	(tw_v_lxm,
	 sem: restr: (a_ [ _-[_,watch-_]] )).