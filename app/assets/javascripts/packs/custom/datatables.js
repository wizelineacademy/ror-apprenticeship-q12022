$(function(){
    ReloadDataTables();
});
function ReloadDataTables() {
  try {
      if ($('table').length != 0) {
          $('table').each(function () {
              var searchable = true, ordering = true, paging = true, bInfo=true;
              if (!$.fn.DataTable.isDataTable($(this))) {
                  if ($(this).hasClass("non-searching"))
                      searchable = false;
                  if ($(this).hasClass("non-ordering"))
                      ordering = false;
                  if ($(this).hasClass("non-paging")) {
                      paging = false;
                      bInfo = false;
                  }
                  $(this).dataTable({
                      "searching": searchable,
                      "paging": paging,
                      "ordering": ordering,
                      "bInfo": bInfo,
                      "lengthMenu": [[25, 50, 100, -1], [25, 50, 100, "All"]]
                  });
              }
          });
      }
  }
  catch (error) {
      console.error(error);
      // expected output: ReferenceError: nonExistentFunction is not defined
      // Note - error messages will vary depending on browser
  }
}
