Class PortletSamples.Portlets.Part3 Extends %DeepSee.Component.Portlet.abstractPortlet
{

Method %DrawHTML()
{
    Set ..renderFlag = ..renderFlag + 1
}

ClientMethod renderContents() [ Language = javascript ]
{
	var html=[]
	
	this.connectToController();
	var controller = this.getController();
	
	console.log(controller);
	
	html[html.length] = "Current Query Text: "+controller.GetCurrentQueryText();
	html[html.length] = "</br>Number of columns: "+controller.getDimSize(2);
	html[html.length] = "</br>Number of rows: "+controller.getDimSize(1);
	
	html[html.length] = "<table border='1'>";
	// Add Headers
	html[html.length] = "<tr>";
	html[html.length] = "<th></th>";
	for (var col=0;col<controller.getDimSize(2); col++) {
		html[html.length] = "<th>"+controller.getLabel(col,2)+"</th>";
	}
	html[html.length] = "</tr>";
	for (var row=0;row<controller.getDimSize(1); row++) {
		html[html.length] = "<tr>";
		html[html.length] = "<td>"+controller.getLabel(row,1)+"</td>";
		for (var col=0;col<controller.getDimSize(2); col++) {
			var cell=(row*controller.getDimSize(2))+col
			html[html.length] = "<td>"+controller.data.cells[cell]+"</td>";
		}
		html[html.length] = "</tr>";
	}
	html[html.length] = "</table>";
	
	this.getEnclosingDiv().innerHTML = html.join('');
}

}