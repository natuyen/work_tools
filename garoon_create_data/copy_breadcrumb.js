javascript: (() => {
    let breadcrumbs = document.querySelectorAll('.global_navi .globalNavi-item-grn');
    let outputs = [];
    breadcrumbs.forEach(item=>{
        outputs.push(item.innerText);

    });
    let last_breadcrumb = document.querySelector('.global_navi .globalNavi-item-last-grn');
    outputs.push(last_breadcrumb.innerText);
    let breadcrumb_string = outputs.join(" > ");
    prompt("Copy Breadcrumb to Clipboard Ctrl+C.", breadcrumb_string);
})();

/* compress
javascript:(()=>{let l=document.querySelectorAll(".global_navi .globalNavi-item-grn"),e=[];l.forEach(l=>{e.push(l.innerText)});let r=document.querySelector(".global_navi .globalNavi-item-last-grn");e.push(r.innerText);prompt("Copy Breadcrumb to Clipboard Ctrl+C.",e.join(" > "))})();



 */