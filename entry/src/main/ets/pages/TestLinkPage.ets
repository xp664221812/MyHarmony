@Entry
@Component
struct TestLinkPage {
  @State mess: number = 123

  build() {
    Row() {
      Column() {
        Text(`我来自父组件  ${this.mess} `)
          .onClick(() => {
            this.mess++
          })
        Test2({ num: this.mess }).margin({ top: 20 })

      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct Test2 {
  @Link
  num: number

  build() {
    Column({ space: 20 }) {
      Text(`我来自子组件 ${this.num}`).onClick(() => {
        this.num++
      })

      SubTest2({ subNum: this.num })
    }.width('100%')
  }
}

@Component
struct SubTest2 {
  @Link
  subNum: number

  build() {
    Text(`我是来自孙子组件 ${this.subNum}`).onClick(() => {
      this.subNum++
    })
  }
}
