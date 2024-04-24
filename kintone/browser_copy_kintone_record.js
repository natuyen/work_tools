javascript: (() => {
    let input = prompt("Nhập tên column bắt đầu và số cột muốn lấy", "Key,Summary");
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
    let j = 0;
    let output = "";
    trs.forEach(tr => {
        let col_tds = tr.getElementsByTagName("td");
        let STT_col = 0;
        let items = STT_cols.map(STT_col => col_tds[STT_col].innerText);
        output += items.join(" : ") + "\n";
    });
    console.log(output);
    alert(output);
})();
