var pdfDropZone = document.getElementById('pdf-drop-zone');
var pdfFileInput = document.getElementById('pdf-file-input');

pdfDropZone.addEventListener('dragover', function (e) {
    e.stopPropagation();
    e.preventDefault();
    this.style.background = '#e1e7f0';
}, false);

pdfDropZone.addEventListener('dragleave', function (e) {
    e.stopPropagation();
    e.preventDefault();
    this.style.background = '#ececec';
}, false);

pdfDropZone.addEventListener('drop', function (e) {
    e.stopPropagation();
    e.preventDefault();
    var files = e.dataTransfer.files; //ドロップしたファイルを取得
    if (files.length > 1) return alert('アップロードできるファイルは1つだけです。');
    pdfFileInput.files = files; //inputのvalueをドラッグしたファイルに置き換える。
    onUploaded(pdfDropZone);
}, false);

pdfFileInput.addEventListener('change', function () {
    onUploaded(pdfDropZone);
});

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
    this.style.background = '#ececec';
}, false);

imageDropZone.addEventListener('drop', function (e) {
    e.stopPropagation();
    e.preventDefault();
    var files = e.dataTransfer.files; //ドロップしたファイルを取得
    if (files.length > 1) return alert('アップロードできるファイルは1つだけです。');
    imageFileInput.files = files; //inputのvalueをドラッグしたファイルに置き換える。
    onUploaded(imageDropZone);
}, false);

imageFileInput.addEventListener('change', function () {
    onUploaded(imageDropZone);
});

function onUploaded(dropZone) {
    dropZone.style.background = '#c4b3d4';
    dropZone.innerText = 'アップロード済み'
}