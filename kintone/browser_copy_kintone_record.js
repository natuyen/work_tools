javascript: (() => {
    let input = prompt("Input column name to copy", "Key,Summary");
    let inputs = input.split(",");
    let $table = document.querySelector("table.recordlist-consistent-column-width-gaia");

    // get STT column headers
    let col_headers = $table.querySelectorAll("th.recordlist-header-cell-gaia");
    let i = 0;
    let STT_cols = [];
    let col_name = '';
    let STT_story_points = 0;
    for (i = 0; i < col_headers.length; i++) {
        col_name = col_headers[i].innerText;
        if (inputs.includes(col_name)) {
            STT_cols.push(i);
        }
        if (col_name == "Story points") {
            STT_story_points = i;
        }
    }

    // get column value
    let trs = $table.querySelectorAll("tr.recordlist-row-gaia");
    let output = "";
    let total_story_points = 0;
    trs.forEach(tr => {
        let col_tds = tr.getElementsByTagName("td");
        let STT_col = 0;
        let items = STT_cols.map(STT_col => col_tds[STT_col].innerText);
        output += items.join(" : ") + "\n";
        total_story_points += parseInt(col_tds[STT_story_points].innerText);
    });
    output += "Story Points: " + total_story_points;
    console.log(output);

    prompt("Copy to Clipboard Ctrl+C.", output);
})();



/* compress
javascript:(()=>{let e=prompt("Input column name to copy","Key,Summary").split(","),t=document.querySelector("table.recordlist-consistent-column-width-gaia"),l=t.querySelectorAll("th.recordlist-header-cell-gaia"),r=0,o=[],n="",i=0;for(r=0;r<l.length;r++)n=l[r].innerText,e.includes(n)&&o.push(r),"Story points"==n&&(i=r);let a=t.querySelectorAll("tr.recordlist-row-gaia"),c="",s=0;a.forEach(e=>{let t=e.getElementsByTagName("td");c+=o.map(e=>t[e].innerText).join(" : ")+"\n",s+=parseInt(t[i].innerText)}),c+="Story Points: "+s,console.log(c),prompt("Copy to Clipboard Ctrl+C.",c)})();



*/