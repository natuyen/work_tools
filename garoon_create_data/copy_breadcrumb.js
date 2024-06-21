javascript: (() => {
    // user view
    let breadcrumbs;
    let breadcrumbs_user = document.querySelectorAll('div.global_navi span.globalNavi-item-grn');
    let breadcrumbs_system = document.querySelector('div.site-posotion-system-grn div.global_navi');
    let breadcrumb_string;

    if (breadcrumbs_user.length > 0) {
        breadcrumbs = breadcrumbs_user;
        let outputs = [];
        breadcrumbs.forEach(item => {
            outputs.push(item.innerText);

        });
        let last_breadcrumb = document.querySelector('div.global_navi span.globalNavi-item-last-grn');
        outputs.push(last_breadcrumb.innerText);
        breadcrumb_string = outputs.join(" > ");
        prompt("Copy Breadcrumb to Clipboard Ctrl+C.", breadcrumb_string);
    }
    // system view
    else if (breadcrumbs_system) {
        breadcrumb_string = breadcrumbs_system.innerText;
        prompt("Copy Breadcrumb to Clipboard Ctrl+C.", breadcrumb_string);
    }
})();

/* compress

javascript:(()=>{let e,l=document.querySelectorAll("div.global_navi span.globalNavi-item-grn"),r=document.querySelector("div.site-posotion-system-grn div.global_navi"),i;if(l.length>0){let t=[];(e=l).forEach(e=>{t.push(e.innerText)});let o=document.querySelector("div.global_navi span.globalNavi-item-last-grn");t.push(o.innerText),prompt("Copy Breadcrumb to Clipboard Ctrl+C.",i=t.join(" > "))}else r&&prompt("Copy Breadcrumb to Clipboard Ctrl+C.",i=r.innerText)})();

 */