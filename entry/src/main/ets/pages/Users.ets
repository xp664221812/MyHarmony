class User {
  name: string = ""
  age: number = 0

  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }
}


@Entry
@Component
struct Users {
  private userArray: User[] = [
    new User('Java', 30),
    new User('Kotlin', 20),
    new User('Groovy', 15),
    new User('C', 60),
    new User('Python', 25),
    new User('Go', 12),
    new User('Er', 55),
    new User('C++', 50),
    new User('java script', 57),


  ]

  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.userArray, (item) => {
          ListItem() {
            Row() {
              Text(item.name)
              Text(item.age + "")
            }.width('100%').height(80).justifyContent(FlexAlign.SpaceBetween).padding({ left: 20, right: 20 })
          }.backgroundColor('white').onClick(() => {

          })

        })
      }
    }.width('100%').height('100%').alignItems(HorizontalAlign.Center).backgroundColor('#eeeeee')
  }
}
