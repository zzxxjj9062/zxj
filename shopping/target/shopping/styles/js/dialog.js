/**
 * Created by snow on 2014/4/25.
 */
function closeDialog(url) {
    var ids = "";
    $("select[name=goodsType] option").each(function () {
        if ($(this).attr("selected")) {
            ids = $(this).val() + "," + ids;
        } else {
            ids += $(this).val() + ",";
        }
    });
    $("#goodsType").loadUrl(url, {ids: ids}, null);
    return true;
}
