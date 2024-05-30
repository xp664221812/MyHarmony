@Entry
@Component
struct TabTest {
  @State currentIndex: number = 0
  @State fontColor: string = '#000000'

  build() {
    Row() {
      Tabs({ barPosition: BarPosition.End, controller: new TabsController() }) {
        TabContent() {
          Row() {
          }.TabRowStyle(Color.Green)
        }.tabBar(this.TabBuilder(0, 'green'))

        TabContent() {
          Row() {
          }.TabRowStyle(Color.Black)
        }.tabBar(this.TabBuilder(1, 'black'))


        TabContent() {
          Row() {
          }.TabRowStyle(Color.Gray)
        }.tabBar(this.TabBuilder(2, 'gray'))

      }.barWidth(360).barHeight(60).onChange((index) => {
        this.currentIndex = index
      })
    }.width('100%').height('100%')
  }

  @Builder
  TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .textAlign(TextAlign.Center)
        .height('100%')
        .fontColor(this.currentIndex == index ? name : this.fontColor)
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .backgroundColor(this.currentIndex == index ? 'white' : '#eeeeee')
  }
}

@Extend(Row)
function TabRowStyle(color: Color) {
  .width('100%').height('100%').backgroundColor(color)
}













