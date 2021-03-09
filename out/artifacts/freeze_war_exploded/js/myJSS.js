function test(data) {
    console.log(data.id);
    selectID=data.id;
    a = document.getElementById(selectID).getElementsByTagName("a");
    var result=new Array();
    for(var i=0;i<a.length;i++){
        result.push(a[i].innerHTML);
    }
    console.log(result);
    var Sno=document.getElementById("input-id");
    Sno.setAttribute("value",result[0]);
    var Sname=document.getElementById("input-name");
    Sname.setAttribute("value",result[1]);
    var Lname=document.getElementById("input-Lname");
    Lname.setAttribute("value",result[4]);
    var score=document.getElementById("input-score");
    score.setAttribute("value",result[6]);
    var modal = $('#scoreDetailModal');

    modal.modal('toggle');
}
function submitFun(act)
{
    var scoreInfo=document.getElementsByName("scoreInfo");
    if(act=="del"){
        scoreInfo[0].setAttribute('action','scoreServlet.do?action=delScore');
        scoreInfo[0].submit();
    }
    if(act=="alt"){
        scoreInfo[0].setAttribute('action','scoreServlet.do?action=altScore');
        scoreInfo[0].submit();
    }
    if(act=="add"){
        scoreInfo[0].setAttribute('action','scoreServlet.do?action=addScore');
        scoreInfo[0].submit();
    }


}
