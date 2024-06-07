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

  build() {
    Row() {
      Column({ 'space': 20 }) {
        Text(`num is ${this.number}`)
          .fontSize($r('app.float.font_size'))
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.item_title_font'))


        Button('add').width('80%').onClick(() => {
          postCardAction(this, {
            'action': 'message',
            'params': { 'value': this.number }
          })
        })
      }
      .width(this.FULL_WIDTH_PERCENT)
    }
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
}