#!/usr/bin/env wolframscript
(* ::Package:: *)

(* Set the working directory *)
SetDirectory["~/repos/InhibitGPT/scripts"];
<<"../data/split.mx"


nn = Nearest[train] (* uses EditDistance by default for strings*);

predicted = First/@ nn[test[[All, 1]]]; (* take nearest string *)
actual = test[[All, 2]];

ClassifierMeasurements[predicted, actual] // 
	Export["../figures/string_edit_distance_predictions.jpg", #]&