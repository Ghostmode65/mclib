local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function() return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...) local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30) if (v1(v30,2)==81) then local v88=0;while true do if (v88==0) then v19=v0(v3(v30,1,1));return "";end end else local v89=0;local v90;while true do if (v89==0) then v90=v2(v0(v30,16));if v19 then local v122=v5(v90,v19);v19=nil;return v122;else return v90;end break;end end end end);local function v20(v31,v32,v33) if v33 then local v91=0 -0 ;local v92;while true do if (v91==(0 -(0 + 0))) then v92=(v31/((2 -0)^(v32-(1 -0))))%((4 -2)^(((v33-((1685 -(68 + 997)) -(555 + 64))) -(v32-1)) + (932 -(857 + (1344 -(226 + 1044)))))) ;return v92-(v92%1) ;end end else local v93=568 -(367 + 201) ;local v94;while true do if (v93==(927 -(214 + (2350 -(1523 + 114))))) then v94=(1 + 1)^(v32-(1 + 0)) ;return (((v31%(v94 + v94))>=v94) and (878 -(282 + 595))) or (0 -0) ;end end end end local function v21() local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22() local v35,v36=v1(v16,v18,v18 + (119 -(32 + 85)) );v18=v18 + 2 + 0 ;return (v36 * 256) + v35 ;end local function v23() local v37,v38,v39,v40=v1(v16,v18,v18 + 1 + 2 );v18=v18 + (961 -(892 + 65)) ;return (v40 * (40022563 -(23245697 -(87 + 263)))) + (v39 * (121138 -55602)) + (v38 * (469 -(393 -(67 + 113)))) + v37 ;end local function v24() local v41=0 + 0 ;local v42;local v43;local v44;local v45;local v46;local v47;while true do if (v41==(0 -0)) then v42=v23();v43=v23();v41=1 + 0 ;end if (v41==(11 -8)) then if (v46==(952 -(802 + 150))) then if (v45==(0 -0)) then return v47 * (438 -(145 + 293)) ;else local v123=(430 -(44 + 386)) -0 ;while true do if (((1486 -(998 + 488)) + 0)==v123) then v46=998 -(915 + 82) ;v44=0 -0 ;break;end end end elseif (v46==(1193 + 854)) then return ((v45==(0 -0)) and (v47 * (((378 + 810) -(1069 + 118))/0))) or (v47 * NaN) ;end return v8(v47,v46-(2320 -1297) ) * (v44 + (v45/((3 -1)^(10 + 42)))) ;end if (v41==((3 + 0) -1)) then v46=v20(v43,21 + 0 ,31);v47=((v20(v43,823 -(368 + 423) )==1) and  -(3 -2)) or (19 -(10 + 8)) ;v41=11 -8 ;end if (v41==1) then v44=1;v45=(v20(v43,443 -(416 + 26) ,(835 -(201 + 571)) -43 ) * (((1139 -(116 + 1022)) + 1)^((232 -176) -24))) + v42 ;v41=2;end end end local function v25(v48) local v49=0 + 0 ;local v50;local v51;while true do if (v49==(1 + (1747 -(760 + 987)))) then v50=v3(v16,v18,(v18 + v48) -(3 -2) );v18=v18 + v48 ;v49=(1920 -(1789 + 124)) -5 ;end if ((3 -1)==v49) then v51={};for v111=860 -(814 + 45) , #v50 do v51[v111]=v2(v1(v3(v50,v111,v111)));end v49=7 -4 ;end if (v49==(0 + 0)) then v50=nil;if  not v48 then local v117=0 -0 ;while true do if (v117==0) then v48=v23();if (v48==0) then return "";end break;end end end v49=1 + 0 ;end if (v49==(9 -(772 -(745 + 21)))) then return v6(v51);end end end local v26=v23;local function v27(...) return {...},v12("#",...);end local function v28() local v52=(function() return function(v95,v96,v97,v98,v99,v100,v101,v102,v103) local v104=(function() return 0;end)();local v95=(function() return;end)();local v96=(function() return;end)();while true do if (v104==(0 -0)) then local v118=(function() return 0 + 0 ;end)();while true do if (v118==(1 + 0)) then v104=(function() return 1 + 0 ;end)();break;end if (v118==(836 -(660 + 176))) then v95=(function() return 0;end)();v96=(function() return nil;end)();v118=(function() return 1;end)();end end end if (v104==1) then while true do if (v95==0) then v96=(function() return v97();end)();if (v98(v96, #",", #"\\")==(0 + 0)) then local v126=(function() return 0;end)();local v127=(function() return;end)();local v128=(function() return;end)();local v129=(function() return;end)();while true do if (v126~=(205 -(14 + 188))) then else if (v98(v128, #"xxx", #"nil")== #"}") then v129[ #"xnxx"]=(function() return v101[v129[ #".dev"]];end)();end v102[v103]=(function() return v129;end)();break;end if ((676 -(534 + 141))~=v126) then else v129=(function() return {v99(),v99(),nil,nil};end)();if (v127==0) then local v132=(function() return 0 + 0 ;end)();local v133=(function() return;end)();while true do if (0==v132) then v133=(function() return 0;end)();while true do if (v133~=0) then else v129[ #"-19"]=(function() return v99();end)();v129[ #"http"]=(function() return v99();end)();break;end end break;end end elseif (v127== #"[") then v129[ #"xnx"]=(function() return v100();end)();elseif (v127==2) then v129[ #"-19"]=(function() return v100() -((2 + 0)^16) ;end)();elseif (v127~= #"xxx") then else local v568=(function() return 0 -0 ;end)();local v569=(function() return;end)();while true do if (v568==0) then v569=(function() return 0;end)();while true do if (v569==(0 -0)) then v129[ #"gha"]=(function() return v100() -((5 -3)^16) ;end)();v129[ #"http"]=(function() return v99();end)();break;end end break;end end end v126=(function() return 2;end)();end if (v126==(2 + 0)) then if (v98(v128, #"<", #":")== #"]") then v129[2]=(function() return v101[v129[2 + 0 ]];end)();end if (v98(v128,398 -(115 + 281) ,4 -2 )~= #"[") then else v129[ #"19("]=(function() return v101[v129[ #"19("]];end)();end v126=(function() return 3;end)();end if (0==v126) then v127=(function() return v98(v96,2 + 0 , #"-19");end)();v128=(function() return v98(v96, #"asd1",6);end)();v126=(function() return 2 -1 ;end)();end end end break;end end return v95,v96,v97,v98,v99,v100,v101,v102,v103;end end end;end)();local v53=(function() return function(v105,v106,v107) local v108=(function() return 0;end)();while true do if (0==v108) then v105[v106-#" " ]=(function() return v107();end)();return v105,v106,v107;end end end;end)();local v54=(function() return {};end)();local v55=(function() return {};end)();local v56=(function() return {};end)();local v57=(function() return {v54,v55,nil,v56};end)();local v58=(function() return v23();end)();local v59=(function() return {};end)();for v67= #"]",v58 do local v68=(function() return 867 -(550 + 317) ;end)();local v69=(function() return;end)();local v70=(function() return;end)();local v71=(function() return;end)();while true do if (v68==(1 -0)) then v71=(function() return nil;end)();while true do if (v69~=1) then else if (v70== #"~") then v71=(function() return v21()~=(0 -0) ;end)();elseif (v70==2) then v71=(function() return v24();end)();elseif (v70~= #"asd") then else v71=(function() return v25();end)();end v59[v67]=(function() return v71;end)();break;end if (v69==0) then local v125=(function() return 0;end)();while true do if (v125==(2 -1)) then v69=(function() return 286 -(134 + 151) ;end)();break;end if (v125~=(1665 -(970 + 695))) then else v70=(function() return v21();end)();v71=(function() return nil;end)();v125=(function() return 1;end)();end end end end break;end if (v68~=0) then else v69=(function() return 0;end)();v70=(function() return nil;end)();v68=(function() return 1 -0 ;end)();end end end v57[ #"19("]=(function() return v21();end)();for v72= #"/",v23() do FlatIdent_25011,Descriptor,v21,v20,v22,v23,v59,v54,v72=(function() return v52(FlatIdent_25011,Descriptor,v21,v20,v22,v23,v59,v54,v72);end)();end for v73= #"}",v23() do v55,v73,v28=(function() return v53(v55,v73,v28);end)();end return v57;end local function v29(v61,v62,v63) local v64=v61[1991 -((1205 -623) + 1408) ];local v65=v61[2];local v66=v61[10 -7 ];return function(...) local v74=v64;local v75=v65;local v76=v66;local v77=v27;local v78=1 -0 ;local v79= -(3 -2);local v80={};local v81={...};local v82=v12("#",...) -(1 -0) ;local v83={};local v84={};for v109=241 -(187 + 54) ,v82 do if (v109>=v76) then v80[v109-v76 ]=v81[v109 + (781 -(162 + 618)) ];else v84[v109]=v81[v109 + 1 + 0 ];end end local v85=(v82-v76) + 1 ;local v86;local v87;while true do local v110=0 + 0 ;while true do if (v110==((1 + 0) -0)) then if (v87<=(38 -15)) then if (v87<=(1 + 10)) then if ((2871>1959) and (v87<=(1641 -(1373 + (1002 -(396 + 343)))))) then if (v87<=2) then if ((1286<=2672) and (v87<=0)) then if (v84[v86[1002 -(40 + 411 + 549) ]]==v86[2 + 2 ]) then v78=v78 + (1 -0) ;else v78=v86[4 -1 ];end elseif (v87>1) then local v195=v86[2];local v196=v86[(2865 -(29 + 1448)) -(746 + 638) ];local v197=v195 + 1 + (1390 -(135 + 1254)) ;local v198={v84[v195](v84[v195 + (342 -(218 + 123)) ],v84[v197])};for v337=1,v196 do v84[v197 + v337 ]=v198[v337];end local v199=v198[1582 -(1535 + 46) ];if (v199 or (734<=401)) then v84[v197]=v199;v78=v86[3 + 0 ];else v78=v78 + (3 -2) + 0 ;end else local v200=v86[562 -(306 + 254) ];v84[v200](v13(v84,v200 + 1 ,v86[1 + (9 -7) ]));end elseif (v87<=(5 -2)) then v84[v86[1469 -(899 + 379 + 189) ]]={};elseif (v87==4) then local v201=0 + 0 ;local v202;local v203;local v204;local v205;while true do if (v201==((1527 -(389 + 1138)) -(574 -(102 + 472)))) then v202=v86[605 -(253 + 15 + 335) ];v203,v204=v77(v84[v202](v13(v84,v202 + (291 -(60 + 230)) ,v86[575 -(237 + 189 + 146) ])));v201=1;end if (1==v201) then v79=(v204 + v202) -(1 + 0) ;v205=1456 -(282 + 1174) ;v201=2;end if ((v201==2) or (2167>=3426)) then for v570=v202,v79 do local v571=811 -(531 + 38 + 242) ;while true do if ((764<3285) and (v571==(0 -0))) then v205=v205 + 1 ;v84[v570]=v203[v205];break;end end end break;end end else v84[v86[1547 -(320 + 1225) ]]=v84[v86[1 + 2 ]][v86[1028 -((1256 -550) + 318) ]];end elseif (v87<=((771 + 488) -((2185 -(157 + 1307)) + 530))) then if (v87<=(1277 -((2804 -(821 + 1038)) + 326))) then local v137=0 -0 ;local v138;while true do if ((2499==2499) and (v137==(1 + 0))) then v138=v86[702 -(271 + 429) ];v84[v138]=v84[v138](v13(v84,v138 + (2 -1) + 0 ,v86[1503 -(1408 + 11 + 81) ]));v78=v78 + 1 ;v86=v74[v78];v137=(1932 -844) -(461 + 625) ;end if (v137==((480 + 810) -(993 + 295))) then v84[v86[1 + 1 ]][v86[1174 -(418 + 753) ]]=v84[v86[2 + 2 ]];v78=v78 + 1 + 0 ;v86=v74[v78];v84[v86[1 + (2 -1) ]]=v86[1 + 2 ];v137=532 -(406 + 123) ;end if ((v137==(1772 -(1749 + 20))) or (692>=4933)) then v78=v78 + (1027 -(834 + 192)) ;v86=v74[v78];for v484=v86[1 + 1 ],v86[3] do v84[v484]=nil;end break;end if (v137==(1322 -(1249 + 5 + 68))) then v138=nil;v84[v86[1 + 1 ]]=v86[1148 -(466 + 679) ];v78=v78 + 1 ;v86=v74[v78];v137=1;end end elseif ((v87>7) or (3154<=2260)) then local v208=v86[4 -2 ];local v209,v210=v77(v84[v208](v13(v84,v208 + (2 -1) ,v79)));v79=(v210 + v208) -(1901 -(106 + 1794)) ;local v211=0 + 0 ;for v352=v208,v79 do v211=v211 + 1 + 0 ;v84[v352]=v209[v211];end elseif (v84[v86[5 -3 ]]==v84[v86[10 -6 ]]) then v78=v78 + (115 -(4 + 110)) ;else v78=v86[587 -(57 + 527) ];end elseif (v87<=(1436 -(41 + 1386))) then local v139=103 -(17 + 86) ;local v140;local v141;while true do if (v139==(3 + 0 + 0)) then v78=v78 + ((1 + 0) -0) ;v86=v74[v78];v141=v86[5 -3 ];v84[v141](v13(v84,v141 + ((257 -90) -((426 -(300 + 4)) + 44)) ,v86[5 -2 ]));v139=12 -8 ;end if ((v139==(1 + 0)) or (2637>3149)) then v84[v141 + 1 + 0 ]=v140;v84[v141]=v140[v86[7 -3 ]];v78=v78 + (66 -(30 + 35)) ;v86=v74[v78];v139=2;end if (v139==(2 + 0)) then v84[v86[(337 + 922) -(1043 + 214) ]]=v84[v86[11 -8 ]][v86[(3183 -1967) -(323 + 889) ]];v78=v78 + (2 -1) ;v86=v74[v78];v84[v86[582 -(361 + 219) ]]=v84[v86[3]];v139=323 -(53 + 267) ;end if (v139==(0 + 0)) then v140=nil;v141=nil;v141=v86[415 -(15 + (760 -(112 + 250))) ];v140=v84[v86[2 + 1 ]];v139=(2462 -1479) -(18 + 964) ;end if (v139==(14 -10)) then v78=v78 + 1 ;v86=v74[v78];v78=v86[3];break;end end elseif (v87>10) then local v212=0 + 0 + 0 ;local v213;local v214;while true do if (v212==(1 + 0 + 0)) then v84[v213 + (851 -(20 + 830)) ]=v214;v84[v213]=v214[v86[4 + 0 ]];break;end if (v212==(126 -(116 + 8 + 2))) then v213=v86[1 + 1 ];v214=v84[v86[741 -(542 + 98 + 98) ]];v212=(1 + 0) -0 ;end end else local v215=v86[1 + 1 ];do return v13(v84,v215,v79);end end elseif (v87<=(9 + 8)) then if (v87<=((1420 -(1001 + 413)) + 8)) then if (v87<=(31 -19)) then do return;end elseif (v87>(33 -20)) then local v216;local v217,v218;local v219;v84[v86[1553 -(1126 + 425) ]]=v84[v86[3]];v78=v78 + 1 ;v86=v74[v78];v84[v86[407 -(118 + 287) ]]=v62[v86[11 -8 ]];v78=v78 + (1122 -(118 + 1003)) ;v86=v74[v78];v84[v86[5 -3 ]]=v62[v86[380 -((316 -174) + (1117 -(244 + 638))) ]];v78=v78 + (4 -3) ;v86=v74[v78];v84[v86[1 + 1 ]]=v62[v86[980 -((1246 -(627 + 66)) + 424) ]];v78=v78 + 1 ;v86=v74[v78];v84[v86[3 -(2 -1) ]]=v62[v86[3 + 0 ]];v78=v78 + 1 + 0 ;v86=v74[v78];v84[v86[2]]=v84[v86[2 + 1 ]];v78=v78 + 1 + 0 ;v86=v74[v78];v84[v86[2 + 0 ]]=v84[v86[3]];v78=v78 + (2 -1) ;v86=v74[v78];v84[v86[5 -3 ]]=v84[v86[6 -3 ]] + v86[2 + 2 ] ;v78=v78 + 1 ;v86=v74[v78];v219=v86[9 -7 ];v217,v218=v77(v84[v219](v13(v84,v219 + (754 -(239 + 514)) ,v86[2 + 1 ])));v79=(v218 + v219) -1 ;v216=1329 -(797 + 532) ;for v370=v219,v79 do local v371=0 + 0 ;while true do if (v371==(0 + 0)) then v216=v216 + (2 -1) ;v84[v370]=v217[v216];break;end end end v78=v78 + ((1805 -(512 + 90)) -(373 + 829)) ;v86=v74[v78];v219=v86[733 -(476 + 255) ];v84[v219]=v84[v219](v13(v84,v219 + (1131 -(369 + 761)) ,v79));v78=v78 + 1 + (1906 -(1665 + 241)) ;v86=v74[v78];v84[v86[2 -0 ]]=v62[v86[5 -2 ]];v78=v78 + (239 -(64 + 174)) ;v86=v74[v78];v84[v86[1 + 1 ]]=v62[v86[(720 -(373 + 344)) -0 ]];v78=v78 + (337 -(144 + 192)) ;v86=v74[v78];v84[v86[218 -(19 + 23 + 174) ]]=v84[v86[3 + 0 ]];v78=v78 + 1 + 0 ;v86=v74[v78];v84[v86[1 + 1 ]]= #v84[v86[3]];v78=v78 + 1 ;v86=v74[v78];v84[v86[(399 + 1107) -(363 + 1141) ]]=v84[v86[1583 -((3120 -1937) + 397) ]]%v84[v86[11 -7 ]] ;v78=v78 + 1 + (0 -0) ;v86=v74[v78];v84[v86[2]]=v86[(1102 -(35 + 1064)) + 0 ] + v84[v86[1979 -(1913 + 62) ]] ;v78=v78 + 1 + 0 ;v86=v74[v78];v84[v86[5 -3 ]]= #v84[v86[3]];v78=v78 + (1934 -(565 + 1368)) ;v86=v74[v78];v84[v86[7 -5 ]]=v84[v86[1664 -(1477 + 184) ]]%v84[v86[5 -1 ]] ;v78=v78 + 1 ;v86=v74[v78];v84[v86[2 + 0 ]]=v86[3 + 0 ] + v84[v86[4]] ;v78=v78 + (857 -(564 + 292)) ;v86=v74[v78];v84[v86[2]]=v84[v86[4 -1 ]] + v86[11 -(14 -7) ] ;v78=v78 + (305 -(244 + 60)) ;v86=v74[v78];v219=v86[2 + 0 ];v217,v218=v77(v84[v219](v13(v84,v219 + (477 -(1 + 40 + 435)) ,v86[1004 -(938 + (1299 -(298 + 938))) ])));v79=(v218 + v219) -(1 + 0) ;v216=1125 -(936 + 189) ;for v372=v219,v79 do local v373=0 + 0 ;while true do if (v373==0) then v216=v216 + (1614 -(1565 + 48)) ;v84[v372]=v217[v216];break;end end end v78=v78 + 1 ;v86=v74[v78];v219=v86[2 + 0 ];v217,v218=v77(v84[v219](v13(v84,v219 + 1 ,v79)));v79=(v218 + v219) -(1139 -((2041 -(233 + 1026)) + 356)) ;v216=267 -(176 + 91) ;for v374=v219,v79 do v216=v216 + (2 -1) ;v84[v374]=v217[v216];end v78=v78 + (1 -0) ;v86=v74[v78];v219=v86[1094 -(975 + 117) ];v84[v219]=v84[v219](v13(v84,v219 + (1876 -(157 + 1718)) ,v79));v78=v78 + 1 + 0 ;v86=v74[v78];v84[v86[2]]=v84[v86[3]]%v86[4] ;v78=v78 + (3 -2) ;v86=v74[v78];v219=v86[6 -(1670 -(636 + 1030)) ];v217,v218=v77(v84[v219](v84[v219 + 1 ]));v79=(v218 + v219) -1 ;v216=0;for v377=v219,v79 do v216=v216 + (1019 -(697 + 321)) ;v84[v377]=v217[v216];end v78=v78 + 1 ;v86=v74[v78];v219=v86[5 -3 ];v84[v219](v13(v84,v219 + (1 -0) ,v79));else local v248=0 -(0 + 0) ;local v249;while true do if ((0==v248) or (3992<2407)) then v249=v86[2];v84[v249]=v84[v249](v13(v84,v249 + 1 + 0 ,v86[5 -2 ]));break;end end end elseif (v87<=(40 -25)) then local v142=v75[v86[1230 -(322 + 905) ]];local v143;local v144={};v143=v10({},{__index=function(v181,v182) local v183=611 -(602 + 9) ;local v184;while true do if ((1189 -(449 + 740))==v183) then v184=v144[v182];return v184[873 -(826 + 46) ][v184[949 -(245 + 702) ]];end end end,__newindex=function(v185,v186,v187) local v188=v144[v186];v188[3 -2 ][v188[1 + 1 ]]=v187;end});for v190=1899 -(260 + 1638) ,v86[444 -(39 + 343 + 58) ] do local v191=0 -0 ;local v192;while true do if ((v191==((3 -2) + 0)) or (2902>4859)) then if ((1679<4359) and (v192[1 -0 ]==33)) then v144[v190-(2 -1) ]={v84,v192[3]};else v144[v190-(1 -0) ]={v62,v192[1693 -(1121 + 569) ]};end v83[ #v83 + 1 ]=v144;break;end if ((1913<4670) and (v191==(214 -(22 + 192)))) then v78=v78 + (684 -(483 + 200)) ;v192=v74[v78];v191=1464 -((2455 -1051) + 59) ;end end end v84[v86[5 -3 ]]=v29(v142,v143,v63);elseif ((v87>16) or (2846<879)) then local v250=v86[2 -0 ];local v251,v252=v77(v84[v250](v84[v250 + (766 -(468 + 297)) ]));v79=(v252 + v250) -(563 -(334 + (1596 -(34 + 1334)))) ;local v253=0 + 0 ;for v380=v250,v79 do v253=v253 + (3 -(2 + 0)) ;v84[v380]=v251[v253];end else v78=v86[6 -3 ];end elseif ((4588==4588) and (v87<=(1303 -(1035 + 248)))) then if ((v87<=((53 -(20 + 1)) -14)) or (347==2065)) then local v146;local v147;v147=v86[2];v146=v84[v86[1 + 2 + 0 ]];v84[v147 + ((556 -(134 + 185)) -(141 + (1228 -(549 + 584)))) ]=v146;v84[v147]=v146[v86[4 + 0 ]];v78=v78 + 1 ;v86=v74[v78];v84[v86[4 -2 ]]=v84[v86[(691 -(314 + 371)) -3 ]];v78=v78 + 1 ;v86=v74[v78];v84[v86[6 -4 ]]=v84[v86[1 + 2 ]][v86[10 -6 ]];v78=v78 + 1 + 0 ;v86=v74[v78];v147=v86[2 + 0 ];v84[v147](v13(v84,v147 + (1 -0) ,v86[2 + 1 ]));v78=v78 + (164 -(92 + 71)) ;v86=v74[v78];v78=v86[3];elseif (v87==(10 + 9)) then v84[v86[(970 -(478 + 490)) -0 ]]=v62[v86[768 -(574 + 102 + 89) ]];else local v257=v86[2 + 0 ];local v258=v84[v257];for v383=v257 + (2 -1) ,v86[2 + 1 ] do v7(v258,v84[v383]);end end elseif (v87<=(870 -((1426 -(786 + 386)) + 595))) then local v160=126 -(55 + (229 -158)) ;local v161;local v162;while true do if ((9 -2)==v160) then v86=v74[v78];if (v84[v86[2]]==v84[v86[1794 -(573 + 1217) ]]) then v78=v78 + (2 -1) ;else v78=v86[1 + 2 ];end break;end if (v160==5) then v84[v162]=v161[v86[1383 -(1055 + 324) ]];v78=v78 + (1 -0) ;v86=v74[v78];v160=945 -(714 + 225) ;end if (v160==(0 -(1340 -(1093 + 247)))) then v161=nil;v162=nil;v162=v86[2];v160=(1 + 0) -0 ;end if ((v160==(1 + 1 + 2)) or (1311>2697)) then v162=v86[2 -0 ];v161=v84[v86[809 -(118 + 688) ]];v84[v162 + (49 -(25 + 23)) ]=v161;v160=1 + 4 ;end if (v160==((7495 -5607) -(927 + 959))) then v78=v78 + (3 -2) ;v86=v74[v78];v162=v86[734 -(16 + (2429 -1713)) ];v160=5 -2 ;end if ((v160==(100 -(11 + 86))) or (2717>3795)) then v84[v162]=v84[v162](v84[v162 + ((5 -3) -1) ]);v78=v78 + 1 ;v86=v74[v78];v160=(726 -437) -(175 + 110) ;end if ((v160==(3 + 3)) or (1081<391)) then v162=v86[2];v84[v162]=v84[v162](v84[v162 + 1 ]);v78=v78 + (2 -1) ;v160=(130 -96) -27 ;end if ((v160==(1797 -(503 + 1293))) or (121>3438)) then v161=v84[v86[8 -5 ]];v84[v162 + (3 -2) ]=v161;v84[v162]=v161[v86[3 + 1 ]];v160=2;end end elseif (v87==22) then v84[v86[1063 -(810 + 251) ]]= #v84[v86[3 + 0 + 0 ]];else v84[v86[2]]=v86[1 + 2 ] + v84[v86[4 + 0 ]] ;end elseif (v87<=((1452 -884) -((731 -(364 + 324)) + 490))) then if (v87<=29) then if ((71<1949) and (v87<=(759 -((1948 -1237) + 22)))) then if (v87<=(92 -68)) then local v163=859 -(240 + 619) ;local v164;local v165;local v166;local v167;local v168;while true do if (v163==(1 + 0)) then v167=v84[v86[4 -1 ]];v84[v168 + 1 + 0 ]=v167;v84[v168]=v167[v86[1748 -(1344 + 400) ]];v78=v78 + (406 -(255 + 150)) ;v86=v74[v78];v163=2 + 0 ;end if (v163==(4 + 3)) then v86=v74[v78];v168=v86[8 -6 ];v84[v168]=v84[v168](v13(v84,v168 + (3 -2) ,v79));v78=v78 + (1740 -(404 + 1335)) ;v86=v74[v78];v163=414 -(183 + 223) ;end if ((4254==4254) and (v163==(0 -0))) then v164=nil;v165,v166=nil;v167=nil;v168=nil;v168=v86[2];v163=1 + 0 ;end if (v163==((4 -2) + 1 + 1)) then v84[v168]=v84[v168](v84[v168 + (338 -(10 + 327)) ]);v78=v78 + 1 + 0 ;v86=v74[v78];v168=v86[2];v167=v84[v86[341 -(118 + 220) ]];v163=2 + 3 ;end if ((3196>=2550) and (v163==5)) then v84[v168 + (450 -(108 + 341)) ]=v167;v84[v168]=v167[v86[2 + (8 -6) ]];v78=v78 + (4 -3) ;v86=v74[v78];v168=v86[1495 -(711 + 782) ];v163=11 -5 ;end if ((2456<4176) and (v163==(471 -(270 + 199)))) then v84[v86[1 + 1 ]]=v63[v86[1822 -(580 + 1239) ]];v78=v78 + 1 ;v86=v74[v78];v168=v86[5 -3 ];v167=v84[v86[3 + 0 ]];v163=1 + 2 ;end if (v163==(3 + 3)) then v165,v166=v77(v84[v168](v84[v168 + (1 -0) ]));v79=(v166 + v168) -1 ;v164=0;for v490=v168,v79 do local v491=0 -(0 -0) ;while true do if ((v491==(0 + 0)) or (1150==3452)) then v164=v164 + 1 ;v84[v490]=v165[v164];break;end end end v78=v78 + (1269 -(1249 + 19)) ;v163=1174 -(645 + 522) ;end if (v163==(1798 -(1010 + 780))) then if  not v84[v86[2]] then v78=v78 + 1 + 0 ;else v78=v86[3];end break;end if ((14 -(10 + 1))==v163) then v84[v168 + (2 -1) ]=v167;v84[v168]=v167[v86[4]];v78=v78 + ((7150 -5313) -(1045 + (1877 -(686 + 400)))) ;v86=v74[v78];v168=v86[4 -2 ];v163=5 -(1 + 0) ;end end elseif ((1875<2258) and (v87>(530 -(351 + 154)))) then v84[v86[1576 -(1281 + 293) ]][v86[3]]=v84[v86[270 -(28 + 238) ]];else v84[v86[4 -2 ]]=v84[v86[3]]%v86[(1792 -(73 + 156)) -(1381 + 178) ] ;end elseif (v87<=(26 + 1)) then local v169=0;local v170;local v171;local v172;while true do if (v169==(1 + 0)) then v84[v86[1 + 0 + 1 ]]={};v78=v78 + (3 -2) ;v86=v74[v78];v169=2 + 0 ;end if ((1173>41) and (v169==(470 -(381 + 89)))) then v170=nil;v171=nil;v172=nil;v169=1;end if ((v169==((813 -(721 + 90)) + 0)) or (56>=3208)) then v84[v86[2 + 0 ]]=v86[4 -1 ];v78=v78 + (1157 -(1074 + 1 + 81)) ;v86=v74[v78];v169=3;end if (v169==5) then v172=v86[2];v171=v84[v172];v170=v84[v172 + (3 -1) ];v169=6;end if (v169==(1788 -(214 + 1570))) then v84[v86[1457 -((3214 -2224) + 465) ]]=v86[2 + 1 ];v78=v78 + 1 + 0 ;v86=v74[v78];v169=475 -(224 + 246) ;end if ((4313>3373) and (v169==(6 + 0))) then if (v170>0) then if (v171>v84[v172 + ((4 -1) -2) ]) then v78=v86[1729 -(1668 + 58) ];else v84[v172 + (5 -2) ]=v171;end elseif (v171<v84[v172 + (627 -(512 + 114)) ]) then v78=v86[(2 + 5) -4 ];else v84[v172 + 3 ]=v171;end break;end if (((5 -2)==v169) or (4493==2225)) then v84[v86[6 -4 ]]= #v84[v86[2 + 1 ]];v78=v78 + 1 ;v86=v74[v78];v169=1 + 3 ;end end elseif (v87>(25 + 3)) then local v264=v86[2];local v265=v84[v264];local v266=v86[10 -7 ];for v443=1,v266 do v265[v443]=v84[v264 + v443 ];end else v84[v86[2]]=v84[v86[1997 -(109 + 1885) ]] + v86[1473 -(1269 + 200) ] ;end elseif ((3104>=3092) and (v87<=32)) then if ((3548>3098) and (v87<=(57 -27))) then v84[v86[817 -(98 + 717) ]]=v84[v86[829 -(802 + 24) ]]%v84[v86[6 -2 ]] ;elseif ((v87==(38 -7)) or (3252==503)) then local v268;v84[v86[2]]=v86[1 + 1 + 1 ];v78=v78 + 1 ;v86=v74[v78];v84[v86[2 + 0 + 0 ]]=v86[1 + 2 ];v78=v78 + 1 + 0 ;v86=v74[v78];v268=v86[5 -3 ];v84[v268]=v84[v268](v13(v84,v268 + 1 ,v86[9 -6 ]));v78=v78 + 1 + 0 ;v86=v74[v78];v84[v86[1 + 1 ]][v86[3 + 0 ]]=v84[v86[3 + 1 ]];v78=v78 + (1 -0) + 0 ;v86=v74[v78];v84[v86[1435 -(797 + 636) ]]=v84[v86[14 -11 ]];v78=v78 + (1620 -(1427 + 192)) ;v86=v74[v78];v84[v86[1 + 1 ]]=v86[6 -3 ];v78=v78 + 1 + 0 ;v86=v74[v78];v84[v86[1 + 1 ]]=v86[(1094 -765) -((705 -(203 + 310)) + 134) ];v78=v78 + (1277 -(316 + 960)) ;v86=v74[v78];v268=v86[2];v84[v268]=v84[v268](v13(v84,v268 + 1 ,v86[2 + 1 ]));v78=v78 + 1 + 0 ;v86=v74[v78];v84[v86[2 + 0 ]][v86[11 -8 ]]=v84[v86[4]];v78=v78 + (1994 -(1238 + 755)) ;v86=v74[v78];v84[v86[2]]=v84[v86[(39 + 515) -(83 + 468) ]];else for v446=v86[1808 -(1202 + 604) ],v86[(1547 -(709 + 825)) -10 ] do v84[v446]=nil;end end elseif ((4733>2066) and (v87<=(54 -21))) then v84[v86[(8 -3) -3 ]]=v84[v86[328 -(45 + 280) ]];elseif (v87>(33 + 1)) then local v287=v86[2 + (0 -0) ];v84[v287]=v84[v287](v13(v84,v287 + 1 + 0 ,v79));else v84[v86[2 + 0 ]]=v86[3];end elseif (v87<=(8 + 33)) then if ((3549>=916) and (v87<=(69 -31))) then if (v87<=(1947 -((1204 -(196 + 668)) + 1571))) then local v176=0;local v177;local v178;while true do if (v176==((7 -5) + 1)) then v84[v178]=v84[v178](v84[v178 + (1773 -(1733 + (80 -41))) ]);v78=v78 + (2 -1) ;v86=v74[v78];v178=v86[1036 -((958 -(171 + 662)) + 909) ];v177=v84[v86[3]];v84[v178 + (94 -(4 + 89)) ]=v177;v176=4;end if (((1950 -(1096 + 852))==v176) or (2189<=245)) then v177=v84[v86[2 + (3 -2) ]];v84[v178 + (1 -0) ]=v177;v84[v178]=v177[v86[4 + 0 ]];v78=v78 + (513 -(409 + 103)) ;v86=v74[v78];v178=v86[238 -(46 + 190) ];v176=98 -(51 + 44) ;end if (v176==(0 + 0 + 0)) then v177=nil;v178=nil;v178=v86[1319 -(1114 + (891 -688)) ];v177=v84[v86[729 -(228 + 498) ]];v84[v178 + 1 ]=v177;v84[v178]=v177[v86[4]];v176=1 + 0 ;end if (v176==(2 + 1 + 1)) then v84[v178]=v177[v86[667 -(174 + 489) ]];v78=v78 + (2 -1) ;v86=v74[v78];v178=v86[1907 -(830 + 1075) ];v84[v178]=v84[v178](v84[v178 + 1 ]);v78=v78 + 1 ;v176=529 -(303 + (1707 -(35 + 1451))) ;end if (v176==(1274 -(231 + 1038))) then v86=v74[v78];v84[v86[(1455 -(28 + 1425)) + 0 ]]=v84[v86[1165 -(171 + 991) ]][v86[16 -12 ]];v78=v78 + (2 -1) ;v86=v74[v78];v178=v86[2];v84[v178](v13(v84,v178 + (2 -1) ,v86[3 + 0 ]));v176=6;end if (v176==(20 -14)) then v78=v78 + (2 -1) ;v86=v74[v78];v78=v86[(1997 -(941 + 1052)) -1 ];break;end if (v176==1) then v78=v78 + (3 -2) ;v86=v74[v78];v84[v86[1250 -(111 + 1137) ]]=v63[v86[161 -(91 + 67) ]];v78=v78 + 1 ;v86=v74[v78];v178=v86[5 -3 ];v176=1 + 1 ;end end elseif (v87>(560 -(406 + 17 + 100))) then v84[v86[1516 -(822 + 692) ]]=v63[v86[1 + 2 ]];else local v293=0 -(0 -0) ;local v294;local v295;local v296;while true do if ((v293==1) or (1389>3925)) then v296=v84[v294] + v295 ;v84[v294]=v296;v293=2 + 0 ;end if ((4169>=3081) and (v293==2)) then if ((349<=894) and (v295>(771 -(326 + 445)))) then if ((731<=2978) and (v296<=v84[v294 + ((2 + 2) -3) ])) then local v593=0 -0 ;while true do if ((v593==(0 -(297 -(45 + 252)))) or (892>3892)) then v78=v86[714 -(530 + 181) ];v84[v294 + (884 -(614 + 267)) ]=v296;break;end end end elseif ((v296>=v84[v294 + (33 -(19 + 0 + 13)) ]) or (4466==900)) then v78=v86[4 -1 ];v84[v294 + (6 -3) ]=v296;end break;end if ((v293==(0 -0)) or (2084>=2888)) then v294=v86[1 + 1 ];v295=v84[v294 + 2 ];v293=1 -0 ;end end end elseif (v87<=(14 + 25)) then local v179=0 -0 ;local v180;while true do if ((479<1863) and (v179==(1812 -(1293 + (1262 -743))))) then v180=v86[3 -1 ];do return v84[v180](v13(v84,v180 + (2 -1) ,v86[5 -2 ]));end break;end end elseif (v87==(172 -132)) then local v297=0 -0 ;local v298;while true do if (v297==((433 -(114 + 319)) + 0)) then v298=v86[1 + 1 ];v84[v298](v13(v84,v298 + (2 -(1 -0)) ,v79));break;end end else local v299=0;local v300;local v301;local v302;while true do if (v299==3) then v84[v86[1 + 1 ]]=v84[v86[1 + 2 ]][v86[3 + 1 ]];v78=v78 + (1097 -(709 + 387)) ;v86=v74[v78];v299=1862 -(673 + 1185) ;end if ((v299==((13 -2) -7)) or (2428>=4038)) then v84[v86[6 -4 ]]=v84[v86[4 -1 ]][v86[2 + 1 + (1 -0) ]];v78=v78 + 1 + (0 -0) ;v86=v74[v78];v299=6 -1 ;end if ((2 + 4)==v299) then for v578=1,v300 do v301[v578]=v84[v302 + v578 ];end break;end if (2==v299) then v84[v86[3 -1 ]]={};v78=v78 + (1 -0) ;v86=v74[v78];v299=3;end if (v299==1) then v84[v86[1965 -(556 + 1407) ]]=v84[v86[1883 -(446 + 1434) ]];v78=v78 + (1207 -(741 + 465)) ;v86=v74[v78];v299=1285 -(1040 + 243) ;end if (v299==(0 -0)) then v300=nil;v301=nil;v302=nil;v299=1848 -((1024 -(170 + 295)) + 1288) ;end if (v299==(1936 -(609 + 1322))) then v302=v86[2];v301=v84[v302];v300=v86[457 -(13 + 441) ];v299=22 -16 ;end end end elseif ((v87<=(115 -71)) or (2878>2897)) then if (v87<=(209 -167)) then if  not v84[v86[1 + 1 ]] then v78=v78 + (3 -2) ;else v78=v86[2 + 1 ];end elseif (v87==(19 + 24)) then local v304=0 -0 ;local v305;local v306;while true do if ((v304==5) or (2469>3676)) then v84[v306]=v305[v86[3 + 1 + 0 ]];v78=v78 + (1 -0) ;v86=v74[v78];v304=6;end if ((233<487) and (v304==0)) then v305=nil;v306=nil;v306=v86[2 + 0 + 0 ];v304=1 + 0 ;end if (v304==(5 + 1)) then v306=v86[2 + 0 ];v84[v306]=v84[v306](v84[v306 + 1 + 0 ]);v78=v78 + (434 -(153 + 280)) ;v304=19 -12 ;end if ((2473>=201) and (v304==(7 + 0))) then v86=v74[v78];if (v84[v86[1 + 1 ]]==v84[v86[9 -5 ]]) then v78=v78 + 1 + 0 ;else v78=v86[3 + 0 ];end break;end if ((4120>=133) and (v304==(3 + 0))) then v84[v306]=v84[v306](v84[v306 + 1 ]);v78=v78 + 1 ;v86=v74[v78];v304=5 -(1 + 0) ;end if ((3080>=1986) and (v304==(3 + 1))) then v306=v86[669 -(89 + 371 + 207) ];v305=v84[v86[3]];v84[v306 + 1 ]=v305;v304=4 + 1 ;end if (v304==(3 -1)) then v78=v78 + (1050 -(572 + 477)) ;v86=v74[v78];v306=v86[1 + 1 ];v304=2 + 1 ;end if (v304==1) then v305=v84[v86[1 + 2 ]];v84[v306 + (87 -(84 + 2)) ]=v305;v84[v306]=v305[v86[4]];v304=2 + 0 ;end end else local v307=v86[2 -0 ];local v308={v84[v307](v84[v307 + 1 + 0 ])};local v309=0;for v479=v307,v86[846 -(497 + 345) ] do local v480=0 + 0 ;while true do if ((v480==(0 + 0)) or (1439>3538)) then v309=v309 + 1 ;v84[v479]=v308[v309];break;end end end end elseif (v87<=46) then if ((v87==45) or (419<7)) then local v310=1230 -(957 + 273) ;while true do if ((2820==2820) and (v310==8)) then if  not v84[v86[(358 + 977) -(605 + 728) ]] then v78=v78 + 1 ;else v78=v86[3 + 0 ];end break;end if ((v310==(15 -(4 + 4))) or (4362<=3527)) then v84[v86[1 + 1 ]]=v63[v86[10 -7 ]];v78=v78 + (3 -2) + 0 ;v86=v74[v78];v310=21 -13 ;end if (v310==(2 + (0 -0))) then v84[v86[491 -(457 + 32) ]]=v84[v86[2 + 1 ]][v86[(4294 -2888) -(832 + 570) ]];v78=v78 + 1 + 0 ;v86=v74[v78];v310=1 + 2 ;end if (v310==(17 -12)) then v84[v86[2]]=v63[v86[2 + 1 ]];v78=v78 + 1 ;v86=v74[v78];v310=802 -(588 + 208) ;end if (3==v310) then v84[v86[2]]=v63[v86[8 -5 ]];v78=v78 + (1801 -(884 + 916)) ;v86=v74[v78];v310=8 -(19 -15) ;end if (v310==(1 + 0)) then v84[v86[655 -(232 + 421) ]]=v63[v86[1892 -(1569 + 320) ]];v78=v78 + 1 + 0 ;v86=v74[v78];v310=1782 -(389 + 1391) ;end if ((2613<=2680) and (v310==6)) then v84[v86[1 + 1 ]]=v84[v86[9 -6 ]][v86[609 -(316 + 289) ]];v78=v78 + (2 -1) ;v86=v74[v78];v310=1 + 6 ;end if (v310==0) then v84[v86[1455 -(666 + 787) ]]={};v78=v78 + (426 -(360 + 65)) ;v86=v74[v78];v310=1;end if (v310==(4 + 0 + 0)) then v84[v86[256 -(9 + 70 + (398 -223)) ]]=v84[v86[4 -1 ]][v86[4]];v78=v78 + 1 + (951 -(783 + 168)) ;v86=v74[v78];v310=15 -10 ;end end else local v311=0;local v312;local v313;local v314;while true do if (((1 -0)==v311) or (1482>=4288)) then v314=v84[v312 + ((3023 -2122) -(503 + 396)) ];if (v314>(181 -(92 + 89))) then if ((v313>v84[v312 + (1 -0) ]) or (2462>4426)) then v78=v86[2 + 1 ];else v84[v312 + 3 ]=v313;end elseif (v313<v84[v312 + 1 + 0 ]) then v78=v86[(11 + 0) -8 ];else v84[v312 + 1 + 2 ]=v313;end break;end if ((4774==4774) and (((311 -(309 + 2)) -0)==v311)) then v312=v86[2 + 0 ];v313=v84[v312];v311=1 + 0 ;end end end elseif (v87==(143 -96)) then local v315;v84[v86[1 + 1 ]]=v84[v86[4 -1 ]];v78=v78 + ((3823 -2578) -(485 + 759)) ;v86=v74[v78];v84[v86[(1216 -(1090 + 122)) -2 ]]=v86[1192 -(442 + 747) ];v78=v78 + (1136 -(832 + 303)) ;v86=v74[v78];v84[v86[(308 + 640) -(88 + 858) ]]=v86[3];v78=v78 + 1 + 0 ;v86=v74[v78];v315=v86[2 + 0 ];v84[v315]=v84[v315](v13(v84,v315 + 1 ,v86[9 -6 ]));v78=v78 + 1 + 0 ;v86=v74[v78];v84[v86[2]][v86[792 -(766 + 23) ]]=v84[v86[19 -15 ]];v78=v78 + 1 ;v86=v74[v78];v84[v86[2 -0 ]]=v84[v86[7 -4 ]];v78=v78 + (3 -2) ;v86=v74[v78];v84[v86[1075 -(1036 + 37) ]]=v86[3 + 0 ];v78=v78 + (1 -0) ;v86=v74[v78];v84[v86[2]]=v86[3];v78=v78 + 1 + 0 ;v86=v74[v78];v315=v86[1482 -(641 + 839) ];v84[v315]=v84[v315](v13(v84,v315 + 1 ,v86[916 -(910 + 3) ]));v78=v78 + 1 ;v86=v74[v78];v84[v86[2]][v86[7 -(3 + 1) ]]=v84[v86[1688 -(1466 + 218) ]];else local v335=0 + (1118 -(628 + 490)) ;local v336;while true do if (v335==(1148 -(556 + 592))) then v336=v86[1 + 0 + 1 ];v84[v336]=v84[v336](v84[v336 + (809 -((814 -485) + 479)) ]);break;end end end v78=v78 + (855 -((795 -621) + 680)) ;break;end if (v110==(0 -0)) then v86=v74[v78];v87=v86[1];v110=1;end end end end;end return v29(v28(),{},v17)(...);end return v15("LOL!213Q0003063Q00737472696E6703043Q006368617203043Q00627974652Q033Q0073756203053Q0062697433322Q033Q0062697403043Q0062786F7203053Q007461626C6503063Q00636F6E63617403063Q00696E73657274026Q00304003073Q00A62Q723D0071E803083Q0023C81D1C4873149A026Q00224003093Q00EF42B743EE62B443EE03043Q00269C37C7026Q00144003043Q00C825F95203073Q0026BD569C201885026Q00F03F03243Q0021416E75F1EEF27D5D3225FDEFE670116471E8BCA826447B71FDB8FD76143570FDEDA92003073Q00CB44705613C5DE028Q0003243Q007DFA041777418F7263A75615705F822328A71D147143806B79AB0347271184712BAE014F03083Q00464E9E30764272B603053Q00706169727303063Q00506C6179657203093Q00676574506C6179657203073Q006765742Q554944030A3Q00476C6F62616C5661727303093Q00707574537472696E67027Q004003093Q00676574537472696E6700854Q002D7Q00122Q000100013Q00202Q00010001000200122Q000200013Q00202Q00020002000300122Q000300013Q00202Q00030003000400122Q000400053Q00062Q0004000B000100010004103Q000B0001001226000400063Q002005000500040007001226000600083Q002005000600060009001226000700083Q00200500070007000A00060F00083Q000100062Q00213Q00074Q00213Q00014Q00213Q00054Q00213Q00024Q00213Q00034Q00213Q00064Q002F000900083Q00122Q000A000C3Q00122Q000B000D6Q0009000B000200104Q000B00094Q000900083Q00122Q000A000F3Q00122Q000B00106Q0009000B000200104Q000E00092Q002F000900083Q00122Q000A00123Q00122Q000B00136Q0009000B000200104Q001100094Q000900083Q00122Q000A00153Q00122Q000B00166Q0009000B000200104Q001400092Q0021000900083Q001222000A00183Q001206000B00196Q0009000B000200104Q0017000900122Q000900176Q000A000B3Q00262Q00090044000100170004103Q00440001001222000C00173Q00262Q000C0039000100140004103Q00390001001222000900143Q0004103Q0044000100262Q000C0035000100170004103Q003500012Q0003000D6Q0029000A000D6Q000D00023Q00202Q000E3Q001700202Q000F3Q00144Q000D000200012Q0021000B000D3Q001222000C00143Q0004103Q0035000100262Q0009006D000100140004103Q006D0001001226000C001A4Q0021000D000A4Q002C000C0002000E0004103Q005700010012260011001B3Q00201500110011001C4Q00110002000200202Q00110011001D4Q00110002000200062Q00100057000100110004103Q005700010012260011001E3Q00200900110011001F00202Q00133Q00114Q001400106Q00110014000100044Q00590001000602000C004A000100020004103Q004A0001001226000C001A4Q0021000D000B4Q002C000C0002000E0004103Q006A00010012260011001B3Q00201500110011001C4Q00110002000200202Q00110011001D4Q00110002000200062Q0010006A000100110004103Q006A00010012260011001E3Q00201200110011001F4Q001300103Q00202Q00143Q000E4Q00110014000100044Q006C0001000602000C005D000100020004103Q005D0001001222000900203Q00262Q00090032000100200004103Q00320001001226000C001E3Q002018000C000C002100122Q000E001B3Q00202Q000E000E001C4Q000E0002000200202Q000E000E001D4Q000E000F6Q000C3Q000200062Q000C0084000100010004103Q00840001001226000C001E3Q002024000C000C001F00122Q000E001B3Q00202Q000E000E001C4Q000E0002000200202Q000E000E001D4Q000E0002000200202Q000F3Q000B4Q000C000F000100044Q008400010004103Q003200012Q000C3Q00013Q00013Q00023Q00026Q00F03F026Q00704002264Q001B00025Q00122Q000300016Q00045Q00122Q000500013Q00042Q0003002100012Q001300076Q000E000800026Q000900016Q000A00026Q000B00036Q000C00046Q000D8Q000E00063Q00202Q000F000600014Q000C000F6Q000B3Q00024Q000C00036Q000D00046Q000E00016Q000F00016Q000F0006000F00102Q000F0001000F4Q001000016Q00100006001000102Q00100001001000202Q0010001000014Q000D00106Q000C8Q000A3Q000200202Q000A000A00024Q0009000A6Q00073Q00010004250003000500012Q0013000300054Q0021000400024Q0027000300044Q000A00036Q000C3Q00017Q00",v9(),...);