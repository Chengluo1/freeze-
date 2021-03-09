

$(document).ready(function() {
  $.fn.dataTable.ext.classes.sPageButton =
    'paginate_button pagination-sm page-item';
  $.fn.dataTable.ext.classes.sWrapper = 'dataTables_wrapper dt-bootstrap4 p-1';

  //$('#example').dataTable();

  var table = $('#studentInfo').DataTable();
  $('#studentInfo tbody').on('click', 'tr', function() {
    // var data = table.row($(this).parents('tr')).data();
    // console.log("选中数据："+data);
    var modal = $('#studentDetailModal');
    // modal.find('#input-name').val(data[0]);
    // if (data[1] === '男') {
    //   modal.find('#input-sex-male').prop('checked', true);
    // } else if (data[1] === '女') {
    //   modal.find('#input-sex-female').prop('checked', true);
    // }
    // modal.find('#input-id').val(data[2]);
    // modal.find('#input-school').val(data[3]);
    // modal.find('#input-major').val(data[4]);
    // modal.find('#input-class').val(data[5]);
    modal.modal('toggle');

    // var data = table.row($(this).parents('tr')).data();
    // var modal = $('#studentDetailModal');
    // modal.find('#Sno').val(data[0]);
    // // if (data[1] === '男') {
    // //   modal.find('#input-sex-male').prop('checked', true);
    // // } else if (data[1] === '女') {
    // //   modal.find('#input-sex-female').prop('checked', true);
    // // }
    // modal.find('#Sname').val(data[1]);
    // modal.find('#Mname').val(data[2]);
    // modal.find('#Cname').val(data[3]);
    // modal.find('#Sgender').val(data[4]);
    // modal.find('#Sborn').val(data[5]);
    // modal.find('#Saddress').val(data[6]);
    // modal.find('#totalCredits').val(data[7]);
    // modal.modal('show');
  });
});
