Class PortletSamples.Portlets.Part4 Extends %DeepSee.Component.Portlet.abstractPortlet
{

Method %DrawHTML()
{
    Set ..renderFlag = ..renderFlag + 1
}

ClientMethod renderContents() [ Language = javascript ]
{
	var html=[]
	
	var lastMessage=this.GetLastMessage()
	html[html.length]="Last Message: "+lastMessage
	
	this.getEnclosingDiv().innerHTML = html.join('');
}

Method GetLastMessage() As %String [ ZenMethod ]
{
    Set tFile=##class(%Stream.FileCharacter).%New()
    If ##class(%File).Exists(##class(%File).ManagerDirectory()_"messages.log") {
        Do tFile.LinkToFile(##class(%File).ManagerDirectory()_"messages.log")
    } ElseIf ##class(%File).Exists(##class(%File).ManagerDirectory()_"cconsole.log") {
        Do tFile.LinkToFile(##class(%File).ManagerDirectory()_"cconsole.log")
    }
    Set tLine=tFile.ReadLine()
    While 'tFile.AtEnd {
        Set tLine=tFile.ReadLine()
    }
    Quit tLine
}

}
