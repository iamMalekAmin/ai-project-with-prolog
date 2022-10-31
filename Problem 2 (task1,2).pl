%First line
connected(new_elmarg,elmarg).
connected(elmarg,ezbet_elnakhl).
connected(ezbet_elnakhl,ain_shams).
connected(ain_shams,elmatareyya).
connected(elmatareyya,helmeyet_elzaitoun).
connected(helmeyet_elzaitoun,hadayeq_elzaitoun).
connected(hadayeq_elzaitoun,saray_elqobba).
connected(saray_elqobba,hammamat_elqobba).
connected(hammamat_elqobba,kobri_elqobba).
connected(kobri_elqobba,manshiet_elsadr).
connected(manshiet_elsadr,eldemerdash).
connected(eldemerdash,ghamra).
connected(ghamra,alshohadaa).
connected(alshohadaa,urabi).
connected(urabi,nasser).
connected(nasser,sadat).
connected(sadat,saad_zaghloul).
connected(saad_zaghloul, alsayyeda_zeinab).
connected(alsayyeda_zeinab,elmalek_elsaleh).
connected(elmalek_elsaleh,margirgis).
connected(margirgis,elzahraa).
connected(elzahraa,dar_elsalam).
connected(dar_elsalam,hadayeq_elmaadi).
connected(hadayeq_elmaadi,maadi).
connected(maadi,thakanat_elmaadi).
connected(thakanat_elmaadi,tora_elbalad).
connected(tora_elbalad,kozzika).
connected(kozzika,tora_elasmant).
connected(tora_elasmant,elmaasara).
connected(elmaasara,hadayeq_helwan).
connected(hadayeq_helwan,wadi_hof).
connected(wadi_hof,helwan_university).
connected(helwan_university,ain_helwan).
connected(ain_helwan,helwan).
%second line
connected(shobra_elkheima,koliet_elzeraa).
connected(koliet_elzeraa,mezallat).
connected(mezallat,khalafawy).
connected(khalafawy,sainte_teresa).
connected(sainte_teresa,road_elfarag).
connected(road_elfarag,massara).
connected(massara,alshohadaa).
connected(alshohadaa,ataba).
connected(ataba,naguib).
connected(naguib,sadat).
connected(sadat,opera).
connected(opera,dokki).
connected(dokki,bohooth).
connected(bohooth,cairo_university).
connected(cairo_university,faisal).
connected(faisal,giza).
connected(giza,omm_elmisryeen).
connected(omm_elmisryeen,sakiat_mekki).
connected(sakiat_mekki,elmounib).
%problem 2
% task one
% base case
path(Y,Y,_,[]).

path(X,Y,N,L):-
    (
    % n is the number of stations crossed
    % 'any' is mean any number of stations
    (N == 'any') ->
    % 'z' the station elly gnb lstation elly ana bad2 beha 'x'
    connected(X,Z),
    % fytl3 y check el 'z' m3 el 'y' whkza tany
    % if 'z' , 'y'  is base case , print list
    path(Z,Y,N,R),
    % b5zn l7aga l gabha l awl fe el R
    L = [ [ X,Z ] | R];

    % if n is fixed number and didnt go to base case , return false
    (N>0)->
    connected(X,Z),
    NewN is N-1,
    path(Z,Y,NewN,R),
    L = [ [ X,Z ] | R]
    ).



 %code of task2
connecte(M,N):-
    % search for first station 'm' or in the second ter
    connected(M,N);
    connected(N,M).
% store stations elly bt3ml relation with 'm' station in list
memberbefore(M,[N|R]):-
   M = N;
   memberbefore(M,R).

findSt(St,A,L):-
    connecte(St,N),
   \+ memberbefore(N,A),
    findSt(St,[N|A],L).

findSt(_,L,L).
% _ is mean dont care
findFacts(St,L):-
   findSt(St,[],L).

ctList( [] , 0 ) .

ctList([_|T] , R1):-
    ctList(T ,R2),
    R1 is R2+1.

nstations(St,N):-
    findFacts(St,L),
    ctList(L,N).









