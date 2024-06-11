// 创建新实例并使用给定对象初始化
let storage3 = new LocalStorage({ 'PropA': 47 });
// 使LocalStorage可从@Component组件访问
@Entry(storage3)
@Component
struct CompA {
  // @LocalStorageProp变量装饰器与LocalStorage中的'PropA'属性建立单向绑定
  @LocalStorageProp('PropA') storProp1: number = 1;

  build() {
    Column({ space: 15 }) {
      // 点击后从47开始加1，只改变当前组件显示的storProp1，不会同步到LocalStorage中
      Button(`Parent from LocalStorage ${this.storProp1}`)
        .onClick(() => {
          console.log('1111111111111111111')
          storage3.set('PropA',56)
        })
      ChildCom()
    }
  }
}

@Component
struct ChildCom {
  // @LocalStorageProp变量装饰器与LocalStorage中的'PropA'属性建立单向绑定
  @LocalStorageProp('PropA') storProp2: number = 2;

  build() {
    Column({ space: 15 }) {
      // 当CompA改变时，当前storProp2不会改变，显示47
      Text(`Parent from LocalStorage ${this.storProp2}`)
    }
  }
}