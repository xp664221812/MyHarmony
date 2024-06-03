import axios from '@ohos/axios'
import { Song } from '../bean/Beans'

@Entry
@Component
struct TestPromisePage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Button(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold).onClick(() => {
          // test1()
          testAxios()
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}


function test1() {
  console.log('qqqqqqqqqqqqqqqqqqqqqqqqqqqq')
  let promise: Promise<string> = new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve('123')
    }, 3000)
  })
  promise.then((result) => {
    console.log(`result is ${result}`)
  }).catch(() => {

  }).finally(() => {

  })
}

let songs: Song[] = []

async function testAxios() {
  console.log('qqqqqqqqqqqqqqqqqqqqqqqqqqqq')

  let response = await axios({
    method: 'get',
    url: 'https://www.yyq.cn/api/getPlayData?playid=4926%2C4925%2C4924%2C4923%2C4922%2C4921%2C4920%2C4919%2C4918%2C4917%2C4916%2C4915&typeid=3'
  })
  if (response.status === 200) {
    songs = response.data
  }
  songs.forEach((vale: Song) => {
    vale.src = 'https://www.yyq.cn/' + vale.src
    console.log(`src is ${JSON.stringify(vale)}`)
  })


}


