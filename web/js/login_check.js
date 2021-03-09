$("#submit").click(
	function submitFun() {
	var un=document.user.username.value;
	var ps=document.user.password.value;
   if(un==""){
		alert("提示：\n\n未输入用户名");
		document.user.username.focus();
		return false;
	}
	if(ps==""){
		alert("提示：\n\n为输入密码");
		document.user.password.focus();
		return false;
	}
	if(un!="123"||ps!="456")
	{
		alert("提示：\n\n用户名或密码输入错误");
		return false;
	}
	window.location.href="bookInfo.html"
}
)
