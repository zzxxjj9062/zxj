function check() {
    var loginName = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    if (loginName == "" || password == "") {
        var info = document.getElementById("info");
        info.innerHTML = "您有什么没输吗?";
        return false;
    } else {
        var re = /[=?%^<>&$;,'"]+/;
        if (re.test(loginName) || re.test(password)) {
            var info = document.getElementById("info");
            info.innerHTML = "格式有误";
            return false;
        }
    }
    return true;
}
