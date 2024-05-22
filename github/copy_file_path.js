javascript: (() => {
    let file_paths = document.querySelectorAll("a.Link--primary");
    let output = "";
    file_paths.forEach(file_path => {
        output += file_path.getAttribute("title") + ",\n";
    });
    console.log(output);
    prompt("Copy to Clipboard Ctrl+C.", output);

})();


/* compress



*/