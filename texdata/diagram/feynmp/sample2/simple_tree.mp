% simple_tree.mp -- do not edit, generated automatically by sample2.tex
input feynmp
require_RCS_revision "1.30";
beginchar(1, 40*2.84526pt#, 25*2.84526pt#, 0);
"feynmf: 1";
LaTeX_unitlength:=2.84526pt;
subgraph (0, 0, w, h);
vinit;
pickup pencircle scaled thin;
vleft (__i);
vright (__o1, __o2, __o3);
vconnect ("fermion", __i, __v1, __o1);
vconnect ("photon", __v1, __v2);
vconnect ("fermion", __o2, __v2, __o3);
vfreeze;
vdraw;
endsubgraph;
endchar;
% the end.
end.
endinput;
