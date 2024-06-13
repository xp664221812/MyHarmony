import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State userName: string = '';
  @State pwd: string = '';
  @State gender: number = 1; //0女1男
  @State address: string = '';

  build() {
    Column() {
      Image($r('app.media.app_icon')).width(100).height(100).margin({ top: 50 }).interpolation(ImageInterpolation.High)

      Text('用户注册1')
        .margin({ top: 30 })
        .textAlign(TextAlign.Center)
        .width('100%')
        .fontWeight(500)
        .fontSize(25)

      Row() {
        Image($r('app.media.widget_navi_btn_home_c')).width(35).height(35)
        TextInput({ placeholder: "请输入用户名" }).height(40).layoutWeight(1).onChange((value) => {
          this.userName = value;
        })
      }.justifyContent(FlexAlign.Start).width('100%').height(40).margin({ top: 15 })


      Row() {
        Image($r('app.media.widget_navi_btn_office_c')).width(35).height(35)
        TextInput({ placeholder: "请输入密码" })
          .height(40)
          .layoutWeight(1)
          .type(InputType.Password)
          .maxLength(8)
          .onChange((value) => {
            this.pwd = value;
          })
      }.justifyContent(FlexAlign.Start).width('100%').height(40).margin({ top: 15 })

      Row() {
        Text('性别:').fontSize(15).margin({ left: 15 })
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .margin({ left: 25 })
          .checked(this.gender == 1)
          .onChange((isChecked) => {
            isChecked ? this.gender = 1 : this.gender = 0;
          })
        Text('男').fontSize(15).margin({ left: 15 })
        Radio({ value: 'Radio2', group: 'radioGroup' })
          .margin({ left: 25 })
          .checked(this.gender == 0)
          .onChange((isChecked) => {
            isChecked ? this.gender = 0 : this.gender = 1;
          })
        Text('女').fontSize(15).margin({ left: 15 })
      }.justifyContent(FlexAlign.Start).width('100%').height(40).margin({ top: 15 })


      Row() {
        Text('地址:').fontSize(15).margin({ left: 15 })

        Select([{ value: '北京' },
          { value: '上海' },
          { value: '杭州' },
          { value: '广州' }]).margin({ left: 35 }).value('请选择地址').onSelect((index, value) => {
          this.address = value;
        })

      }.justifyContent(FlexAlign.Start).width('100%').height(40).margin({ top: 15 })


      Row() {
        Text('爱好:').fontSize(15).margin({ left: 15 })
        Checkbox({ name: 'checkbox1', group: 'xx' }).margin({ left: 15 })
        Text('arkts').fontSize(15).margin({ left: 10 })
        Checkbox({ name: 'checkbox2', group: 'xx' }).margin({ left: 15 })
        Text('java').fontSize(15).margin({ left: 10 })
        Checkbox({ name: 'checkbox3', group: 'xx' }).margin({ left: 15 })
        Text('kotlin').fontSize(15).margin({ left: 10 })
      }.justifyContent(FlexAlign.Start).width('100%').height(40).margin({ top: 15 })


      Row() {
        Checkbox({ name: 'checkbox1', group: 'xx' })
        Text('记住我').fontColor('blue')
      }.justifyContent(FlexAlign.Center).width('100%').margin({ top: 25 })


      Button('注册')
        .width('80%')
        .height(50)
        .margin({ top: 25 })
        .type(ButtonType.Normal)
        .borderRadius(10)
        .onClick(() => {
          console.log(`username is ${this.userName}`)
          console.log(`pwd is ${this.pwd}`)
          console.log(`gender is ${this.gender == 1 ? '男' : '女'}`)
          console.log(`address is ${this.address}`)
          router.pushUrl({
            url: "pages/FilePathPage",
            params: {
              name: '我是来自页面Index的数据',
              count: 100
            }
          })

          // this.clickNext.bind(this);

        })

    }.alignItems(HorizontalAlign.Center).width('100%').height('100%')

  }


  onPageShow() {
    console.log('testTag Index onPageShow------------------------')
  }

  onPageHide() {
    console.log('testTag Index onPageHide------------------------')

  }

  aboutToAppear() {
    console.log('testTag Index aboutToAppear------------------------')

  }

  aboutToDisappear() {
    console.log('testTag Index aboutToDisappear------------------------')

  }

}

