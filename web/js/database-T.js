var data = [ ];

$(document).ready(function() {
  $.fn.dataTable.ext.classes.sPageButton =
      'paginate_button pagination-sm page-item';
  $.fn.dataTable.ext.classes.sWrapper = 'dataTables_wrapper dt-bootstrap4 p-1';

  var table = $('#table-students').DataTable({
    //data,
    bAutoWidth: false,
    dom:
        "<'row mb-1'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
        "<'row'<'col-sm-12'tr>>" +
        "<'row mt-2'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
    columnDefs: [
      {
        targets: -1,
        defaultContent: "<button class=\"btn btn-sm btn-block btn-outline-primary\">详情</button>"
      }
    ],
    language: {
      url: '//cdn.datatables.net/plug-ins/1.10.19/i18n/Chinese.json'
    }
  });

  $('#table-students tbody').on('click', 'button', function() {
    var data = table.row($(this).parents('tr')).data();
    var modal = $('#studentDetailModal');
    modal.find('#input-name').val(data[0]);
    if (data[1] === '男') {
      modal.find('#input-sex-male').prop('checked', true);
    } else if (data[1] === '女') {
      modal.find('#input-sex-female').prop('checked', true);
    }
    modal.find('#input-id').val(data[2]);
    modal.find('#input-school').val(data[3]);
    modal.find('#input-major').val(data[4]);
    modal.find('#input-class').val(data[5]);
    modal.modal('show');
  });
});
