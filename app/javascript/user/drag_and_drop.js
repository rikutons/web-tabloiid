function startAcceptFiles(params) {
    var pdfDropZone = document.getElementById('pdf-drop-zone');
    var pdfFileInput = document.getElementById('pdf-file-input');

    console.log(pdfDropZone)
    pdfDropZone.addEventListener('dragover', function (e) {
        e.stopPropagation();
        e.preventDefault();
        this.style.background = '#e1e7f0';
    }, false);

    pdfDropZone.addEventListener('dragleave', function (e) {
        e.stopPropagation();
        e.preventDefault();
        this.style.background = '#ffffff';
    }, false);

    pdfDropZone.addEventListener('drop', function (e) {
        e.stopPropagation();
        e.preventDefault();
        this.style.background = '#ffffff'; //背景色を白に戻す
        var files = e.dataTransfer.files; //ドロップしたファイルを取得
        if (files.length > 1) return alert('アップロードできるファイルは1つだけです。');
        pdfFileInput.files = files; //inputのvalueをドラッグしたファイルに置き換える。
    }, false);

    var imageDropZone = document.getElementById('image-drop-zone');
    var imageFileInput = document.getElementById('image-file-input');

    console.log(imageDropZone)
    imageDropZone.addEventListener('dragover', function (e) {
        e.stopPropagation();
        e.preventDefault();
        this.style.background = '#e1e7f0';
    }, false);

    imageDropZone.addEventListener('dragleave', function (e) {
        e.stopPropagation();
        e.preventDefault();
        this.style.background = '#ffffff';
    }, false);

    imageDropZone.addEventListener('drop', function (e) {
        e.stopPropagation();
        e.preventDefault();
        this.style.background = '#ffffff'; //背景色を白に戻す
        var files = e.dataTransfer.files; //ドロップしたファイルを取得
        if (files.length > 1) return alert('アップロードできるファイルは1つだけです。');
        imageFileInput.files = files; //inputのvalueをドラッグしたファイルに置き換える。
    }, false);
}

window.onload = startAcceptFiles;