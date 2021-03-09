
function submitFun() {
    console.log("执行了获取数据函数");
    a = document.getElementById("studentInfo").getElementsByTagName("td");
    var result=new Array();
    for(var i=0;i<a.length;i++){
        result.push(a[i].innerHTML);
    }
    var Snos=new Array();
    var Scores=new Array();
    for(var i=0;i<result.length;i=i+3){
        Snos.push(result[i]);
        Scores.push(result[i+2]);
    }
    console.log(result);
    console.log(Snos);
    console.log(Scores);
    $.ajax({
        type:'POST',
        url : "http://localhost:8080/studentManagermentSystem_war_exploded/scoreServlet.do?action=TaddStudentScoreWithLessonAndClass",
        data : {"Snos" : Snos,"Scores":Scores},
        dataType : "json",
        success : function(data){
            //成功处理
            console.log("传送数据成功");
        },
        error : function(data){
            //错误代码
        }
    });
    // var studentInfo=document.getElementsByName("studentInfo");
    // studentInfo[0].setAttribute('action','scoreServlet.do?action=TaddStudentScoreWithLessonAndClass');
    // studentInfo[0].submit();
}