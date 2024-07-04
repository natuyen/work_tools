javascript: (() => {
    function copyToClipboard(text) {
        let input = document.createElement('textarea');
        input.innerHTML = text;
        document.body.appendChild(input);
        input.select();
        let result = document.execCommand('copy');
        document.body.removeChild(input);
        if (result) {
            alert("Copy to Clipboard successfully!");
        } else {
            alert("Copy to Clipboard failed!");
        }
    }

    // user view
    let breadcrumbs;
    let breadcrumbs_user = document.querySelectorAll('div.global_navi span.globalNavi-item-grn');
    let breadcrumbs_system = document.querySelector('div.site-posotion-system-grn div.global_navi');
    let breadcrumb_string = "";

    if (breadcrumbs_user.length > 0) {
        breadcrumbs = breadcrumbs_user;
        let outputs = [];
        breadcrumbs.forEach(item => {
            outputs.push(item.innerText);

        });
        let last_breadcrumb = document.querySelector('div.global_navi span.globalNavi-item-last-grn');
        outputs.push(last_breadcrumb.innerText);
        breadcrumb_string = outputs.join(" > ");
    }
    // system view
    else if (breadcrumbs_system) {
        breadcrumb_string = breadcrumbs_system.innerText.trim();
    }

    // get garoon url
    let url = window.location;
    let index_garoon = 0;
    let garoon_url = "";
    if (url.href.indexOf("/g/") > -1) {
        index_garoon = url.href.indexOf("/g/") + "/g/".length;
    } else if (url.href.indexOf("/grn.cgi/") > -1) {
        index_garoon = url.href.indexOf("/grn.cgi/") + "/grn.cgi/".length;
    }
    garoon_url = url.href.substring(index_garoon);

    let index_question_mark = garoon_url.indexOf("?");
    if (index_question_mark > -1) {
        garoon_url = garoon_url.substring(0, index_question_mark);
    }

    if (breadcrumb_string.length > 0) {
        copyToClipboard(breadcrumb_string + " (" + garoon_url + ")");
    }

})();
