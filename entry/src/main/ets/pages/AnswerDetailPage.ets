import promptAction from '@ohos.promptAction'

@Entry
@Component
struct AnswerDetailPage {
  @State message: string = 'Hello World'
  @State commentList: CommentContentBean[] = []
  @State answerContentBean: AnswerContentBean = new AnswerContentBean(1717038728914, '杭州', 30
    , '我们来猜想一下原因，Image的父布局Flex其实是一个宽高都不确定的组件，设计初衷，宽度是根据屏幕尺寸扣除了一个固定宽高的（这里设置的是50）Flex剩余的部分，用layoutWeight设定，而高度是图片自行撑开。', false, '我是谁')
  @State myComment: string = ''
  scroller: Scroller = new Scroller()

  // @State scroller: Scroller = new Scroller()

  @Builder
  itemHead() {
    Column() {
      Row() {
        Image(this.answerContentBean.avatar).width(30).margin({ left: 15, top: 15 })

        Column() {
          Text(this.answerContentBean.name).width('100%').fontWeight(600).fontColor('#B3000000')

          Text(this.answerContentBean.answerContent).margin({ top: 12 })

          Row() {
            Row() {
              Text('5-15').fontColor('#B3000000').opacity(0.5).fontSize(13)
              Text('ip属地').fontColor('#B3000000').opacity(0.5).fontSize(13).margin({ left: 5 })
              Text(this.answerContentBean.ipAddress)
                .fontColor('#B3000000')
                .opacity(0.5)
                .fontSize(13)
                .margin({ left: 2 })
            }

            Row() {
              if (this.answerContentBean.isLike) {
                Image($r('app.media.ic_like')).width(18).onClick(() => {
                  this.answerContentBean.isLike = false
                  this.answerContentBean.likeCount--
                })
              } else {
                Image($r('app.media.ic_not_like')).width(18).onClick(() => {
                  this.answerContentBean.isLike = true
                  this.answerContentBean.likeCount++
                })
              }
              Text(this.answerContentBean.likeCount + "").fontSize(13).margin({ left: 5 })
            }
          }.width('100%').justifyContent(FlexAlign.SpaceBetween).margin({ top: 7 })

        }
        .padding({ left: 10, top: 15, right: 10 })
        .justifyContent(FlexAlign.Start)
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)
      }.width('100%').alignItems(VerticalAlign.Top).padding({ bottom: 15 })

      Text().width('100%').backgroundColor('#e5e5e5').height(15)

    }.width('100%')

  }

  update() {
    this.scroller.scrollToIndex(this.commentList.length)
  }

  build() {
    Column() {
      ToolBar()
      List({ scroller: this.scroller }) {
        ListItemGroup({ header: this.itemHead() }) {
        }

        ForEach(this.commentList, (item) => {
          ListItem() {
            // this.itemBody(item)
            CommentItem({ commentContentBean: <CommentContentBean> item })
          }
        })
      }.layoutWeight(1)

      Footer({ myComment: $myComment, commentList: this.commentList, updateScroller: () => {
        this.update()
      } })
    }.backgroundColor(Color.White)
    .width('100%')
    .height('100%')
  }

  aboutToAppear() {
    this.initData()
  }

  initData() {
    // this.answerContentBean = new AnswerContentBean(1717038728914, '杭州', 30
    //   , '我们来猜想一下原因，Image的父布局Flex其实是一个宽高都不确定的组件，设计初衷，宽度是根据屏幕尺寸扣除了一个固定宽高的（这里设置的是50）Flex剩余的部分，用layoutWeight设定，而高度是图片自行撑开。', false, '我是谁')

    let commentContentBean1 = new CommentContentBean(1717038728914 + 100, '苏州', 10000
      , '江苏女子晒婆婆做的饭', false, '范弗利特')
    let commentContentBean2 = new CommentContentBean(1717038728914 + 100, '杭州', 4
      , '不通透，单元中间户的刚需小破烂。。。流通性不行，不是一线核心城区位置，三五年后就成永久房东了', false, '唯得分论')
    let commentContentBean3 = new CommentContentBean(1717038728914 + 1000, '金华', 5
      , '户型挺好的 杭州的房子品质普遍不错', false, '湖人禾斗匕匕布莱恩特')
    let commentContentBean4 = new CommentContentBean(1717038728914 + 400, '上海', 6
      , '不行，到处门，动线乱', false, '天堂-地狱')
    let commentContentBean5 = new CommentContentBean(1717038728914 + 321, '广州', 7
      , '你可真敢说啊，单价3.8万不能说核心区但至少不算差了，杭州目前的开发商139基本都边套，中间套是98的小三房。', false, '跟谁俩呢一天天')
    let commentContentBean6 = new CommentContentBean(1717038728914 + 678, '兰州', 8
      , '户型能接受', false, 'a15027260')
    let commentContentBean7 = new CommentContentBean(1717038728914 + 543, '成都', 9
      , '挺方正的', false, '小淮阴侯')
    let commentContentBean8 = new CommentContentBean(1717038728914 + 11111, '重庆', 100
      , '利用率高', false, 'GooGooGood')

    this.commentList.push(commentContentBean1)
    this.commentList.push(commentContentBean2)
    this.commentList.push(commentContentBean3)
    this.commentList.push(commentContentBean4)
    this.commentList.push(commentContentBean5)
    this.commentList.push(commentContentBean6)
    this.commentList.push(commentContentBean7)
    this.commentList.push(commentContentBean8)


  }
}

@Component
struct ToolBar {
  build() {
    Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween }) {
      Image($r('app.media.ic_arrow_left')).width(40).interpolation(ImageInterpolation.High)
      Text('评论回复').textAlign(TextAlign.Center).height('100%').fontSize(17)
      Text().width(40)

    }.width('100%').height(40).backgroundColor(Color.Orange)
  }
}

@Component
struct Footer {
  @Link
  myComment: string
  @Link
  commentList: CommentContentBean[]
  count: number = 0
  updateScroller: () => void = () => {
  }

  build() {
    Column() {
      Divider().strokeWidth(8).color('#F1F3F5').width('100%')
      Row() {
        TextInput({ text: this.myComment, placeholder: '回复' })
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .width('80%')
          .height(40)
          .margin({ left: 10, top: 10 })
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.myComment = value
          })

        Text('发布').fontColor(Color.Blue).textAlign(TextAlign.Center).margin({ top: 10, left: 10 }).onClick(() => {
          console.info('发布被点击了' + (++this.count))
          // promptAction.showToast({message:'内容不能为空'})
          if (!this.myComment) {
            promptAction.showToast({ message: '内容不能为空' })
          } else {
            let commentContentBean = new CommentContentBean(1717038728914 + 678, '北京', 8
              , this.myComment, false, 'xp')

            this.commentList.push(commentContentBean)

            this.myComment = ''
            this.updateScroller()
          }
        })

      }.alignItems(VerticalAlign.Center)

    }.width('100%').height(80).alignItems(HorizontalAlign.Start)
  }
}

@Component
struct CommentItem {
  @ObjectLink commentContentBean: CommentContentBean

  build() {
    Row() {
      Image(this.commentContentBean.avatar).width(30).margin({ left: 15, top: 15 })

      Column() {
        Text(this.commentContentBean.name).width('100%').fontWeight(600).fontColor('#B3000000')

        Text(this.commentContentBean.commentContent).margin({ top: 12 })

        Row() {
          Row() {
            Text('5-15').fontColor('#B3000000').opacity(0.5).fontSize(13)
            Text('ip属地').fontColor('#B3000000').opacity(0.5).fontSize(13).margin({ left: 5 })
            Text(this.commentContentBean.ipAddress)
              .fontColor('#B3000000')
              .opacity(0.5)
              .fontSize(13)
              .margin({ left: 2 })
          }

          Row() {
            if (this.commentContentBean.isLike) {
              Image($r('app.media.ic_like')).width(18).onClick(() => {
                console.log('1111111111111111111111')
                this.commentContentBean.isLike = false
                this.commentContentBean.likeCount--
              })
            } else {
              Image($r('app.media.ic_not_like')).width(18).onClick(() => {
                console.log('222222222222222222222222')
                this.commentContentBean.isLike = true
                this.commentContentBean.likeCount++
              })
            }
            Text(this.commentContentBean.likeCount + "").fontSize(13).margin({ left: 5 })
          }
        }.width('100%').justifyContent(FlexAlign.SpaceBetween).margin({ top: 7 })

      }
      .padding({ left: 10, top: 15, right: 10 })
      .justifyContent(FlexAlign.Start)
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
    }.width('100%').alignItems(VerticalAlign.Top).padding({ bottom: 15 })
  }
}


class AnswerContentBean {
  name: string = ''
  avatar?: Resource = $r("app.media.ic_user_default")
  date: number = new Date().getTime()
  ipAddress: string = '未知'
  likeCount: number = 0
  answerContent: string = ''
  isLike: Boolean = false

  constructor(date: number, ipAddress: string, likeCount: number, answerContent: string, isLike: boolean, name: string, avatar: Resource = $r("app.media.ic_user_default")) {
    this.date = date
    this.ipAddress = ipAddress
    this.likeCount = likeCount
    this.answerContent = answerContent
    this.isLike = isLike
    this.name = name
    this.avatar = avatar
  }
}

@Observed
class CommentContentBean {
  name: string = ''
  avatar?: Resource = $r("app.media.ic_user_default")
  date: number = new Date().getTime()
  ipAddress: string = '未知'
  likeCount: number = 0
  commentContent: string = ''
  isLike: Boolean = false

  constructor(date: number, ipAddress: string, likeCount: number, commentContent: string, isLike: boolean, name: string, avatar: Resource = $r("app.media.ic_user_default")) {
    this.date = date
    this.ipAddress = ipAddress
    this.likeCount = likeCount
    this.commentContent = commentContent
    this.isLike = isLike
    this.name = name
    this.avatar = avatar
  }
}


