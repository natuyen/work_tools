javascript: (() => {
    var license = prompt("Please input License", "");
    var license_array = license.split("-");
    var license_boxs = document.getElementsByClassName("cb_text_ess");
    for (let i = 0; i < license_array.length; i++) {
        license_boxs[i + 1].value = license_array[i];
    }
})();

/* compress
javascript: (() => {   var license = prompt("Please input License", ""); var license_array = license.split("-"); var license_boxs = document.getElementsByClassName("cb_text_ess"); for (let i = 0; i < license_array.length; i++) {   license_boxs[i+1].value=license_array[i]; }  })();
 */