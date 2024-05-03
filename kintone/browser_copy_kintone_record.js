javascript: (() => {
    let input = prompt("Input column name to copy", "Key,Summary");
    let inputs = input.split(",");
    let $table = document.querySelector("table.recordlist-consistent-column-width-gaia");

    // get STT column headers
    let col_headers = $table.querySelectorAll("th.recordlist-header-cell-gaia");
    let i = 0;
    let STT_cols = [];
    let col_name = '';
    for (i = 0; i < col_headers.length; i++) {
        col_name = col_headers[i].innerText;
        if(inputs.includes(col_name)){
            STT_cols.push(i);
        }
    }

    // get column value
    let trs = $table.querySelectorAll("tr.recordlist-row-gaia");
    let output = "";
    trs.forEach(tr => {
        let col_tds = tr.getElementsByTagName("td");
        let STT_col = 0;
        let items = STT_cols.map(STT_col => col_tds[STT_col].innerText);
        output += items.join(" : ") + "\n";
    });
    console.log(output);
    prompt("Copy to Clipboard Ctrl+C.", output);
})();

/* compress
javascript:(()=>{let e=prompt("Input column name to copy","Key,Summary").split(","),t=document.querySelector("table.recordlist-consistent-column-width-gaia"),l=t.querySelectorAll("th.recordlist-header-cell-gaia"),r=0,o=[],a="";for(r=0;r<l.length;r++)a=l[r].innerText,e.includes(a)&&o.push(r);let n=t.querySelectorAll("tr.recordlist-row-gaia"),i="";n.forEach(e=>{let t=e.getElementsByTagName("td");i+=o.map(e=>t[e].innerText).join(" : ")+"\n"}),console.log(i),prompt("Copy to Clipboard Ctrl+C.",i)})();
 */