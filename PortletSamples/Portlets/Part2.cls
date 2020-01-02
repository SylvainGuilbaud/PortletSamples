Class PortletSamples.Portlets.Part2 Extends %DeepSee.Component.Portlet.abstractPortlet
{

Method %DrawHTML()
{
	Set ..renderFlag = ..renderFlag + 1
}

ClientMethod renderContents() [ Language = javascript ]
{
	var html=[]
	
	var article=this.GetRandomArticle()
	html[html.length]="<iframe src='"+article+"' width='100%' height='100%'/>"
	
	this.getEnclosingDiv().innerHTML = html.join('');
}

Method GetRandomArticle() As %String [ ZenMethod ]
{
	Set tArticle=""
	Set tRandom=$Random(4)
	If tRandom=0 {
		Set tArticle="https://community.intersystems.com/post/iterating-through-all-properties-object"
	} ElseIf tRandom=1 {
		Set tArticle="https://community.intersystems.com/post/accessing-new-deepsee-namespace-first-time"
	} ElseIf tRandom=2 {
		Set tArticle="https://community.intersystems.com/post/deepsee-tips-tricks-auto-execute"
	} Else {
		Set tArticle="https://community.intersystems.com/post/analyzethis-%E2%80%93-quick-start-intersystems-bi"
	}
	Quit tArticle
}

}
