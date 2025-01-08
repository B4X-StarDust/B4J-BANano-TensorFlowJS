B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=10
@EndOfDesignText@
Sub Class_Globals
	Private BANano As BANano 'ignore
	
	Private mElement As BANanoElement
	Private TS As SDtensorflowSquared
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize(nBANano As BANano)
	BANano=nBANano
End Sub

Public Sub Show
	mElement = BANano.GetElement("#mainHolder").Append($"<label><B>AI SQUARED</B></label><br><br>"$)
	mElement = BANano.GetElement("#mainHolder").Append($"<button id="calc" Type="button" class="">Training</button><br><br>"$).Get("#calc")
	BANano.GetElement("#mainHolder").Append($"<button id="gopredict" Type="button" class="">Predict</button><br><br>"$)
	BANano.GetElement("#mainHolder").Append($"<label id="predict"> - </label>"$)
	
	mElement.HandleEvents("click", Me, "train_click")
	BANano.GetElement("#gopredict").HandleEvents("click",Me,"predict_click")
	BANano.GetElement("#gopredict").SetStyle($"{ "visibility": "hidden"} "$)
	TS.Initialize(BANano,Me,"TS")
End Sub

Private Sub train_click
	TS.SetDataX(Array As Int(1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21,22))
	TS.SetDatay(Array As Int(1, 4, 9, 16, 25, 36, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484))
	TS.Training
	BANano.GetElement("#predict").SetText($"WAIT "$)
End Sub

Private Sub predict_click
	Dim D As Double = TS.Predict(7)
	BANano.GetElement("#predict").SetText($"Pred: ${D}"$)
End Sub

Private Sub TS_TrainedModel
	BANano.GetElement("#gopredict").SetStyle($"{ "visibility": "visible"} "$)
	BANano.GetElement("#predict").SetText($"READY "$)
End Sub

