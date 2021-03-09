$("#submit").click(
	function submitFun() {
	var co=document.bookInsert.upload.value;
	var bno=document.bookInsert.bookno.value;
	var bna=document.bookInsert.bookname.value;
	var au=document.bookInsert.author.value;
	var pb=document.bookInsert.publishing.value;
	var pr=document.bookInsert.price.value;
	var a=document.getElementsByName("species");
    if(bno==""){
		alert("提示：\n\n书籍编号不得为空");
		document.bookInsert.bookno.focus();
		return false;
	}
	if(co==""){
		alert("提示：\n\n还未上传书籍封面");
		document.bookInsert.upload.focus();
		return false;
	}
	if(bna==""){
		alert("提示：\n\n书籍名称不得为空");
		document.bookInsert.bookname.focus();
		return false;
	}
	if(au==""){
		alert("提示：\n\n作者不得为空");
		document.bookInsert.author.focus();
		return false;
	}
	if(pb==""){
		alert("提示：\n\n出版社不得为空");
		document.bookInsert.publishing.focus();
		return false;
	}
	if(pr==""){
		alert("提示：\n\n定价不得为空");
		document.bookInsert.price.focus();
		return false;
	}
	var number=0;
	for(var i=0;i<a.length;i++)
	{
		if(a[i].checked==true)
			number++;
	}
	if(number==0)
	{
		alert("提示：\n\n至少有一个种类");
		document.bookInsert.species.focus();
		return false;
	}
	alert("添加成功");
}
)
