function out = model
%
% ht_draft.m
%
% Model exported on Nov 16 2017, 15:38 by COMSOL 5.0.0.243.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('C:\Users\SJTU\Desktop\multiphys_model');

model.label('ht_draft.mph');

model.param.set('thickness_ybco', '0.1[mm]');
model.param.set('thickness_sub', '0.15[mm]');
model.param.set('width', '5[mm]');
model.param.set('S_ybco', 'thickness_ybco*width');
model.param.set('S_sub', 'thickness_sub*width');
model.param.set('Jc', '1e7[A/m^2]');
model.param.set('Ec', '1e-4[V/m]');
model.param.set('n', '28');

model.modelNode.create('comp1');

model.geom.create('geom1', 2);
model.geom('geom1').axisymmetric(true);

model.mesh.create('mesh1', 'geom1');

model.geom('geom1').create('imp1', 'Import');
model.geom('geom1').feature('imp1').set('type', 'native');
model.geom('geom1').feature('imp1').set('filename', ['C:\Users\SJTU\Desktop\' native2unicode(hex2dec({'96' '50'}), 'unicode')  native2unicode(hex2dec({'6d' '41'}), 'unicode')  native2unicode(hex2dec({'56' '68'}), 'unicode') '-' native2unicode(hex2dec({'65' 'b0'}), 'unicode') '\' native2unicode(hex2dec({'8b' 'e6'}), 'unicode')  native2unicode(hex2dec({'7e' 'c6'}), 'unicode')  native2unicode(hex2dec({'7e' 'd3'}), 'unicode')  native2unicode(hex2dec({'67' '84'}), 'unicode') '.mphbin']);
model.geom('geom1').feature('imp1').importData;
model.geom('geom1').run;

model.view.create('view2', 3);

model.material.create('mat1', 'Common', 'comp1');
model.material.create('mat2', 'Common', 'comp1');
model.material('mat1').propertyGroup('def').func.create('dL', 'Piecewise');
model.material('mat1').propertyGroup('def').func.create('CTE', 'Piecewise');
model.material('mat1').propertyGroup('def').func.create('k_liquid_2', 'Piecewise');
model.material('mat1').propertyGroup('def').func.create('alpha', 'Piecewise');
model.material('mat1').propertyGroup('def').func.create('rho_liquid_1', 'Piecewise');
model.material('mat1').propertyGroup('def').func.create('VP_liquid_2', 'Piecewise');
model.material('mat2').selection.set([2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161]);
model.material('mat2').propertyGroup.create('HBCurve', 'HB curve');
model.material('mat2').propertyGroup('HBCurve').func.create('HBCurve1', 'Interpolation');
model.material('mat2').propertyGroup.create('BHCurve', 'BH curve');
model.material('mat2').propertyGroup('BHCurve').func.create('BHCurve1', 'Interpolation');

model.physics.create('ht', 'HeatTransfer', 'geom1');
model.physics('ht').create('hs1', 'HeatSource', 2);
model.physics('ht').feature('hs1').selection.set([82]);
model.physics('ht').create('init2', 'init', 2);
model.physics('ht').feature('init2').selection.set([82]);
model.physics('ht').create('hs2', 'HeatSource', 2);
model.physics('ht').feature('hs2').selection.set([83]);
model.physics('ht').create('init3', 'init', 2);
model.physics('ht').feature('init3').selection.set([83]);
model.physics('ht').create('hs3', 'HeatSource', 2);
model.physics('ht').feature('hs3').selection.set([84]);
model.physics('ht').create('init4', 'init', 2);
model.physics('ht').feature('init4').selection.set([84]);
model.physics('ht').create('hs4', 'HeatSource', 2);
model.physics('ht').feature('hs4').selection.set([85]);
model.physics('ht').create('init5', 'init', 2);
model.physics('ht').feature('init5').selection.set([85]);
model.physics('ht').create('hs5', 'HeatSource', 2);
model.physics('ht').feature('hs5').selection.set([86]);
model.physics('ht').create('init6', 'init', 2);
model.physics('ht').feature('init6').selection.set([86]);
model.physics('ht').create('hs6', 'HeatSource', 2);
model.physics('ht').feature('hs6').selection.set([87]);
model.physics('ht').create('init7', 'init', 2);
model.physics('ht').feature('init7').selection.set([87]);
model.physics('ht').create('hs7', 'HeatSource', 2);
model.physics('ht').feature('hs7').selection.set([88]);
model.physics('ht').create('init8', 'init', 2);
model.physics('ht').feature('init8').selection.set([88]);
model.physics('ht').create('hs8', 'HeatSource', 2);
model.physics('ht').feature('hs8').selection.set([89]);
model.physics('ht').create('init9', 'init', 2);
model.physics('ht').feature('init9').selection.set([89]);
model.physics('ht').create('hs9', 'HeatSource', 2);
model.physics('ht').feature('hs9').selection.set([98]);
model.physics('ht').create('init10', 'init', 2);
model.physics('ht').feature('init10').selection.set([98]);
model.physics('ht').create('hs10', 'HeatSource', 2);
model.physics('ht').feature('hs10').selection.set([99]);
model.physics('ht').create('init11', 'init', 2);
model.physics('ht').feature('init11').selection.set([99]);
model.physics('ht').create('hs11', 'HeatSource', 2);
model.physics('ht').feature('hs11').selection.set([100]);
model.physics('ht').create('init12', 'init', 2);
model.physics('ht').feature('init12').selection.set([100]);
model.physics('ht').create('hs12', 'HeatSource', 2);
model.physics('ht').feature('hs12').selection.set([101]);
model.physics('ht').create('init13', 'init', 2);
model.physics('ht').feature('init13').selection.set([101]);
model.physics('ht').create('hs13', 'HeatSource', 2);
model.physics('ht').feature('hs13').selection.set([102]);
model.physics('ht').create('init14', 'init', 2);
model.physics('ht').feature('init14').selection.set([102]);
model.physics('ht').create('hs14', 'HeatSource', 2);
model.physics('ht').feature('hs14').selection.set([103]);
model.physics('ht').create('init15', 'init', 2);
model.physics('ht').feature('init15').selection.set([103]);
model.physics('ht').create('hs15', 'HeatSource', 2);
model.physics('ht').feature('hs15').selection.set([104]);
model.physics('ht').create('init16', 'init', 2);
model.physics('ht').feature('init16').selection.set([104]);
model.physics('ht').create('hs16', 'HeatSource', 2);
model.physics('ht').feature('hs16').selection.set([105]);
model.physics('ht').create('init17', 'init', 2);
model.physics('ht').feature('init17').selection.set([105]);
model.physics('ht').create('hs17', 'HeatSource', 2);
model.physics('ht').feature('hs17').selection.set([114]);
model.physics('ht').create('init18', 'init', 2);
model.physics('ht').feature('init18').selection.set([114]);
model.physics('ht').create('hs18', 'HeatSource', 2);
model.physics('ht').feature('hs18').selection.set([115]);
model.physics('ht').create('init19', 'init', 2);
model.physics('ht').feature('init19').selection.set([115]);
model.physics('ht').create('hs19', 'HeatSource', 2);
model.physics('ht').feature('hs19').selection.set([116]);
model.physics('ht').create('init20', 'init', 2);
model.physics('ht').feature('init20').selection.set([116]);
model.physics('ht').create('hs20', 'HeatSource', 2);
model.physics('ht').feature('hs20').selection.set([117]);
model.physics('ht').create('init21', 'init', 2);
model.physics('ht').feature('init21').selection.set([117]);
model.physics('ht').create('hs21', 'HeatSource', 2);
model.physics('ht').feature('hs21').selection.set([118]);
model.physics('ht').create('init22', 'init', 2);
model.physics('ht').feature('init22').selection.set([118]);
model.physics('ht').create('hs22', 'HeatSource', 2);
model.physics('ht').feature('hs22').selection.set([119]);
model.physics('ht').create('init23', 'init', 2);
model.physics('ht').feature('init23').selection.set([119]);
model.physics('ht').create('hs23', 'HeatSource', 2);
model.physics('ht').feature('hs23').selection.set([120]);
model.physics('ht').create('init24', 'init', 2);
model.physics('ht').feature('init24').selection.set([120]);
model.physics('ht').create('hs24', 'HeatSource', 2);
model.physics('ht').feature('hs24').selection.set([121]);
model.physics('ht').create('init25', 'init', 2);
model.physics('ht').feature('init25').selection.set([121]);
model.physics('ht').create('hs25', 'HeatSource', 2);
model.physics('ht').feature('hs25').selection.set([130]);
model.physics('ht').create('init26', 'init', 2);
model.physics('ht').feature('init26').selection.set([130]);
model.physics('ht').create('hs26', 'HeatSource', 2);
model.physics('ht').feature('hs26').selection.set([131]);
model.physics('ht').create('init27', 'init', 2);
model.physics('ht').feature('init27').selection.set([131]);
model.physics('ht').create('hs27', 'HeatSource', 2);
model.physics('ht').feature('hs27').selection.set([132]);
model.physics('ht').create('init28', 'init', 2);
model.physics('ht').feature('init28').selection.set([132]);
model.physics('ht').create('hs28', 'HeatSource', 2);
model.physics('ht').feature('hs28').selection.set([133]);
model.physics('ht').create('init29', 'init', 2);
model.physics('ht').feature('init29').selection.set([133]);
model.physics('ht').create('hs29', 'HeatSource', 2);
model.physics('ht').feature('hs29').selection.set([134]);
model.physics('ht').create('init30', 'init', 2);
model.physics('ht').feature('init30').selection.set([134]);
model.physics('ht').create('hs30', 'HeatSource', 2);
model.physics('ht').feature('hs30').selection.set([135]);
model.physics('ht').create('init31', 'init', 2);
model.physics('ht').feature('init31').selection.set([135]);
model.physics('ht').create('hs31', 'HeatSource', 2);
model.physics('ht').feature('hs31').selection.set([136]);
model.physics('ht').create('init32', 'init', 2);
model.physics('ht').feature('init32').selection.set([136]);
model.physics('ht').create('hs32', 'HeatSource', 2);
model.physics('ht').feature('hs32').selection.set([137]);
model.physics('ht').create('init33', 'init', 2);
model.physics('ht').feature('init33').selection.set([137]);
model.physics('ht').create('hs33', 'HeatSource', 2);
model.physics('ht').feature('hs33').selection.set([146]);
model.physics('ht').create('init34', 'init', 2);
model.physics('ht').feature('init34').selection.set([146]);
model.physics('ht').create('hs34', 'HeatSource', 2);
model.physics('ht').feature('hs34').selection.set([147]);
model.physics('ht').create('init35', 'init', 2);
model.physics('ht').feature('init35').selection.set([147]);
model.physics('ht').create('hs35', 'HeatSource', 2);
model.physics('ht').feature('hs35').selection.set([148]);
model.physics('ht').create('init36', 'init', 2);
model.physics('ht').feature('init36').selection.set([148]);
model.physics('ht').create('hs36', 'HeatSource', 2);
model.physics('ht').feature('hs36').selection.set([149]);
model.physics('ht').create('init37', 'init', 2);
model.physics('ht').feature('init37').selection.set([149]);
model.physics('ht').create('hs37', 'HeatSource', 2);
model.physics('ht').feature('hs37').selection.set([150]);
model.physics('ht').create('init38', 'init', 2);
model.physics('ht').feature('init38').selection.set([150]);
model.physics('ht').create('hs38', 'HeatSource', 2);
model.physics('ht').feature('hs38').selection.set([151]);
model.physics('ht').create('init39', 'init', 2);
model.physics('ht').feature('init39').selection.set([151]);
model.physics('ht').create('hs39', 'HeatSource', 2);
model.physics('ht').feature('hs39').selection.set([152]);
model.physics('ht').create('init40', 'init', 2);
model.physics('ht').feature('init40').selection.set([152]);
model.physics('ht').create('hs40', 'HeatSource', 2);
model.physics('ht').feature('hs40').selection.set([153]);
model.physics('ht').create('init41', 'init', 2);
model.physics('ht').feature('init41').selection.set([153]);
model.physics('ht').create('hs41', 'HeatSource', 2);
model.physics('ht').feature('hs41').selection.set([2]);
model.physics('ht').create('init42', 'init', 2);
model.physics('ht').feature('init42').selection.set([2]);
model.physics('ht').create('hs42', 'HeatSource', 2);
model.physics('ht').feature('hs42').selection.set([3]);
model.physics('ht').create('init43', 'init', 2);
model.physics('ht').feature('init43').selection.set([3]);
model.physics('ht').create('hs43', 'HeatSource', 2);
model.physics('ht').feature('hs43').selection.set([4]);
model.physics('ht').create('init44', 'init', 2);
model.physics('ht').feature('init44').selection.set([4]);
model.physics('ht').create('hs44', 'HeatSource', 2);
model.physics('ht').feature('hs44').selection.set([5]);
model.physics('ht').create('init45', 'init', 2);
model.physics('ht').feature('init45').selection.set([5]);
model.physics('ht').create('hs45', 'HeatSource', 2);
model.physics('ht').feature('hs45').selection.set([6]);
model.physics('ht').create('init46', 'init', 2);
model.physics('ht').feature('init46').selection.set([6]);
model.physics('ht').create('hs46', 'HeatSource', 2);
model.physics('ht').feature('hs46').selection.set([7]);
model.physics('ht').create('init47', 'init', 2);
model.physics('ht').feature('init47').selection.set([7]);
model.physics('ht').create('hs47', 'HeatSource', 2);
model.physics('ht').feature('hs47').selection.set([8]);
model.physics('ht').create('init48', 'init', 2);
model.physics('ht').feature('init48').selection.set([8]);
model.physics('ht').create('hs48', 'HeatSource', 2);
model.physics('ht').feature('hs48').selection.set([9]);
model.physics('ht').create('init49', 'init', 2);
model.physics('ht').feature('init49').selection.set([9]);
model.physics('ht').create('hs49', 'HeatSource', 2);
model.physics('ht').feature('hs49').selection.set([18]);
model.physics('ht').create('init50', 'init', 2);
model.physics('ht').feature('init50').selection.set([18]);
model.physics('ht').create('hs50', 'HeatSource', 2);
model.physics('ht').feature('hs50').selection.set([19]);
model.physics('ht').create('init51', 'init', 2);
model.physics('ht').feature('init51').selection.set([19]);
model.physics('ht').create('hs51', 'HeatSource', 2);
model.physics('ht').feature('hs51').selection.set([20]);
model.physics('ht').create('init52', 'init', 2);
model.physics('ht').feature('init52').selection.set([20]);
model.physics('ht').create('hs52', 'HeatSource', 2);
model.physics('ht').feature('hs52').selection.set([21]);
model.physics('ht').create('init53', 'init', 2);
model.physics('ht').feature('init53').selection.set([21]);
model.physics('ht').create('hs53', 'HeatSource', 2);
model.physics('ht').feature('hs53').selection.set([22]);
model.physics('ht').create('init54', 'init', 2);
model.physics('ht').feature('init54').selection.set([22]);
model.physics('ht').create('hs54', 'HeatSource', 2);
model.physics('ht').feature('hs54').selection.set([23]);
model.physics('ht').create('init55', 'init', 2);
model.physics('ht').feature('init55').selection.set([23]);
model.physics('ht').create('hs55', 'HeatSource', 2);
model.physics('ht').feature('hs55').selection.set([24]);
model.physics('ht').create('init56', 'init', 2);
model.physics('ht').feature('init56').selection.set([24]);
model.physics('ht').create('hs56', 'HeatSource', 2);
model.physics('ht').feature('hs56').selection.set([25]);
model.physics('ht').create('init57', 'init', 2);
model.physics('ht').feature('init57').selection.set([25]);
model.physics('ht').create('hs57', 'HeatSource', 2);
model.physics('ht').feature('hs57').selection.set([34]);
model.physics('ht').create('init58', 'init', 2);
model.physics('ht').feature('init58').selection.set([34]);
model.physics('ht').create('hs58', 'HeatSource', 2);
model.physics('ht').feature('hs58').selection.set([35]);
model.physics('ht').create('init59', 'init', 2);
model.physics('ht').feature('init59').selection.set([35]);
model.physics('ht').create('hs59', 'HeatSource', 2);
model.physics('ht').feature('hs59').selection.set([36]);
model.physics('ht').create('init60', 'init', 2);
model.physics('ht').feature('init60').selection.set([36]);
model.physics('ht').create('hs60', 'HeatSource', 2);
model.physics('ht').feature('hs60').selection.set([37]);
model.physics('ht').create('init61', 'init', 2);
model.physics('ht').feature('init61').selection.set([37]);
model.physics('ht').create('hs61', 'HeatSource', 2);
model.physics('ht').feature('hs61').selection.set([38]);
model.physics('ht').create('init62', 'init', 2);
model.physics('ht').feature('init62').selection.set([38]);
model.physics('ht').create('hs62', 'HeatSource', 2);
model.physics('ht').feature('hs62').selection.set([39]);
model.physics('ht').create('init63', 'init', 2);
model.physics('ht').feature('init63').selection.set([39]);
model.physics('ht').create('hs63', 'HeatSource', 2);
model.physics('ht').feature('hs63').selection.set([40]);
model.physics('ht').create('init64', 'init', 2);
model.physics('ht').feature('init64').selection.set([40]);
model.physics('ht').create('hs64', 'HeatSource', 2);
model.physics('ht').feature('hs64').selection.set([41]);
model.physics('ht').create('init65', 'init', 2);
model.physics('ht').feature('init65').selection.set([41]);
model.physics('ht').create('hs65', 'HeatSource', 2);
model.physics('ht').feature('hs65').selection.set([50]);
model.physics('ht').create('init66', 'init', 2);
model.physics('ht').feature('init66').selection.set([50]);
model.physics('ht').create('hs66', 'HeatSource', 2);
model.physics('ht').feature('hs66').selection.set([51]);
model.physics('ht').create('init67', 'init', 2);
model.physics('ht').feature('init67').selection.set([51]);
model.physics('ht').create('hs67', 'HeatSource', 2);
model.physics('ht').feature('hs67').selection.set([52]);
model.physics('ht').create('init68', 'init', 2);
model.physics('ht').feature('init68').selection.set([52]);
model.physics('ht').create('hs68', 'HeatSource', 2);
model.physics('ht').feature('hs68').selection.set([53]);
model.physics('ht').create('init69', 'init', 2);
model.physics('ht').feature('init69').selection.set([53]);
model.physics('ht').create('hs69', 'HeatSource', 2);
model.physics('ht').feature('hs69').selection.set([54]);
model.physics('ht').create('init70', 'init', 2);
model.physics('ht').feature('init70').selection.set([54]);
model.physics('ht').create('hs70', 'HeatSource', 2);
model.physics('ht').feature('hs70').selection.set([55]);
model.physics('ht').create('init71', 'init', 2);
model.physics('ht').feature('init71').selection.set([55]);
model.physics('ht').create('hs71', 'HeatSource', 2);
model.physics('ht').feature('hs71').selection.set([56]);
model.physics('ht').create('init72', 'init', 2);
model.physics('ht').feature('init72').selection.set([56]);
model.physics('ht').create('hs72', 'HeatSource', 2);
model.physics('ht').feature('hs72').selection.set([57]);
model.physics('ht').create('init73', 'init', 2);
model.physics('ht').feature('init73').selection.set([57]);
model.physics('ht').create('hs73', 'HeatSource', 2);
model.physics('ht').feature('hs73').selection.set([66]);
model.physics('ht').create('init74', 'init', 2);
model.physics('ht').feature('init74').selection.set([66]);
model.physics('ht').create('hs74', 'HeatSource', 2);
model.physics('ht').feature('hs74').selection.set([67]);
model.physics('ht').create('init75', 'init', 2);
model.physics('ht').feature('init75').selection.set([67]);
model.physics('ht').create('hs75', 'HeatSource', 2);
model.physics('ht').feature('hs75').selection.set([68]);
model.physics('ht').create('init76', 'init', 2);
model.physics('ht').feature('init76').selection.set([68]);
model.physics('ht').create('hs76', 'HeatSource', 2);
model.physics('ht').feature('hs76').selection.set([69]);
model.physics('ht').create('init77', 'init', 2);
model.physics('ht').feature('init77').selection.set([69]);
model.physics('ht').create('hs77', 'HeatSource', 2);
model.physics('ht').feature('hs77').selection.set([70]);
model.physics('ht').create('init78', 'init', 2);
model.physics('ht').feature('init78').selection.set([70]);
model.physics('ht').create('hs78', 'HeatSource', 2);
model.physics('ht').feature('hs78').selection.set([71]);
model.physics('ht').create('init79', 'init', 2);
model.physics('ht').feature('init79').selection.set([71]);
model.physics('ht').create('hs79', 'HeatSource', 2);
model.physics('ht').feature('hs79').selection.set([72]);
model.physics('ht').create('init80', 'init', 2);
model.physics('ht').feature('init80').selection.set([72]);
model.physics('ht').create('hs80', 'HeatSource', 2);
model.physics('ht').feature('hs80').selection.set([73]);
model.physics('ht').create('init81', 'init', 2);
model.physics('ht').feature('init81').selection.set([73]);
model.physics('ht').create('hs81', 'HeatSource', 2);
model.physics('ht').feature('hs81').selection.set([90 91 92 93 94 95 96 97 106 107 108 109 110 111 112 113 122 123 124 125 126 127 128 129 138 139 140 141 142 143 144 145 154 155 156 157 158 159 160 161]);
model.physics('ht').create('init82', 'init', 2);
model.physics('ht').feature('init82').selection.set([90 91 92 93 94 95 96 97 106 107 108 109 110 111 112 113 122 123 124 125 126 127 128 129 138 139 140 141 142 143 144 145 154 155 156 157 158 159 160 161]);
model.physics('ht').create('hs82', 'HeatSource', 2);
model.physics('ht').feature('hs82').selection.set([10 11 12 13 14 15 16 17 26 27 28 29 30 31 32 33 42 43 44 45 46 47 48 49 58 59 60 61 62 63 64 65 74 75 76 77 78 79 80 81]);
model.physics('ht').create('init83', 'init', 2);
model.physics('ht').feature('init83').selection.set([10 11 12 13 14 15 16 17 26 27 28 29 30 31 32 33 42 43 44 45 46 47 48 49 58 59 60 61 62 63 64 65 74 75 76 77 78 79 80 81]);

model.mesh('mesh1').create('ftri1', 'FreeTri');

model.result.table.create('evl2', 'Table');

model.view('view1').axis.set('abstractviewxscale', '0.017855623736977577');
model.view('view1').axis.set('ymin', '11.238588333129883');
model.view('view1').axis.set('xmax', '61.129337310791016');
model.view('view1').axis.set('abstractviewyscale', '0.017855621874332428');
model.view('view1').axis.set('abstractviewbratio', '0.5280964374542236');
model.view('view1').axis.set('abstractviewtratio', '-0.4447630047798157');
model.view('view1').axis.set('abstractviewrratio', '-0.8253447413444519');
model.view('view1').axis.set('xmin', '51.487300872802734');
model.view('view1').axis.set('abstractviewlratio', '0.1471065729856491');
model.view('view1').axis.set('ymax', '22.094806671142578');

model.material('mat1').label('Nitrogen [liquid]');
model.material('mat1').set('family', 'water');
model.material('mat1').propertyGroup('def').func('dL').set('pieces', {'63.1' '112.0' '-0.1773989+0.005102763*T^1-5.426098E-5*T^2+2.844321E-7*T^3'; '112.0' '124.5' '-13.16577+0.364104*T^1-0.00335482*T^2+1.037917E-5*T^3'; '124.5' '126.0' '676.7494-10.8625*T^1+0.04360097*T^2'});
model.material('mat1').propertyGroup('def').func('dL').set('arg', 'T');
model.material('mat1').propertyGroup('def').func('CTE').set('pieces', {'63.1' '114.0' '0.004251836-7.753278E-5*T^1+4.82674E-7*T^2+1.455868E-9*T^3'});
model.material('mat1').propertyGroup('def').func('CTE').set('arg', 'T');
model.material('mat1').propertyGroup('def').func('k_liquid_2').set('pieces', {'63.0' '125.0' '0.2753504-0.00178267*T^1'});
model.material('mat1').propertyGroup('def').func('k_liquid_2').set('arg', 'T');
model.material('mat1').propertyGroup('def').func('alpha').set('pieces', {'63.1' '99.0' '0.005728912-1.381338E-4*T^1+1.459242E-6*T^2-4.482516E-9*T^3'; '99.0' '123.0' '-0.04023297+0.001242129*T^1-1.232855E-5*T^2+4.132509E-8*T^3'; '123.0' '125.0' '-11.91599+0.2945744*T^1-0.002427263*T^2+6.668038E-6*T^3'; '125.0' '126.0' '10.68641-0.1714808*T^1+6.881294E-4*T^2'});
model.material('mat1').propertyGroup('def').func('alpha').set('arg', 'T');
model.material('mat1').propertyGroup('def').func('rho_liquid_1').set('pieces', {'63.1' '99.0' '1351.922-13.61651*T^1+0.1371822*T^2-6.734775E-4*T^3'; '99.0' '124.0' '7584.667-196.2412*T^1+1.911284*T^2-0.00638391*T^3'; '124.0' '126.0' '4.061456E7-980572.4*T^1+7891.647*T^2-21.17097*T^3'});
model.material('mat1').propertyGroup('def').func('rho_liquid_1').set('arg', 'T');
model.material('mat1').propertyGroup('def').func('VP_liquid_2').set('pieces', {'65.0' '125.0' '(exp((-1.581529e+002/T+2.398760e+000*log10(T)+6.832701e-001-1.328918e+005/T^3)*log(10.0)))*1.333200e+002'});
model.material('mat1').propertyGroup('def').func('VP_liquid_2').set('arg', 'T');
model.material('mat1').propertyGroup('def').set('dL', '(dL(T[1/K])-dL(Tempref[1/K]))/(1+dL(Tempref[1/K]))');
model.material('mat1').propertyGroup('def').set('CTE', 'CTE(T[1/K])[1/K]');
model.material('mat1').propertyGroup('def').set('thermalconductivity', {'k_liquid_2(T[1/K])[W/(m*K)]' '0' '0' '0' 'k_liquid_2(T[1/K])[W/(m*K)]' '0' '0' '0' 'k_liquid_2(T[1/K])[W/(m*K)]'});
model.material('mat1').propertyGroup('def').set('thermalexpansioncoefficient', {'(alpha(T[1/K])[1/K]+(Tempref-63[K])*if(abs(T-Tempref)>1e-3,(alpha(T[1/K])[1/K]-alpha(Tempref[1/K])[1/K])/(T-Tempref),d(alpha(T[1/K]),T)[1/K]))/(1+alpha(Tempref[1/K])[1/K]*(Tempref-63[K]))' '0' '0' '0' '(alpha(T[1/K])[1/K]+(Tempref-63[K])*if(abs(T-Tempref)>1e-3,(alpha(T[1/K])[1/K]-alpha(Tempref[1/K])[1/K])/(T-Tempref),d(alpha(T[1/K]),T)[1/K]))/(1+alpha(Tempref[1/K])[1/K]*(Tempref-63[K]))' '0' '0' '0' '(alpha(T[1/K])[1/K]+(Tempref-63[K])*if(abs(T-Tempref)>1e-3,(alpha(T[1/K])[1/K]-alpha(Tempref[1/K])[1/K])/(T-Tempref),d(alpha(T[1/K]),T)[1/K]))/(1+alpha(Tempref[1/K])[1/K]*(Tempref-63[K]))'});
model.material('mat1').propertyGroup('def').set('density', 'rho_liquid_1(T[1/K])[kg/m^3]');
model.material('mat1').propertyGroup('def').set('VP', 'VP_liquid_2(T[1/K])[Pa]');
model.material('mat1').propertyGroup('def').set('heatcapacity', '2000');
model.material('mat1').propertyGroup('def').addInput('temperature');
model.material('mat1').propertyGroup('def').addInput('strainreferencetemperature');
model.material('mat2').label('Stainless Steel 410 Annealed');
model.material('mat2').propertyGroup('def').set('electricconductivity', {'1.74[MS/m]' '0' '0' '0' '1.74[MS/m]' '0' '0' '0' '1.74[MS/m]'});
model.material('mat2').propertyGroup('def').set('relpermittivity', {'1[1]' '0' '0' '0' '1[1]' '0' '0' '0' '1[1]'});
model.material('mat2').propertyGroup('def').set('heatcapacity', '220');
model.material('mat2').propertyGroup('def').set('density', '7800');
model.material('mat2').propertyGroup('def').set('thermalconductivity', {'8' '0' '0' '0' '8' '0' '0' '0' '8'});
model.material('mat2').propertyGroup('HBCurve').func.label('Functions');
model.material('mat2').propertyGroup('HBCurve').func('HBCurve1').set('extrap', 'linear');
model.material('mat2').propertyGroup('HBCurve').func('HBCurve1').set('table', {'0.20440501' '0'; '0.216180095080729' '3.98921158854167'; '0.227790711645833' '8.04059270833333'; '0.239072391179687' '12.216312890625'; '0.249860665166667' '16.5785416666667'; '0.260086841570312' '21.168725390625'; '0.270065334270833' '25.9454177083333'; '0.280206333627604' '30.8464490885417'; '0.29092003' '35.80965'; '0.302521164247396' '40.7832125';  ...
'0.314942679229167' '45.756775'; '0.328022068304688' '50.7303375'; '0.341596824833333' '55.7039'; '0.355503951700521' '60.6774625'; '0.369578489895833' '65.651025'; '0.383654989934896' '70.6245875'; '0.397568002333333' '75.59815'; '0.411179734270833' '80.5717125'; '0.424463019583333' '85.545275'; '0.437418348770833' '90.5188375';  ...
'0.450046212333333' '95.4924'; '0.462360642984375' '100.4659625'; '0.474429842291667' '105.439525'; '0.486335554036458' '110.4130875'; '0.498159522' '115.38665'; '0.509969865997396' '120.3602125'; '0.521780209979167' '125.333775'; '0.533590553929687' '130.3073375'; '0.545400897833333' '135.2809'; '0.557225029135417' '140.2544625';  ...
'0.569131885125' '145.228025'; '0.581204190552083' '150.2015875'; '0.593524670166667' '155.17515'; '0.606107356674479' '160.1487125'; '0.618691514604167' '165.122275'; '0.630947716440104' '170.0958375'; '0.642546534666667' '175.0694'; '0.653282056648438' '180.0429625'; '0.663442429270833' '185.016525'; '0.673439314299479' '189.9900875';  ...
'0.6836843735' '194.96365'; '0.694492919947917' '199.9372125'; '0.705794871958333' '204.910775'; '0.71742379915625' '209.8843375'; '0.729213271166667' '214.8579'; '0.741025004731771' '219.8314625'; '0.7528333050625' '224.805025'; '0.764640624486979' '229.7785875'; '0.776449415333333' '234.75215'; '0.788261394229167' '239.7257125';  ...
'0.800075335' '244.699275'; '0.811889275770833' '249.6728375'; '0.823701254666667' '254.6464'; '0.835482552348958' '259.6199625'; '0.847097419625' '264.593525'; '0.858383349838542' '269.5670875'; '0.869177836333333' '274.54065'; '0.879379639427083' '279.5142125'; '0.889132587333333' '284.487775'; '0.898641775239583' '289.4613375';  ...
'0.908112298333333' '294.4349'; '0.91772151340625' '299.4084625'; '0.927535823666667' '304.382025'; '0.937593893927083' '309.3555875'; '0.947934389' '314.32915'; '0.958548943768229' '319.3027125'; '0.969241073395833' '324.276275'; '0.979767263117188' '329.2498375'; '0.989883998166667' '334.2234'; '0.999415434015625' '339.1969625';  ...
'1.00845640708333' '344.170525'; '1.01716942402604' '349.1440875'; '1.0257169915' '354.11765'; '1.03422796496875' '359.0912125'; '1.042696595125' '364.064775'; '1.05108348146875' '369.0383375'; '1.0593492235' '374.0119'; '1.06746763596615' '378.9854625'; '1.07546539460417' '383.959025'; '1.08338239039844' '388.9325875';  ...
'1.09125851433333' '393.90615'; '1.09912684540365' '398.8797125'; '1.10699321464583' '403.853275'; '1.11485664110677' '408.8268375'; '1.12271614383333' '413.8004'; '1.13057808519792' '418.7739625'; '1.138478200875' '423.747525'; '1.14645956986458' '428.7210875'; '1.15456527116667' '433.69465'; '1.16283099958854' '438.6682125';  ...
'1.17126291316667' '443.641775'; '1.17985978574479' '448.6153375'; '1.18862039116667' '453.5889'; '1.19754370763542' '458.5624625'; '1.20662953079167' '463.536025'; '1.21587786063542' '468.5095875'; '1.22528869716667' '473.48315'; '1.23481423388542' '478.4567125'; '1.24421543829167' '483.430275'; '1.25320547138542' '488.4038375';  ...
'1.26149749416667' '493.3774'; '1.26890036238021' '498.3509625'; '1.27560571075' '503.324525'; '1.28190086874479' '508.2980875'; '1.28807316583333' '513.27165'; '1.29436204323438' '518.2452125'; '1.30081538916667' '523.218775'; '1.30743320359896' '528.1923375'; '1.3142154865' '533.1659'; '1.32114163841406' '538.1394625';  ...
'1.3281086621875' '543.113025'; '1.33499296124219' '548.0865875'; '1.341670939' '553.06015'; '1.34805334488802' '558.0337125'; '1.35418831235417' '563.007275'; '1.36015832085156' '567.9808375'; '1.36604584983333' '572.9544'; '1.37193333789062' '577.9279625'; '1.37790306016667' '582.901525'; '1.38403725094271' '587.8750875';  ...
'1.3904181445' '592.84865'; '1.39707327489062' '597.8222125'; '1.40381137525' '602.795775'; '1.41038647848437' '607.7693375'; '1.4165526175' '612.7429'; '1.42213202678125' '617.7164625'; '1.427219747125' '622.690025'; '1.43197902090625' '627.6635875'; '1.4365730905' '632.63715'; '1.44113811383073' '637.6107125';  ...
'1.44570191102083' '642.584275'; '1.45026521774219' '647.5578375'; '1.45482876966667' '652.5314'; '1.45939309811458' '657.5049625'; '1.463957917' '662.478525'; '1.46852273588542' '667.4520875'; '1.47308706433333' '672.42565'; '1.47764368165885' '677.3992125'; '1.4821584461875' '682.372775'; '1.4865904859974' '687.3463375';  ...
'1.49089892916667' '692.3199'; '1.49506346234375' '697.2934625'; '1.49914600645833' '702.267025'; '1.50322904101042' '707.2405875'; '1.5073950455' '712.21415'; '1.511705777375' '717.1877125'; '1.516140105875' '722.161275'; '1.5206561781875' '727.1348375'; '1.5252121415' '732.1084'; '1.52976634735417' '737.0819625';  ...
'1.53427796470833' '742.055525'; '1.538706366875' '747.0290875'; '1.54301092716667' '752.00265'; '1.54717149572396' '756.9762125'; '1.55124983' '761.949775'; '1.55532816427604' '766.9233375'; '1.55948873283333' '771.8969'; '1.56379317051042' '776.8704625'; '1.568220714375' '781.844025'; '1.57273000205208' '786.8175875';  ...
'1.57727967116667' '791.79115'; '1.58183529394531' '796.7647125'; '1.58639018102083' '801.738275'; '1.5909445776276' '806.7118375'; '1.595498729' '811.6854'; '1.60003929727604' '816.6589625'; '1.60449861220833' '821.632525'; '1.60879542045313' '826.6060875'; '1.61284846866667' '831.57965'; '1.61661023645052' '836.5532125';  ...
'1.6201681351875' '841.526775'; '1.62364330920573' '846.5003375'; '1.62715690283333' '851.4739'; '1.63076296140977' '856.622573346354'; '1.63424713431982' '862.821911770833'; '1.63732797195959' '871.122580351563'; '1.63972402472519' '882.575244166667'; '1.64124614383206' '901.964884804687'; '1.6420743837729' '949.013749895833'; '1.64248109985973' '1047.17840358073';  ...
'1.64273864740458' '1219.91541'; '1.64306885638538' '1482.68736773437'; '1.6434914554437' '1818.981013125'; '1.64397564788704' '2204.28911695312'; '1.6444906370229' '2614.10445'});
model.material('mat2').propertyGroup('HBCurve').set('normH', 'HBCurve1(normB[1/(T)])[A/m]');
model.material('mat2').propertyGroup('HBCurve').addInput('magneticfluxdensity');
model.material('mat2').propertyGroup('BHCurve').func.label('Functions');
model.material('mat2').propertyGroup('BHCurve').func('BHCurve1').set('extrap', 'linear');
model.material('mat2').propertyGroup('BHCurve').func('BHCurve1').set('table', {'0' '0.20440501'; '3.98921158854167' '0.216180095080729'; '8.04059270833333' '0.227790711645833'; '12.216312890625' '0.239072391179687'; '16.5785416666667' '0.249860665166667'; '21.168725390625' '0.260086841570312'; '25.9454177083333' '0.270065334270833'; '30.8464490885417' '0.280206333627604'; '35.80965' '0.29092003'; '40.7832125' '0.302521164247396';  ...
'45.756775' '0.314942679229167'; '50.7303375' '0.328022068304688'; '55.7039' '0.341596824833333'; '60.6774625' '0.355503951700521'; '65.651025' '0.369578489895833'; '70.6245875' '0.383654989934896'; '75.59815' '0.397568002333333'; '80.5717125' '0.411179734270833'; '85.545275' '0.424463019583333'; '90.5188375' '0.437418348770833';  ...
'95.4924' '0.450046212333333'; '100.4659625' '0.462360642984375'; '105.439525' '0.474429842291667'; '110.4130875' '0.486335554036458'; '115.38665' '0.498159522'; '120.3602125' '0.509969865997396'; '125.333775' '0.521780209979167'; '130.3073375' '0.533590553929687'; '135.2809' '0.545400897833333'; '140.2544625' '0.557225029135417';  ...
'145.228025' '0.569131885125'; '150.2015875' '0.581204190552083'; '155.17515' '0.593524670166667'; '160.1487125' '0.606107356674479'; '165.122275' '0.618691514604167'; '170.0958375' '0.630947716440104'; '175.0694' '0.642546534666667'; '180.0429625' '0.653282056648438'; '185.016525' '0.663442429270833'; '189.9900875' '0.673439314299479';  ...
'194.96365' '0.6836843735'; '199.9372125' '0.694492919947917'; '204.910775' '0.705794871958333'; '209.8843375' '0.71742379915625'; '214.8579' '0.729213271166667'; '219.8314625' '0.741025004731771'; '224.805025' '0.7528333050625'; '229.7785875' '0.764640624486979'; '234.75215' '0.776449415333333'; '239.7257125' '0.788261394229167';  ...
'244.699275' '0.800075335'; '249.6728375' '0.811889275770833'; '254.6464' '0.823701254666667'; '259.6199625' '0.835482552348958'; '264.593525' '0.847097419625'; '269.5670875' '0.858383349838542'; '274.54065' '0.869177836333333'; '279.5142125' '0.879379639427083'; '284.487775' '0.889132587333333'; '289.4613375' '0.898641775239583';  ...
'294.4349' '0.908112298333333'; '299.4084625' '0.91772151340625'; '304.382025' '0.927535823666667'; '309.3555875' '0.937593893927083'; '314.32915' '0.947934389'; '319.3027125' '0.958548943768229'; '324.276275' '0.969241073395833'; '329.2498375' '0.979767263117188'; '334.2234' '0.989883998166667'; '339.1969625' '0.999415434015625';  ...
'344.170525' '1.00845640708333'; '349.1440875' '1.01716942402604'; '354.11765' '1.0257169915'; '359.0912125' '1.03422796496875'; '364.064775' '1.042696595125'; '369.0383375' '1.05108348146875'; '374.0119' '1.0593492235'; '378.9854625' '1.06746763596615'; '383.959025' '1.07546539460417'; '388.9325875' '1.08338239039844';  ...
'393.90615' '1.09125851433333'; '398.8797125' '1.09912684540365'; '403.853275' '1.10699321464583'; '408.8268375' '1.11485664110677'; '413.8004' '1.12271614383333'; '418.7739625' '1.13057808519792'; '423.747525' '1.138478200875'; '428.7210875' '1.14645956986458'; '433.69465' '1.15456527116667'; '438.6682125' '1.16283099958854';  ...
'443.641775' '1.17126291316667'; '448.6153375' '1.17985978574479'; '453.5889' '1.18862039116667'; '458.5624625' '1.19754370763542'; '463.536025' '1.20662953079167'; '468.5095875' '1.21587786063542'; '473.48315' '1.22528869716667'; '478.4567125' '1.23481423388542'; '483.430275' '1.24421543829167'; '488.4038375' '1.25320547138542';  ...
'493.3774' '1.26149749416667'; '498.3509625' '1.26890036238021'; '503.324525' '1.27560571075'; '508.2980875' '1.28190086874479'; '513.27165' '1.28807316583333'; '518.2452125' '1.29436204323438'; '523.218775' '1.30081538916667'; '528.1923375' '1.30743320359896'; '533.1659' '1.3142154865'; '538.1394625' '1.32114163841406';  ...
'543.113025' '1.3281086621875'; '548.0865875' '1.33499296124219'; '553.06015' '1.341670939'; '558.0337125' '1.34805334488802'; '563.007275' '1.35418831235417'; '567.9808375' '1.36015832085156'; '572.9544' '1.36604584983333'; '577.9279625' '1.37193333789062'; '582.901525' '1.37790306016667'; '587.8750875' '1.38403725094271';  ...
'592.84865' '1.3904181445'; '597.8222125' '1.39707327489062'; '602.795775' '1.40381137525'; '607.7693375' '1.41038647848437'; '612.7429' '1.4165526175'; '617.7164625' '1.42213202678125'; '622.690025' '1.427219747125'; '627.6635875' '1.43197902090625'; '632.63715' '1.4365730905'; '637.6107125' '1.44113811383073';  ...
'642.584275' '1.44570191102083'; '647.5578375' '1.45026521774219'; '652.5314' '1.45482876966667'; '657.5049625' '1.45939309811458'; '662.478525' '1.463957917'; '667.4520875' '1.46852273588542'; '672.42565' '1.47308706433333'; '677.3992125' '1.47764368165885'; '682.372775' '1.4821584461875'; '687.3463375' '1.4865904859974';  ...
'692.3199' '1.49089892916667'; '697.2934625' '1.49506346234375'; '702.267025' '1.49914600645833'; '707.2405875' '1.50322904101042'; '712.21415' '1.5073950455'; '717.1877125' '1.511705777375'; '722.161275' '1.516140105875'; '727.1348375' '1.5206561781875'; '732.1084' '1.5252121415'; '737.0819625' '1.52976634735417';  ...
'742.055525' '1.53427796470833'; '747.0290875' '1.538706366875'; '752.00265' '1.54301092716667'; '756.9762125' '1.54717149572396'; '761.949775' '1.55124983'; '766.9233375' '1.55532816427604'; '771.8969' '1.55948873283333'; '776.8704625' '1.56379317051042'; '781.844025' '1.568220714375'; '786.8175875' '1.57273000205208';  ...
'791.79115' '1.57727967116667'; '796.7647125' '1.58183529394531'; '801.738275' '1.58639018102083'; '806.7118375' '1.5909445776276'; '811.6854' '1.595498729'; '816.6589625' '1.60003929727604'; '821.632525' '1.60449861220833'; '826.6060875' '1.60879542045313'; '831.57965' '1.61284846866667'; '836.5532125' '1.61661023645052';  ...
'841.526775' '1.6201681351875'; '846.5003375' '1.62364330920573'; '851.4739' '1.62715690283333'; '856.622573346354' '1.63076296140977'; '862.821911770833' '1.63424713431982'; '871.122580351563' '1.63732797195959'; '882.575244166667' '1.63972402472519'; '901.964884804687' '1.64124614383206'; '949.013749895833' '1.6420743837729'; '1047.17840358073' '1.64248109985973';  ...
'1219.91541' '1.64273864740458'; '1482.68736773437' '1.64306885638538'; '1818.981013125' '1.6434914554437'; '2204.28911695312' '1.64397564788704'; '2614.10445' '1.6444906370229'});
model.material('mat2').propertyGroup('BHCurve').set('normB', 'BHCurve1(normH[1/(A/m)])[T]');
model.material('mat2').propertyGroup('BHCurve').addInput('magneticfield');

model.physics('ht').feature('init1').set('Tinit', '77');
model.physics('ht').feature('init2').set('Tinit', '77');
model.physics('ht').feature('init3').set('Tinit', '77');
model.physics('ht').feature('init4').set('Tinit', '77');
model.physics('ht').feature('init5').set('Tinit', '77');
model.physics('ht').feature('init6').set('Tinit', '77');
model.physics('ht').feature('init7').set('Tinit', '77');
model.physics('ht').feature('init8').set('Tinit', '77');
model.physics('ht').feature('init9').set('Tinit', '77');
model.physics('ht').feature('init10').set('Tinit', '77');
model.physics('ht').feature('init11').set('Tinit', '77');
model.physics('ht').feature('init12').set('Tinit', '77');
model.physics('ht').feature('init13').set('Tinit', '77');
model.physics('ht').feature('init14').set('Tinit', '77');
model.physics('ht').feature('init15').set('Tinit', '77');
model.physics('ht').feature('init16').set('Tinit', '77');
model.physics('ht').feature('init17').set('Tinit', '77');
model.physics('ht').feature('init18').set('Tinit', '77');
model.physics('ht').feature('init19').set('Tinit', '77');
model.physics('ht').feature('init20').set('Tinit', '77');
model.physics('ht').feature('init21').set('Tinit', '77');
model.physics('ht').feature('init22').set('Tinit', '77');
model.physics('ht').feature('init23').set('Tinit', '77');
model.physics('ht').feature('init24').set('Tinit', '77');
model.physics('ht').feature('init25').set('Tinit', '77');
model.physics('ht').feature('init26').set('Tinit', '77');
model.physics('ht').feature('init27').set('Tinit', '77');
model.physics('ht').feature('init28').set('Tinit', '77');
model.physics('ht').feature('init29').set('Tinit', '77');
model.physics('ht').feature('init30').set('Tinit', '77');
model.physics('ht').feature('init31').set('Tinit', '77');
model.physics('ht').feature('init32').set('Tinit', '77');
model.physics('ht').feature('init33').set('Tinit', '77');
model.physics('ht').feature('init34').set('Tinit', '77');
model.physics('ht').feature('init35').set('Tinit', '77');
model.physics('ht').feature('init36').set('Tinit', '77');
model.physics('ht').feature('init37').set('Tinit', '77');
model.physics('ht').feature('init38').set('Tinit', '77');
model.physics('ht').feature('init39').set('Tinit', '77');
model.physics('ht').feature('init40').set('Tinit', '77');
model.physics('ht').feature('init41').set('Tinit', '77');
model.physics('ht').feature('init42').set('Tinit', '77');
model.physics('ht').feature('init43').set('Tinit', '77');
model.physics('ht').feature('init44').set('Tinit', '77');
model.physics('ht').feature('init45').set('Tinit', '77');
model.physics('ht').feature('init46').set('Tinit', '77');
model.physics('ht').feature('init47').set('Tinit', '77');
model.physics('ht').feature('init48').set('Tinit', '77');
model.physics('ht').feature('init49').set('Tinit', '77');
model.physics('ht').feature('init50').set('Tinit', '77');
model.physics('ht').feature('init51').set('Tinit', '77');
model.physics('ht').feature('init52').set('Tinit', '77');
model.physics('ht').feature('init53').set('Tinit', '77');
model.physics('ht').feature('init54').set('Tinit', '77');
model.physics('ht').feature('init55').set('Tinit', '77');
model.physics('ht').feature('init56').set('Tinit', '77');
model.physics('ht').feature('init57').set('Tinit', '77');
model.physics('ht').feature('init58').set('Tinit', '77');
model.physics('ht').feature('init59').set('Tinit', '77');
model.physics('ht').feature('init60').set('Tinit', '77');
model.physics('ht').feature('init61').set('Tinit', '77');
model.physics('ht').feature('init62').set('Tinit', '77');
model.physics('ht').feature('init63').set('Tinit', '77');
model.physics('ht').feature('init64').set('Tinit', '77');
model.physics('ht').feature('init65').set('Tinit', '77');
model.physics('ht').feature('init66').set('Tinit', '77');
model.physics('ht').feature('init67').set('Tinit', '77');
model.physics('ht').feature('init68').set('Tinit', '77');
model.physics('ht').feature('init69').set('Tinit', '77');
model.physics('ht').feature('init70').set('Tinit', '77');
model.physics('ht').feature('init71').set('Tinit', '77');
model.physics('ht').feature('init72').set('Tinit', '77');
model.physics('ht').feature('init73').set('Tinit', '77');
model.physics('ht').feature('init74').set('Tinit', '77');
model.physics('ht').feature('init75').set('Tinit', '77');
model.physics('ht').feature('init76').set('Tinit', '77');
model.physics('ht').feature('init77').set('Tinit', '77');
model.physics('ht').feature('init78').set('Tinit', '77');
model.physics('ht').feature('init79').set('Tinit', '77');
model.physics('ht').feature('init80').set('Tinit', '77');
model.physics('ht').feature('init81').set('Tinit', '77');
model.physics('ht').feature('init82').set('Tinit', '77');
model.physics('ht').feature('init83').set('Tinit', '77');

model.mesh('mesh1').feature('size').set('hauto', 9);
model.mesh('mesh1').run;

model.result.table('evl2').label('Evaluation 2D');
model.result.table('evl2').comments('Interactive 2D values');

model.study.create('std1');
model.study('std1').create('time', 'Transient');
model.study.create('std2');
model.study('std2').create('time', 'Transient');

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').attach('std1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature.remove('fcDef');

model.study('std1').feature('time').set('initstudyhide', 'on');
model.study('std1').feature('time').set('initsolhide', 'on');
model.study('std1').feature('time').set('solnumhide', 'on');
model.study('std1').feature('time').set('notstudyhide', 'on');
model.study('std1').feature('time').set('notsolhide', 'on');
model.study('std1').feature('time').set('notsolnumhide', 'on');
model.study('std2').feature('time').set('initstudyhide', 'on');
model.study('std2').feature('time').set('initsolhide', 'on');
model.study('std2').feature('time').set('solnumhide', 'on');
model.study('std2').feature('time').set('notstudyhide', 'on');
model.study('std2').feature('time').set('notsolhide', 'on');
model.study('std2').feature('time').set('notsolnumhide', 'on');

model.result.dataset.create('rev1', 'Revolve2D');
model.result.create('pg1', 'PlotGroup2D');
model.result('pg1').create('surf1', 'Surface');

model.study('std1').feature('time').set('tlist', 'range(0,1e-5,1e-5)');
model.study('std2').feature('time').set('initstudy', 'std1');
model.study('std2').feature('time').set('initmethod', 'sol');
model.study('std2').feature('time').set('useinitsol', 'on');
model.study('std2').feature('time').set('tlist', 'range(0,1e-5,1e-5)');
model.study('std2').feature('time').set('solnum', 'last');

model.sol('sol1').attach('std1');
model.sol('sol1').feature('t1').set('tlist', 'range(0,1e-5,1e-5)');
model.sol('sol1').feature('t1').set('estrat', 'exclude');
model.sol('sol1').feature('t1').set('maxorder', '2');
model.sol('sol1').feature('t1').feature('fc1').set('jtech', 'once');
model.sol('sol1').feature('t1').feature('fc1').set('damp', '0.9');
model.sol('sol1').feature('t1').feature('fc1').set('maxiter', '5');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').runAll;

model.result.dataset('rev1').set('startangle', '-90');
model.result.dataset('rev1').set('revangle', '225');
model.result('pg1').run;
model.result('pg1').run;

model.sol.create('sol2');
model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', '1');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', 'last');

model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'time');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,1e-5,1e-5)');
model.sol('sol2').feature('t1').set('plot', 'off');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalmethod', 'scaled');
model.sol('sol2').feature('t1').set('atolglobal', 0.001);
model.sol('sol2').feature('t1').set('estrat', 'exclude');
model.sol('sol2').feature('t1').set('maxorder', 2);
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature('fc1').set('jtech', 'once');
model.sol('sol2').feature('t1').feature('fc1').set('damp', 0.9);
model.sol('sol2').feature('t1').feature('fc1').set('maxiter', 5);
model.sol('sol2').feature('t1').create('d1', 'Direct');
model.sol('sol2').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('t1').feature('fc1').set('jtech', 'once');
model.sol('sol2').feature('t1').feature('fc1').set('damp', 0.9);
model.sol('sol2').feature('t1').feature('fc1').set('maxiter', 5);
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').attach('std2');

model.label('ht_draft.mph');

model.sol('sol1').study('std1');

model.study('std1').feature('time').set('notlistsolnum', 1);
model.study('std1').feature('time').set('notsolnum', '1');
model.study('std1').feature('time').set('listsolnum', 1);
model.study('std1').feature('time').set('solnum', '1');

model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,1e-5,1e-5)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('atolglobalmethod', 'scaled');
model.sol('sol1').feature('t1').set('atolglobal', 0.001);
model.sol('sol1').feature('t1').set('estrat', 'exclude');
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('jtech', 'once');
model.sol('sol1').feature('t1').feature('fc1').set('damp', 0.9);
model.sol('sol1').feature('t1').feature('fc1').set('maxiter', 5);
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('jtech', 'once');
model.sol('sol1').feature('t1').feature('fc1').set('damp', 0.9);
model.sol('sol1').feature('t1').feature('fc1').set('maxiter', 5);
model.sol('sol1').feature('t1').feature.remove('fcDef');

model.study('std2').feature('time').set('solnum', 'last');
model.study('std2').feature('time').set('solvertype', 'solnum');
model.study('std2').feature('time').set('listsolnum', {'1'});
model.study('std2').feature('time').set('solnum', 'last');
model.study('std2').feature('time').set('solnumhide', 'off');
model.study('std2').feature('time').set('initstudyhide', 'on');
model.study('std2').feature('time').set('initsolhide', 'on');

model.sol('sol2').feature('v1').set('solnum', 'last');
model.sol('sol2').feature('v1').set('solvertype', 'solnum');
model.sol('sol2').feature('v1').set('listsolnum', {'1'});
model.sol('sol2').feature('v1').set('solnum', 'last');
model.sol('sol1').attach('std1');
model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', '1');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', 'last');

model.sol('sol2').feature.remove('t1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'time');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,1e-5,1e-5)');
model.sol('sol2').feature('t1').set('plot', 'off');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalmethod', 'scaled');
model.sol('sol2').feature('t1').set('atolglobal', 0.001);
model.sol('sol2').feature('t1').set('estrat', 'exclude');
model.sol('sol2').feature('t1').set('maxorder', 2);
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature('fc1').set('jtech', 'once');
model.sol('sol2').feature('t1').feature('fc1').set('damp', 0.9);
model.sol('sol2').feature('t1').feature('fc1').set('maxiter', 5);
model.sol('sol2').feature('t1').create('d1', 'Direct');
model.sol('sol2').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('t1').feature('fc1').set('jtech', 'once');
model.sol('sol2').feature('t1').feature('fc1').set('damp', 0.9);
model.sol('sol2').feature('t1').feature('fc1').set('maxiter', 5);
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').attach('std2');

model.result.dataset.create('rev2', 'Revolve2D');
model.result.dataset('rev2').set('data', 'dset2');
model.result.dataset('rev2').set('startangle', -90);
model.result.dataset('rev2').set('revangle', 225);
model.result.dataset('rev2').set('spacevars', {'rev1x' 'rev1y' 'rev1z'});
model.result.dataset('rev2').set('anglevar', 'rev1phi');
model.result.dataset('rev2').set('data', 'dset2');
model.result.create('pg2', 'PlotGroup3D');
model.result('pg2').label('Temperature, 3D (ht)');
model.result('pg2').set('data', 'rev2');
model.result('pg2').set('oldanalysistype', 'noneavailable');
model.result('pg2').set('data', 'rev2');
model.result('pg2').feature.create('surf1', 'Surface');
model.result('pg2').feature('surf1').set('oldanalysistype', 'noneavailable');
model.result('pg2').feature('surf1').set('colortable', 'ThermalLight');
model.result('pg2').feature('surf1').set('data', 'parent');
model.result.create('pg3', 'PlotGroup2D');
model.result('pg3').label('Isothermal Contours (ht)');
model.result('pg3').set('data', 'dset2');
model.result('pg3').set('oldanalysistype', 'noneavailable');
model.result('pg3').set('data', 'dset2');
model.result('pg3').feature.create('con1', 'Contour');
model.result('pg3').feature('con1').set('oldanalysistype', 'noneavailable');
model.result('pg3').feature('con1').set('colortable', 'ThermalLight');
model.result('pg3').feature('con1').set('data', 'parent');

model.sol('sol1').study('std1');

model.study('std1').feature('time').set('notlistsolnum', 1);
model.study('std1').feature('time').set('notsolnum', '1');
model.study('std1').feature('time').set('listsolnum', 1);
model.study('std1').feature('time').set('solnum', '1');

model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,1e-5,1e-5)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('atolglobalmethod', 'scaled');
model.sol('sol1').feature('t1').set('atolglobal', 0.001);
model.sol('sol1').feature('t1').set('estrat', 'exclude');
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('jtech', 'once');
model.sol('sol1').feature('t1').feature('fc1').set('damp', 0.9);
model.sol('sol1').feature('t1').feature('fc1').set('maxiter', 5);
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('jtech', 'once');
model.sol('sol1').feature('t1').feature('fc1').set('damp', 0.9);
model.sol('sol1').feature('t1').feature('fc1').set('maxiter', 5);
model.sol('sol1').feature('t1').feature.remove('fcDef');

model.study('std2').feature('time').set('solnum', 'last');
model.study('std2').feature('time').set('solvertype', 'solnum');
model.study('std2').feature('time').set('listsolnum', {'1'});
model.study('std2').feature('time').set('solnum', 'last');
model.study('std2').feature('time').set('solnumhide', 'off');
model.study('std2').feature('time').set('initstudyhide', 'on');
model.study('std2').feature('time').set('initsolhide', 'on');

model.sol('sol2').feature('v1').set('solnum', 'last');
model.sol('sol2').feature('v1').set('solvertype', 'solnum');
model.sol('sol2').feature('v1').set('listsolnum', {'1'});
model.sol('sol2').feature('v1').set('solnum', 'last');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').setIndex('looplevel', '2', 0);
model.result('pg1').run;

model.physics('ht').feature('hs1').set('Q', '1e12');

model.sol('sol1').study('std1');

model.study('std1').feature('time').set('notlistsolnum', 1);
model.study('std1').feature('time').set('notsolnum', '1');
model.study('std1').feature('time').set('listsolnum', 1);
model.study('std1').feature('time').set('solnum', '1');

model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,1e-5,1e-5)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('atolglobalmethod', 'scaled');
model.sol('sol1').feature('t1').set('atolglobal', 0.001);
model.sol('sol1').feature('t1').set('estrat', 'exclude');
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('jtech', 'once');
model.sol('sol1').feature('t1').feature('fc1').set('damp', 0.9);
model.sol('sol1').feature('t1').feature('fc1').set('maxiter', 5);
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('jtech', 'once');
model.sol('sol1').feature('t1').feature('fc1').set('damp', 0.9);
model.sol('sol1').feature('t1').feature('fc1').set('maxiter', 5);
model.sol('sol1').feature('t1').feature.remove('fcDef');

model.study('std2').feature('time').set('solnum', 'last');
model.study('std2').feature('time').set('solvertype', 'solnum');
model.study('std2').feature('time').set('listsolnum', {'1'});
model.study('std2').feature('time').set('solnum', 'last');
model.study('std2').feature('time').set('solnumhide', 'off');
model.study('std2').feature('time').set('initstudyhide', 'on');
model.study('std2').feature('time').set('initsolhide', 'on');

model.sol('sol2').feature('v1').set('solnum', 'last');
model.sol('sol2').feature('v1').set('solvertype', 'solnum');
model.sol('sol2').feature('v1').set('listsolnum', {'1'});
model.sol('sol2').feature('v1').set('solnum', 'last');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.sol('sol2').study('std2');

model.study('std2').feature('time').set('notlistsolnum', 1);
model.study('std2').feature('time').set('notsolnum', '1');
model.study('std2').feature('time').set('listsolnum', 1);
model.study('std2').feature('time').set('solnum', 'last');

model.sol('sol2').feature.remove('t1');
model.sol('sol2').feature.remove('v1');
model.sol('sol2').feature.remove('st1');
model.sol('sol2').create('st1', 'StudyStep');
model.sol('sol2').feature('st1').set('study', 'std2');
model.sol('sol2').feature('st1').set('studystep', 'time');
model.sol('sol2').create('v1', 'Variables');
model.sol('sol2').feature('v1').set('control', 'time');
model.sol('sol2').create('t1', 'Time');
model.sol('sol2').feature('t1').set('tlist', 'range(0,1e-5,1e-5)');
model.sol('sol2').feature('t1').set('plot', 'off');
model.sol('sol2').feature('t1').set('plotgroup', 'pg1');
model.sol('sol2').feature('t1').set('plotfreq', 'tout');
model.sol('sol2').feature('t1').set('probesel', 'all');
model.sol('sol2').feature('t1').set('probes', {});
model.sol('sol2').feature('t1').set('probefreq', 'tsteps');
model.sol('sol2').feature('t1').set('atolglobalmethod', 'scaled');
model.sol('sol2').feature('t1').set('atolglobal', 0.001);
model.sol('sol2').feature('t1').set('estrat', 'exclude');
model.sol('sol2').feature('t1').set('maxorder', 2);
model.sol('sol2').feature('t1').set('control', 'time');
model.sol('sol2').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol2').feature('t1').feature('fc1').set('jtech', 'once');
model.sol('sol2').feature('t1').feature('fc1').set('damp', 0.9);
model.sol('sol2').feature('t1').feature('fc1').set('maxiter', 5);
model.sol('sol2').feature('t1').create('d1', 'Direct');
model.sol('sol2').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol2').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol2').feature('t1').feature('fc1').set('jtech', 'once');
model.sol('sol2').feature('t1').feature('fc1').set('damp', 0.9);
model.sol('sol2').feature('t1').feature('fc1').set('maxiter', 5);
model.sol('sol2').feature('t1').feature.remove('fcDef');
model.sol('sol2').attach('std2');
model.sol('sol2').runAll;

model.result('pg2').run;
model.result('pg1').run;
model.result('pg3').run;
model.result.remove('pg3');
model.result('pg1').run;
model.result('pg1').set('data', 'dset2');
model.result('pg1').run;
model.result('pg2').run;
model.result.remove('pg2');
model.result('pg1').run;
model.result.numerical.create('int1', 'IntSurface');
model.result.numerical('int1').selection.set([82]);
model.result.numerical('int1').set('data', 'dset2');
model.result.numerical('int1').selection.set([82]);
model.result.table.create('tbl1', 'Table');
model.result.table('tbl1').comments('Surface Integration 1 (T)');
model.result.numerical('int1').set('table', 'tbl1');
model.result.numerical('int1').setResult;
model.result.numerical('int1').set('expr', 'T / (40 * 0.75[m^2])');
model.result.numerical('int1').set('table', 'tbl1');
model.result.numerical('int1').appendResult;
model.result.numerical('int1').set('expr', 'T / (40 [m] * 0.75 [m])');
model.result.numerical('int1').set('table', 'tbl1');
model.result.numerical('int1').appendResult;
model.result.numerical.create('av1', 'AvSurface');
model.result.numerical('av1').selection.set([82]);
model.result.table.create('tbl2', 'Table');
model.result.table('tbl2').comments('Surface Average 1 (T)');
model.result.numerical('av1').set('table', 'tbl2');
model.result.numerical('av1').setResult;

model.physics('ht').feature('hs1').set('Q', '0');

model.label('ht_draft.mph');

model.study('std1').feature('time').set('useinitsol', 'on');
model.study('std1').feature('time').set('initmethod', 'sol');
model.study('std1').feature('time').set('initstudy', 'std2');
model.study('std1').feature('time').set('solnum', 'last');

out = model;
