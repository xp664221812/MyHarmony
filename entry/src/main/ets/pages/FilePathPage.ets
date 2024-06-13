@Entry
@Component
struct FilePathPage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Button('获取各种目录').width('80%')
          .fontSize(25)
          .fontWeight(FontWeight.Bold).onClick(this.getPath.bind(this))

      }
      .width('100%')
    }
    .height('100%')
  }

  onPageShow() {
    console.log('testTag FilePathPage onPageShow------------------------')
  }

  onPageHide() {
    console.log('testTag FilePathPage onPageHide------------------------')

  }

  aboutToAppear() {
    console.log('testTag FilePathPage aboutToAppear------------------------')

  }

  aboutToDisappear() {
    console.log('testTag FilePathPage aboutToDisappear------------------------')

  }

  getPath() {
    //应用安装后的app的hap资源包所在目录；随应用卸载而清理。
    let bundleCodeDir = getContext().bundleCodeDir;
    console.log(`bundleCodeDir is ${bundleCodeDir}`)

    //应用在el1加密条件下存放通过分布式数据库服务操作的文件目录；随应用卸载而清理。
    let databaseDir = getContext().databaseDir;
    console.log(`databaseDir is ${databaseDir}`)


    //应用在el2加密条件下存放分布式文件的目录，应用将文件放入该目录可分布式跨设备直接访问；随应用卸载而清理。
    let distributedFilesDir = getContext().distributedFilesDir;
    console.log(`distributedFilesDir is ${distributedFilesDir}`)


    //应用在本设备内部存储上通用的存放默认长期保存的文件路径；随应用卸载而清理。
    let fileDir = getContext().filesDir;
    console.log(`fileDir is ${fileDir}`)


    //应用在本设备内部存储上用于缓存下载的文件或可重新生成的缓存文件的路径，应用cache目录大小超过配额或者系统空间达到一定条件，
    // 自动触发清理该目录下文件；用户通过系统空间管理类应用也可能触发清理该目录。应用需判断文件是否仍存在，决策是否需重新缓存该文件。
    let cacheDir = getContext().cacheDir;
    console.log(`cacheDir is ${cacheDir}`)


    //应用在本设备内部存储上通过数据库API存储配置类或首选项的目录；随应用卸载而清理。详见通过用户首选项实现数据持久化。
    let preferencesDir = getContext().preferencesDir;
    console.log(`preferencesDir is ${preferencesDir}`)


    //应用在本设备内部存储上仅在应用运行期间产生和需要的文件，应用退出后即清理。
    let tempDir = getContext().tempDir;
    console.log(`tempDir is ${tempDir}`)


  }
}