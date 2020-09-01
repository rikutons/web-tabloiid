## アップロードされたPDFファイルに関する情報

- ファイル名
- ファイルへのパス
- アップロード年月日
- サムネイル画像へのパス(任意)
- パスワード

```json:pdf_files.json
{
    [
        'file_name': 'アップロードされたファイル名',
        'file_path': 'uploads/pdf/[UnixTime]_アップロードされたファイル名.pdf',
        'date': 'CCYY/MM/DD/hh/mm',
        'password': 'パスワード',
        'image_path': 'uploads/images/[UnixTime]_画像名.[png|jpg|jpeg|gif]' 又は ''
    ],
    ...
}
```