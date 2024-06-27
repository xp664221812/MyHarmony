import formInfo from '@ohos.app.form.formInfo';
import formBindingData from '@ohos.app.form.formBindingData';
import FormExtensionAbility from '@ohos.app.form.FormExtensionAbility';
import Want from '@ohos.app.ability.Want';
import formProvider from '@ohos.app.form.formProvider';
import axios from '@ohos/axios'
import { WeatherResp } from '../bean/WeatherResp';
import {Request} from '../tools/Request'


export default class EntryFormAbility extends FormExtensionAbility {
  onAddForm(want: Want) {
    // Called to return a FormBindingData object.
    let formData = '';
    return formBindingData.createFormBindingData(formData);
  }

  onCastToNormalForm(formId: string) {
    // Called when the form provider is notified that a temporary form is successfully
    // converted to a normal form.
  }

  onUpdateForm(formId: string) {
    // Called to notify the form provider to update a specified form.
  }

  onChangeFormVisibility(newStatus: Record<string, number>) {
    // Called when the form provider receives form events from the system.
  }

  onFormEvent(formId: string, message: string) {
    // Called when a specified message event defined by the form provider is triggered.
    console.log('onFormEvent--------------------' + message)

    this.syncNowWeather(formId)
  /*  let obj = JSON.parse(message)
    console.log(`resNmu is ${obj.value}`)

    let resp = obj.value + 1
    let formData = {
      'num': resp,
    };
    let formInfo = formBindingData.createFormBindingData(formData)
    formProvider.updateForm(formId, formInfo).then((data) => {
      console.info('FormAbility updateForm success.' + JSON.stringify(data));
    }).catch((error) => {
      console.error('FormAbility updateForm failed: ' + JSON.stringify(error));
    })*/
  }

  onRemoveForm(formId: string) {
    // Called to notify the form provider that a specified form has been destroyed.
  }

  onAcquireFormState(want: Want) {
    // Called to return a {@link FormState} object.
    return formInfo.FormState.READY;
  }

  async syncNowWeather(formId: string) {
    console.log('qqqqqqqqqqqqqqqqqqqqqqqqqqqq')




    let response = await axios({
      method: 'get',
      url: 'https://devapi.qweather.com/v7/weather/now?location=101010100&key=15c9b5ef6dd84893aba13d650174b204'
    })
    if (response.status === 200) {
      let weatherResp: WeatherResp = response.data

      console.log(`aaaaaaaaaaaaaaaaaaaaa=${JSON.stringify(weatherResp)}}`)

      let formData = {
        'text': weatherResp?.now.text,
        'temp': weatherResp?.now.temp
      };
      let formInfo = formBindingData.createFormBindingData(formData)
      formProvider.updateForm(formId, formInfo).then((data) => {
        console.info('FormAbility updateForm success.' + JSON.stringify(data));
      }).catch((error) => {
        console.error('FormAbility updateForm failed: ' + JSON.stringify(error));
      })

      this.syncDailyWeather(formId)
    }
  }


  async syncDailyWeather(formId: string) {
    let response = await axios({
      method: 'get',
      url: 'https://devapi.qweather.com/v7/weather/3d?location=101010100&key=15c9b5ef6dd84893aba13d650174b204'
    })
    if (response.status === 200) {
      let weatherResp: WeatherResp = response.data

      console.log(`aaaaaaaaaaaaaaaaaaaaa=${JSON.stringify(weatherResp)}}`)

      let formData = {
        'tempMax': weatherResp?.daily[0].tempMax,
        'tempMin': weatherResp?.daily[0].tempMin
      };
      let formInfo = formBindingData.createFormBindingData(formData)
      formProvider.updateForm(formId, formInfo).then((data) => {
        console.info('FormAbility updateForm success.' + JSON.stringify(data));
      }).catch((error) => {
        console.error('FormAbility updateForm failed: ' + JSON.stringify(error));
      })

    }
  }



};