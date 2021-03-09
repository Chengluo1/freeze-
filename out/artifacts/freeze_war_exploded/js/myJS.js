// var tap=document.getElementById("tap");
// tap.onclick=function() {
//     console.log("点击了一条记录");
//     $('#studentDetailModal').modal(options)
//
// // var data = table.row($(this).parents('tr')).data();
// // var modal = $('#studentDetailModal');
// // modal.find('#Sno').val(data[0]);
// // // if (data[1] === '男') {
// // //   modal.find('#input-sex-male').prop('checked', true);
// // // } else if (data[1] === '女') {
// // //   modal.find('#input-sex-female').prop('checked', true);
// // // }
// // modal.find('#Sname').val(data[1]);
// // modal.find('#Mname').val(data[2]);
// // modal.find('#Cname').val(data[3]);
// // modal.find('#Sgender').val(data[4]);
// // modal.find('#Sborn').val(data[5]);
// // modal.find('#Saddress').val(data[6]);
// // modal.find('#totalCredits').val(data[7]);
// // modal.modal('show');
// }
// function test(obj){
//     // var v = $(obj).html();
//     // console.log(v);
//     // var a=document.getElementsByTagName("a");
//     // for(var i=0;i<a.length;i++){
//     //     result[i]=a[i].innerHTML;
//     //     console.log(result[i]);
//     // }
//     var table=$(obj);
//     console.log(table);
//     var a = table.getElementsByTagName("a");
//     for(var i=0;i<a.length;i++){
//         result[i]=a[i].innerHTML;
//         console.log(result[i]);
//     }
// }
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
    var Sgender=document.getElementById("input-gender");
    Sgender.setAttribute("value",result[4]);
    var Smajor=document.getElementById("input-major");
    Smajor.setAttribute("value",result[2]);
    var Cname=document.getElementById("input-class");
    Cname.setAttribute("value",result[3]);
    var Sage=document.getElementById("input-age");
    Sage.setAttribute("value",result[5]);
    var Saddress=document.getElementById("input-address");
    Saddress.setAttribute("value",result[6]);
    var Scredit=document.getElementById("input-credit");
    Scredit.setAttribute("value",result[7]);
    var modal = $('#studentDetailModal');

    modal.modal('toggle');
}
function submitFun(act)
{
    var studentInfo=document.getElementsByName("studentInfo");
    if(act=="del"){
        studentInfo[0].setAttribute('action','studentServlet.do?action=delStudent');
        studentInfo[0].submit();
    }
    if(act=="alt"){
        studentInfo[0].setAttribute('action','studentServlet.do?action=altStudent');
        studentInfo[0].submit();
    }
    if(act=="add"){
        studentInfo[0].setAttribute('action','studentServlet.do?action=addStudent');
        studentInfo[0].submit();
    }


}



