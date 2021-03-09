$("#submit").click(
	function submitFun() {
	var pf=document.personInsert.upload.value;
	var nm=document.personInsert.name.value;
	var em=document.personInsert.email.value;
	var tp=document.personInsert.telephone.value;
	var ad=document.personInsert.address.value;
	var a=document.getElementsByName("work");
   if(nm==""){
		alert("提示：\n\n请输入个人姓名");
		document.personInsert.name.focus();
		return false;
	}
	if(pf==""){
		alert("提示：\n\n还未上传照片");
		document.personInsert.upload.focus();
		return false;
	}
	if(em==""){
		alert("提示：\n\n电子邮件不得为空");
		document.personInsert.email.focus();
		return false;
	}
	if(tp==""){
		alert("提示：\n\n手机号码不得为空");
		document.personInsert.telephone.focus();
		return false;
	}
	if(ad==""){
		alert("提示：\n\n家庭住址不得为空");
		document.personInsert.address.focus();
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
		alert("提示：\n\n至少有一项职务擅长");
		document.personInsert.work.focus();
		return false;
	}
	alert("添加成功");
    }
	 
    function selectImage(file) {
		var image = '';
        if (!file.files || !file.files[0]) {
            return;
        }
        var reader = new FileReader();
        reader.onload = function (evt) {
            document.getElementById('photo').src = evt.target.result;
            image = evt.target.result;
        }
        reader.readAsDataURL(file.files[0]);
    }
)
