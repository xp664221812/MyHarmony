let storage = new LocalStorage({ num: 45 })

@Entry
@Component
struct WeatherCard {
  /*
   * The title.
   */
  readonly TITLE: string = 'Hello World';
  /*
   * The action type.
   */
  readonly ACTION_TYPE: string = 'router';
  /*
   * The ability name.
   */
  readonly ABILITY_NAME: string = 'EntryAbility';
  /*
   * The message.
   */
  readonly MESSAGE: string = 'add detail';
  /*
   * The width percentage setting.
   */
  readonly FULL_WIDTH_PERCENT: string = '100%';
  /*
   * The height percentage setting.
   */
  readonly FULL_HEIGHT_PERCENT: string = '100%';
  @LocalStorageProp('num') number: number = 123;
  @LocalStorageProp('text') text: string = '-';
  @LocalStorageProp('category') category: string = '-';
  @LocalStorageProp('temp') temp: string = '-';

  @LocalStorageProp('tempMax') tempMax: string = '-';
  @LocalStorageProp('tempMin') tempMin: string = '-';


  flat = true

  build() {
    Stack() {

      Image($r('app.media.bg')).objectFit(ImageFit.Fill).height('100%').width('100%')

      Column() {
        Row() {
          Text('北京')
            .fontSize($r('app.float.font_size'))
            .fontWeight(FontWeight.Bold)
            .fontSize(26)
            .fontColor(Color.White)
            .margin({ left: 20 })
            .align(Alignment.Top)
          Image($r("app.media.sunny_light")).margin({ right: 10 }).width(60).interpolation(ImageInterpolation.High)


        }.justifyContent(FlexAlign.SpaceBetween).margin({ top: 5 }).width('100%')

        Text(`${this.temp}℃`).fontSize(50).fontColor(Color.White).margin({ left: 20 })

        Text(`${this.text}  空气${this.category}`).fontSize(20).fontColor(Color.White).margin({ left: 15 })
        Text(`${this.tempMax}℃ / ${this.tempMin}℃`).fontSize(20).fontColor(Color.White).margin({ left: 15 })

      }.justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Start)
      .width(this.FULL_WIDTH_PERCENT)
      .height(this.FULL_HEIGHT_PERCENT)
    }
    .width(this.FULL_WIDTH_PERCENT)
    .height(this.FULL_HEIGHT_PERCENT)
    .onClick(() => {
      postCardAction(this, {
        action: this.ACTION_TYPE,
        abilityName: this.ABILITY_NAME,
        params: {
          message: this.MESSAGE
        }
      });
    })
  }

  @Builder
  test() {

  }

  aboutToAppear() {
    postCardAction(this, {
      'action': 'message',
      'params': { 'value': this.number }
    })
  }
}