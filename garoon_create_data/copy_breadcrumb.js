javascript: (() => {
    function copyToClipboard(data) {
        navigator.clipboard.writeText(data).then(() => {
            // on success
        }, (e) => {
            // on error
        });
        document.execCommand("copy");

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

/* compress

javascript:(()=>{function e(e){navigator.clipboard.writeText(e).then(()=>{},e=>{}),document.execCommand("copy")}let l,i=document.querySelectorAll("div.global_navi span.globalNavi-item-grn"),n=document.querySelector("div.site-posotion-system-grn div.global_navi"),t="";if(i.length>0){let o=[];(l=i).forEach(e=>{o.push(e.innerText)});let a=document.querySelector("div.global_navi span.globalNavi-item-last-grn");o.push(a.innerText),t=o.join(" > ")}else n&&(t=n.innerText.trim());t.length>0&&e(t)})();

 */