:- set_prolog_flag(double_quotes, chars).
:- use_module(library(clpfd)).

%% i-iii
roman_3(1) --> "i".          roman_3(2) --> "ii".    roman_3(3) --> "iii".

%% iv, v
roman_5(N) --> roman_3(N).   roman_5(4) --> "iv".    roman_5(5) --> "v".

% vi-viii
roman_8(N)  --> roman_5(N).
roman_8(N5) --> roman_5(5), roman_3(N), { N5 #= N + 5 }.

% ix
roman_9(N) --> roman_8(N).
roman_9(9) --> "ix".

% x
roman_10(N) --> roman_9(N).
roman_10(10) --> "x".

% xi-xxxix
roman_30(N) --> roman_10(N).
roman_30(N) --> roman_10(10), roman_10(N1), { N #= 10 + N1 }.
roman_30(N) --> roman_10(10), roman_10(10), roman_10(N1), { N #= 20 + N1 }.
roman_30(N) --> roman_10(10), roman_10(10), roman_10(10), roman_9(N1), { N #= 30 + N1 }.

% xl..xlix
roman_40(N) --> roman_30(N).
roman_40(40) --> "xl".
roman_40(N)  --> "xl", roman_9(N1), { N #= 40 + N1 }.

% l..lxxxix
roman_50(N)  --> roman_40(N).
roman_50(50) --> "l".
roman_50(N)  --> "l", roman_30(N1), { N #= 50 + N1 }.

% xc..xcix
roman_90(N) --> roman_50(N).
roman_90(90) --> "xc".
roman_90(N)  --> "xc", roman_9(N1), { N #= 90 + N1 }.

% c
roman_100(N) --> roman_90(N).
roman_100(100) --> "c".

% c..cccxcix
roman_300(N) --> roman_100(N).
roman_300(N) --> roman_100(100), roman_100(N1), { N #= 100 + N1 }.
roman_300(N) --> roman_100(100), roman_100(100), roman_100(N1), { N #= 200 + N1 }.
roman_300(N) --> roman_100(100), roman_100(100), roman_100(100), roman_90(N1), { N #= 300 + N1 }.

% cd
roman_400(N) --> roman_300(N).
roman_400(400) --> "cd".
roman_400(N) --> "cd", roman_90(N1), { N #= 400 + N1 }.

% d...dcccxcix
roman_500(N) --> roman_400(N).
roman_500(N) --> "d", roman_300(N1), { N #= 500 + N1 }.

% cm
roman_900(N) --> roman_500(N).
roman_900(900) --> "cm".
roman_900(N) --> "cm", roman_90(N1), { N #= 900 + N1 }.

% m
roman_1000(N) --> roman_900(N).
roman_1000(1000) --> "m".

% mm...mmm
roman_3000(N) --> roman_1000(N).
roman_3000(N) --> roman_1000(1000), roman_1000(N1), { N #= 1000 + N1 }.
roman_3000(N) --> roman_1000(1000), roman_1000(1000), roman_1000(N1), { N #= 2000 + N1 }.
roman_3000(N) --> roman_1000(1000), roman_1000(1000), roman_1000(1000), roman_900(N1), { N #= 3000 + N1 }.

roman(N) --> roman_3000(N).

roman(Atom, Value) :- phrase(roman(Value), Chars), atom_chars(Atom, Chars).

:- begin_tests(roman).

test(i)        :- roman(i,          1).
test(ii)       :- roman(ii,         2).
test(iii)      :- roman(iii,        3).
test(iv)       :- roman(iv,         4).
test(v)        :- roman(v,          5).
test(vi)       :- roman(vi,         6).
test(vii)      :- roman(vii,        7).
test(viii)     :- roman(viii,       8).
test(ix)       :- roman(ix,         9).
test(x)        :- roman(x,         10).
test(xi)       :- roman(xi,        11).
test(xii)      :- roman(xii,       12).
test(xiii)     :- roman(xiii,      13).
test(xiv)      :- roman(xiv,       14).
test(xv)       :- roman(xv,        15).
test(xvi)      :- roman(xvi,       16).
test(xvii)     :- roman(xvii,      17).
test(xviii)    :- roman(xviii,     18).
test(xix)      :- roman(xix,       19).
test(xx)       :- roman(xx,        20).
test(xxi)      :- roman(xxi,       21).
test(xxii)     :- roman(xxii,      22).
test(xxiii)    :- roman(xxiii,     23).
test(xxiv)     :- roman(xxiv,      24).
test(xxv)      :- roman(xxv,       25).
test(xxvi)     :- roman(xxvi,      26).
test(xxvii)    :- roman(xxvii,     27).
test(xxviii)   :- roman(xxviii,    28).
test(xxix)     :- roman(xxix,      29).
test(xxx)      :- roman(xxx,       30).
test(xxxi)     :- roman(xxxi,      31).
test(xxxii)    :- roman(xxxii,     32).
test(xxxiii)   :- roman(xxxiii,    33).
test(xxxiv)    :- roman(xxxiv,     34).
test(xxxv)     :- roman(xxxv,      35).
test(xxxvi)    :- roman(xxxvi,     36).
test(xxxvii)   :- roman(xxxvii,    37).
test(xxxviii)  :- roman(xxxviii,   38).
test(xxxix)    :- roman(xxxix,     39).
test(xl)       :- roman(xl,        40).
test(xli)      :- roman(xli,       41).
test(xlii)     :- roman(xlii,      42).
test(xliii)    :- roman(xliii,     43).
test(xliv)     :- roman(xliv,      44).
test(xlv)      :- roman(xlv,       45).
test(xlvi)     :- roman(xlvi,      46).
test(xlvii)    :- roman(xlvii,     47).
test(xlviii)   :- roman(xlviii,    48).
test(xlix)     :- roman(xlix,      49).
test(l)        :- roman(l,         50).
test(li)       :- roman(li,        51).
test(lii)      :- roman(lii,       52).
test(liii)     :- roman(liii,      53).
test(liv)      :- roman(liv,       54).
test(lv)       :- roman(lv,        55).
test(lvi)      :- roman(lvi,       56).
test(lvii)     :- roman(lvii,      57).
test(lviii)    :- roman(lviii,     58).
test(lix)      :- roman(lix,       59).
test(lx)       :- roman(lx,        60).
test(lxi)      :- roman(lxi,       61).
test(lxii)     :- roman(lxii,      62).
test(lxiii)    :- roman(lxiii,     63).
test(lxiv)     :- roman(lxiv,      64).
test(lxv)      :- roman(lxv,       65).
test(lxvi)     :- roman(lxvi,      66).
test(lxvii)    :- roman(lxvii,     67).
test(lxviii)   :- roman(lxviii,    68).
test(lxix)     :- roman(lxix,      69).
test(lxx)      :- roman(lxx,       70).
test(lxxi)     :- roman(lxxi,      71).
test(lxxii)    :- roman(lxxii,     72).
test(lxxiii)   :- roman(lxxiii,    73).
test(lxxiv)    :- roman(lxxiv,     74).
test(lxxv)     :- roman(lxxv,      75).
test(lxxvi)    :- roman(lxxvi,     76).
test(lxxvii)   :- roman(lxxvii,    77).
test(lxxviii)  :- roman(lxxviii,   78).
test(lxxix)    :- roman(lxxix,     79).
test(lxxx)     :- roman(lxxx,      80).
test(lxxxi)    :- roman(lxxxi,     81).
test(lxxxii)   :- roman(lxxxii,    82).
test(lxxxiii)  :- roman(lxxxiii,   83).
test(lxxxiv)   :- roman(lxxxiv,    84).
test(lxxxv)    :- roman(lxxxv,     85).
test(lxxxvi)   :- roman(lxxxvi,    86).
test(lxxxvii)  :- roman(lxxxvii,   87).
test(lxxxviii) :- roman(lxxxviii,  88).
test(lxxxix)   :- roman(lxxxix,    89).
test(xc)       :- roman(xc,        90).
test(xci)      :- roman(xci,       91).
test(xcii)     :- roman(xcii,      92).
test(xciii)    :- roman(xciii,     93).
test(xciv)     :- roman(xciv,      94).
test(xcv)      :- roman(xcv,       95).
test(xcvi)     :- roman(xcvi,      96).
test(xcvii)    :- roman(xcvii,     97).
test(xcviii)   :- roman(xcviii,    98).
test(xcix)     :- roman(xcix,      99).
test(c)        :- roman(c,        100).

%% spot checks the rest of the way
test(clxvi)    :- roman(clxvi,    166).
test(cciv)     :- roman(cciv,     204).
test(cccxcix)  :- roman(cccxcix,  399).
test(mdccclxxxviii) :- roman(mdccclxxxviii, 1888).
test(mcmxlviii) :- roman(mcmxlviii, 1948).
test(mmmcmxlviii) :- roman(mmmcmxlviii, 3948).

:- end_tests(roman).
