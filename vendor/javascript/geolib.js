import e from"./computeDestinationPoint.js";import t from"./convertArea.js";import r from"./convertDistance.js";import i from"./convertSpeed.js";import n from"./decimalToSexagesimal.js";import o from"./findNearest.js";import u from"./getAreaOfPolygon.js";import a from"./getBounds.js";import f from"./getBoundsOfDistance.js";import g from"./getCenter.js";import l from"./getCenterOfBounds.js";import s from"./getCompassDirection.js";import d from"./getCoordinateKey.js";import m from"./getCoordinateKeys.js";import c from"./getDistance.js";import p from"./getDistanceFromLine.js";import D from"./getGreatCircleBearing.js";import b from"./getLatitude.js";import j from"./getLongitude.js";import P from"./getPathLength.js";import y from"./getPreciseDistance.js";import v from"./getRhumbLineBearing.js";import O from"./getRoughCompassDirection.js";import R from"./getSpeed.js";import _ from"./isDecimal.js";import q from"./isPointInLine.js";import L from"./isPointInPolygon.js";import C from"./isPointNearLine.js";import B from"./isPointWithinRadius.js";import h from"./isSexagesimal.js";import S from"./isValidCoordinate.js";import x from"./isValidLatitude.js";import T from"./isValidLongitude.js";import A from"./orderByDistance.js";import N from"./sexagesimalToDecimal.js";import V from"./toDecimal.js";import K from"./toRad.js";import I from"./toDeg.js";import M from"./wktToPolygon.js";import k from"./constants.js";import"./robustAcos.js";var w={};Object.defineProperty(w,"__esModule",{value:true});var F={computeDestinationPoint:true,convertArea:true,convertDistance:true,convertSpeed:true,decimalToSexagesimal:true,findNearest:true,getAreaOfPolygon:true,getBounds:true,getBoundsOfDistance:true,getCenter:true,getCenterOfBounds:true,getCompassDirection:true,getCoordinateKey:true,getCoordinateKeys:true,getDistance:true,getDistanceFromLine:true,getGreatCircleBearing:true,getLatitude:true,getLongitude:true,getPathLength:true,getPreciseDistance:true,getRhumbLineBearing:true,getRoughCompassDirection:true,getSpeed:true,isDecimal:true,isPointInLine:true,isPointInPolygon:true,isPointNearLine:true,isPointWithinRadius:true,isSexagesimal:true,isValidCoordinate:true,isValidLatitude:true,isValidLongitude:true,orderByDistance:true,sexagesimalToDecimal:true,toDecimal:true,toRad:true,toDeg:true,wktToPolygon:true};Object.defineProperty(w,"computeDestinationPoint",{enumerable:true,get:function get(){return G.default}});Object.defineProperty(w,"convertArea",{enumerable:true,get:function get(){return W.default}});Object.defineProperty(w,"convertDistance",{enumerable:true,get:function get(){return X.default}});Object.defineProperty(w,"convertSpeed",{enumerable:true,get:function get(){return E.default}});Object.defineProperty(w,"decimalToSexagesimal",{enumerable:true,get:function get(){return z.default}});Object.defineProperty(w,"findNearest",{enumerable:true,get:function get(){return H.default}});Object.defineProperty(w,"getAreaOfPolygon",{enumerable:true,get:function get(){return J.default}});Object.defineProperty(w,"getBounds",{enumerable:true,get:function get(){return Q.default}});Object.defineProperty(w,"getBoundsOfDistance",{enumerable:true,get:function get(){return U.default}});Object.defineProperty(w,"getCenter",{enumerable:true,get:function get(){return Y.default}});Object.defineProperty(w,"getCenterOfBounds",{enumerable:true,get:function get(){return Z.default}});Object.defineProperty(w,"getCompassDirection",{enumerable:true,get:function get(){return $.default}});Object.defineProperty(w,"getCoordinateKey",{enumerable:true,get:function get(){return ee.default}});Object.defineProperty(w,"getCoordinateKeys",{enumerable:true,get:function get(){return te.default}});Object.defineProperty(w,"getDistance",{enumerable:true,get:function get(){return re.default}});Object.defineProperty(w,"getDistanceFromLine",{enumerable:true,get:function get(){return ie.default}});Object.defineProperty(w,"getGreatCircleBearing",{enumerable:true,get:function get(){return ne.default}});Object.defineProperty(w,"getLatitude",{enumerable:true,get:function get(){return oe.default}});Object.defineProperty(w,"getLongitude",{enumerable:true,get:function get(){return ue.default}});Object.defineProperty(w,"getPathLength",{enumerable:true,get:function get(){return ae.default}});Object.defineProperty(w,"getPreciseDistance",{enumerable:true,get:function get(){return fe.default}});Object.defineProperty(w,"getRhumbLineBearing",{enumerable:true,get:function get(){return ge.default}});Object.defineProperty(w,"getRoughCompassDirection",{enumerable:true,get:function get(){return le.default}});Object.defineProperty(w,"getSpeed",{enumerable:true,get:function get(){return se.default}});Object.defineProperty(w,"isDecimal",{enumerable:true,get:function get(){return de.default}});Object.defineProperty(w,"isPointInLine",{enumerable:true,get:function get(){return me.default}});Object.defineProperty(w,"isPointInPolygon",{enumerable:true,get:function get(){return ce.default}});Object.defineProperty(w,"isPointNearLine",{enumerable:true,get:function get(){return pe.default}});Object.defineProperty(w,"isPointWithinRadius",{enumerable:true,get:function get(){return De.default}});Object.defineProperty(w,"isSexagesimal",{enumerable:true,get:function get(){return be.default}});Object.defineProperty(w,"isValidCoordinate",{enumerable:true,get:function get(){return je.default}});Object.defineProperty(w,"isValidLatitude",{enumerable:true,get:function get(){return Pe.default}});Object.defineProperty(w,"isValidLongitude",{enumerable:true,get:function get(){return ye.default}});Object.defineProperty(w,"orderByDistance",{enumerable:true,get:function get(){return ve.default}});Object.defineProperty(w,"sexagesimalToDecimal",{enumerable:true,get:function get(){return Oe.default}});Object.defineProperty(w,"toDecimal",{enumerable:true,get:function get(){return Re.default}});Object.defineProperty(w,"toRad",{enumerable:true,get:function get(){return _e.default}});Object.defineProperty(w,"toDeg",{enumerable:true,get:function get(){return qe.default}});Object.defineProperty(w,"wktToPolygon",{enumerable:true,get:function get(){return Le.default}});var G=_interopRequireDefault(e);var W=_interopRequireDefault(t);var X=_interopRequireDefault(r);var E=_interopRequireDefault(i);var z=_interopRequireDefault(n);var H=_interopRequireDefault(o);var J=_interopRequireDefault(u);var Q=_interopRequireDefault(a);var U=_interopRequireDefault(f);var Y=_interopRequireDefault(g);var Z=_interopRequireDefault(l);var $=_interopRequireDefault(s);var ee=_interopRequireDefault(d);var te=_interopRequireDefault(m);var re=_interopRequireDefault(c);var ie=_interopRequireDefault(p);var ne=_interopRequireDefault(D);var oe=_interopRequireDefault(b);var ue=_interopRequireDefault(j);var ae=_interopRequireDefault(P);var fe=_interopRequireDefault(y);var ge=_interopRequireDefault(v);var le=_interopRequireDefault(O);var se=_interopRequireDefault(R);var de=_interopRequireDefault(_);var me=_interopRequireDefault(q);var ce=_interopRequireDefault(L);var pe=_interopRequireDefault(C);var De=_interopRequireDefault(B);var be=_interopRequireDefault(h);var je=_interopRequireDefault(S);var Pe=_interopRequireDefault(x);var ye=_interopRequireDefault(T);var ve=_interopRequireDefault(A);var Oe=_interopRequireDefault(N);var Re=_interopRequireDefault(V);var _e=_interopRequireDefault(K);var qe=_interopRequireDefault(I);var Le=_interopRequireDefault(M);var Ce=k;Object.keys(Ce).forEach((function(e){"default"!==e&&"__esModule"!==e&&(Object.prototype.hasOwnProperty.call(F,e)||Object.defineProperty(w,e,{enumerable:true,get:function get(){return Ce[e]}}))}));function _interopRequireDefault(e){return e&&e.__esModule?e:{default:e}}const Be=w.__esModule,he=w.computeDestinationPoint,Se=w.convertArea,xe=w.convertDistance,Te=w.convertSpeed,Ae=w.decimalToSexagesimal,Ne=w.findNearest,Ve=w.getAreaOfPolygon,Ke=w.getBounds,Ie=w.getBoundsOfDistance,Me=w.getCenter,ke=w.getCenterOfBounds,we=w.getCompassDirection,Fe=w.getCoordinateKey,Ge=w.getCoordinateKeys,We=w.getDistance,Xe=w.getDistanceFromLine,Ee=w.getGreatCircleBearing,ze=w.getLatitude,He=w.getLongitude,Je=w.getPathLength,Qe=w.getPreciseDistance,Ue=w.getRhumbLineBearing,Ye=w.getRoughCompassDirection,Ze=w.getSpeed,$e=w.isDecimal,et=w.isPointInLine,tt=w.isPointInPolygon,rt=w.isPointNearLine,it=w.isPointWithinRadius,nt=w.isSexagesimal,ot=w.isValidCoordinate,ut=w.isValidLatitude,at=w.isValidLongitude,ft=w.orderByDistance,gt=w.sexagesimalToDecimal,lt=w.toDecimal,st=w.toRad,dt=w.toDeg,mt=w.wktToPolygon,ct=w.areaConversion,pt=w.timeConversion,Dt=w.distanceConversion,bt=w.altitudeKeys,jt=w.latitudeKeys,Pt=w.longitudeKeys,yt=w.MAXLON,vt=w.MINLON,Ot=w.MAXLAT,Rt=w.MINLAT,_t=w.earthRadius,qt=w.sexagesimalPattern;export{Ot as MAXLAT,yt as MAXLON,Rt as MINLAT,vt as MINLON,Be as __esModule,bt as altitudeKeys,ct as areaConversion,he as computeDestinationPoint,Se as convertArea,xe as convertDistance,Te as convertSpeed,Ae as decimalToSexagesimal,w as default,Dt as distanceConversion,_t as earthRadius,Ne as findNearest,Ve as getAreaOfPolygon,Ke as getBounds,Ie as getBoundsOfDistance,Me as getCenter,ke as getCenterOfBounds,we as getCompassDirection,Fe as getCoordinateKey,Ge as getCoordinateKeys,We as getDistance,Xe as getDistanceFromLine,Ee as getGreatCircleBearing,ze as getLatitude,He as getLongitude,Je as getPathLength,Qe as getPreciseDistance,Ue as getRhumbLineBearing,Ye as getRoughCompassDirection,Ze as getSpeed,$e as isDecimal,et as isPointInLine,tt as isPointInPolygon,rt as isPointNearLine,it as isPointWithinRadius,nt as isSexagesimal,ot as isValidCoordinate,ut as isValidLatitude,at as isValidLongitude,jt as latitudeKeys,Pt as longitudeKeys,ft as orderByDistance,qt as sexagesimalPattern,gt as sexagesimalToDecimal,pt as timeConversion,lt as toDecimal,dt as toDeg,st as toRad,mt as wktToPolygon};

