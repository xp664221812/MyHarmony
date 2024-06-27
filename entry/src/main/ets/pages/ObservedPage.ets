@Observed
class A {
  name: string
  b: B

  constructor(name: string, b: B) {
    this.name = name
    this.b = b
  }
}

@Observed
class B {
  age: number

  constructor(age: number) {
    this.age = age
  }
}


@Entry
@Component
struct TestObservedPage {
  @State b: B = new B(18)
  @State a: A = new A('xp', this.b)

  build() {
    Row() {
      Column({space:30}) {
        Text(`父组件 name: ${this.a.b.age}`).onClick(()=>{
          this.a.b.age++
        })

        SubCom({ sub: this.a.b })
      }.width('100%')
    }.width('100%').height('100%')
  }
}

@Component
struct SubCom {
  @ObjectLink
  sub: B

  build() {
    Column() {
      Text(`子组件 ${this.sub.age}`).onClick(()=>{
        this.sub.age--
      })
    }
  }
}


