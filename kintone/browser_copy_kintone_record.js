javascript: (() => {
    function copyToClipboard(data) {
        navigator.clipboard.writeText(data).then(() => {
            // on success
        }, (e) => {
            // on error
        });
        document.execCommand("copy");

    }

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

    copyToClipboard(output);
})();



/* compress

javascript:(()=>{function e(e){navigator.clipboard.writeText(e).then(()=>{},e=>{}),document.execCommand("copy")}let t=prompt("Input column name to copy","Key,Summary").split(","),r=document.querySelector("table.recordlist-consistent-column-width-gaia"),l=r.querySelectorAll("th.recordlist-header-cell-gaia"),o=0,n=[],i="",c=0;for(o=0;o<l.length;o++)i=l[o].innerText,t.includes(i)&&n.push(o),"Story points"==i&&(c=o);let a=r.querySelectorAll("tr.recordlist-row-gaia"),s="",m=0;a.forEach(e=>{let t=e.getElementsByTagName("td");s+=n.map(e=>t[e].innerText).join(" : ")+"\n",m+=parseInt(t[c].innerText)}),s+="Story Points: "+m,console.log(s),e(s)})();

*/