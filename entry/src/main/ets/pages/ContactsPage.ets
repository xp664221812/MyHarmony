import ArrayList from '@ohos.util.ArrayList'

@Entry
@Component
struct ContactsPage {
  @State message: string = 'Hello World'
  @State contactList: Contact[] = [new Contact('A', '18310102323'), new Contact('B', '18210102323')
    , new Contact('C', '13410101234'), new Contact('D', '18610100808'), new Contact('E', '13510101234')
    , new Contact('F', '16610104321'), new Contact('G', '12345678912'), new Contact('H', '13333333912')]

  build() {
    Row() {
      Column() {
        Title({ contactList: $contactList })
        Content({ contactList: $contactList })
      }.justifyContent(FlexAlign.Start)
      .width('100%').height('100%')
    }
    .height('100%')
  }

  aboutToAppear() {

  }

  aboutToDisappear() {

  }

  onPageShow() {

  }

  onPageHide() {

  }
}



class Contact {
  name: string
  phone: string

  constructor(name, phone) {
    this.name = name
    this.phone = phone
  }
}

@Component
struct Title {
  @Link contactList: Contact[]

  build() {
    Row() {
      Column() {
        Text(`联系人个数：${this.contactList.length}`).textAlign(TextAlign.Center)
      }.width('100%')
    }.width('100%').height(100).backgroundColor(Color.Green)
  }
}


@Component
struct Content {
  @Link contactList: Contact[]

  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.contactList, (item) => {
          ListItem() {
            Row() {
              Column() {
                Text(item.name).fontColor(Color.White).fontSize(40)
                Text(item.phone).fontColor(Color.White)
              }
              .width('90%')
              .height(100)
              .justifyContent(FlexAlign.SpaceAround)

              .alignItems(HorizontalAlign.Start)


              Text('删除').width(100).height(100).onClick(() => {
                this.contactList.pop()
              })
            }.justifyContent(FlexAlign.Start).backgroundColor('#36d').padding({ left: 30, right: 30 })
          }

        })
      }.height('100%')
    }.width('100%').height('100%')
  }
}
