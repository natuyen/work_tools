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

    let file_items = document.querySelectorAll("a.Link--primary");
    let file_path = "";
    let outputs = [];
    file_items.forEach(file_item => {
        file_path = file_item.getAttribute("title");
        if (file_path != null) {
            outputs.push(file_path);

        }
    });

    let output_string = outputs.join("\n");
    copyToClipboard(output_string);
})();
