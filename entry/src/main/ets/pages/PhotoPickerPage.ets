import picker from '@ohos.file.picker';
import fs from '@ohos.file.fs';
import util from '@ohos.util';

@Entry
@Component
struct PhotoPickerPage {
  @State message: string = 'Hello World'
  @State path: string = ''

  build() {
    Row() {
      Column({ space: 20 }) {
        Button('选择图片')
          .fontSize(50)
          .fontWeight(FontWeight.Bold).onClick(this.selectFile.bind(this))
        Image(this.path)
          .width(200)
          .aspectRatio(1)
          .interpolation(ImageInterpolation.High)
          .alt($r('app.media.app_icon'))
      }
      .width('100%')
    }
    .height('100%')
  }

  selectFile() {
    const photoSelectOptions = new picker.PhotoSelectOptions();
    photoSelectOptions.MIMEType = picker.PhotoViewMIMETypes.IMAGE_TYPE; // 过滤选择媒体文件类型为IMAGE
    photoSelectOptions.maxSelectNumber = 1; // 选择媒体文件的最大数目
    let URI = null;
    const photoViewPicker = new picker.PhotoViewPicker();
    photoViewPicker.select(photoSelectOptions).then((photoSelectResult) => {
      URI = photoSelectResult.photoUris[0];
     /* const fileName = util.generateRandomUUID() + '.jpg'
      const file = fs.openSync(URI, fs.OpenMode.READ_ONLY)
      const fileUri = getContext().cacheDir + '/' + fileName
      fs.copyFileSync(file.fd, fileUri)
      console.log(`path is ${fileUri}`)*/
      this.path = URI

      console.info('photoViewPicker.select to file succeed and URI is:' + URI);
    }).catch((err) => {
      console.error(`Invoke photoViewPicker.select failed, code is ${err.code}, message is ${err.message}`);
    })


  }
}