function testL(data) {
    console.log(data.id);
    selectID=data.id;
    a = document.getElementById(selectID).getElementsByTagName("a");
    var result=new Array();
    for(var i=0;i<a.length;i++){
        result.push(a[i].innerHTML);
    }
    console.log(result);
    var Lno=document.getElementById("input-id");
    Lno.setAttribute("value",result[0]);
    var Lname=document.getElementById("input-name");
    Lname.setAttribute("value",result[1]);
    var Lcredit=document.getElementById("input-credit");
    Lcredit.setAttribute("value",result[3]);
    var CTLterm=document.getElementById("input-term");
    CTLterm.setAttribute("value",result[4]);
    var Ltype=document.getElementById("input-Ltype");
    Ltype.setAttribute("value",result[5]);
    var Lperiod=document.getElementById("input-Lperiod");
    Lperiod.setAttribute("value",result[6]);
    var Tname=document.getElementById("input-Tname");
    Tname.setAttribute("value",result[2]);
    var Cname=document.getElementById("input-Cname");
    Cname.setAttribute("value",result[7]);
    var modalT = $('#teacherDetailModal');
    modalT.modal('toggle');
}
function submitFun(act)
{
    var lessonInfo=document.getElementsByName("lessonInfo");
    if(act=="del"){
        lessonInfo[0].setAttribute('action','lessonServlet.do?action=delLesson');
        lessonInfo[0].submit();
    }
    if(act=="alt"){
        lessonInfo[0].setAttribute('action','lessonServlet.do?action=altLesson');
        lessonInfo[0].submit();
    }
    if(act=="add"){
        lessonInfo[0].setAttribute('action','lessonServlet.do?action=addLesson');
        lessonInfo[0].submit();
    }
}