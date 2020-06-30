/**
 * 设置select控件选中
 * @param selectId select的id值
 * @param checkValue 选中option的值
 */
function set_select_checked(selectId, checkValue){
    var select = document.getElementById(selectId);
    for (var i = 0; i < select.options.length; i++){
        if (select.options[i].value == checkValue){
            select.options[i].selected = true;
            break;
        }
    }
};