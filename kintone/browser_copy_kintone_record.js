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
