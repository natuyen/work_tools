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

    if (breadcrumb_string.length > 0) {
        copyToClipboard(breadcrumb_string);
    }

})();
