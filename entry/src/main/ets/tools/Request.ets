//对http的请求协议进行封装
import request from '@ohos.request'
import http from '@ohos.net.http'
import { BASE_URL } from './NetBase'
import router from '@ohos.router'
import promptAction from '@ohos.promptAction'
import { ResponseData } from './ResponseData'

const httpRequest = http.createHttp()

export class Request {
  static get<T>(url: string, data?: object): Promise<T> {
    return requestHttp<T>(url, http.RequestMethod.GET, data)
  }

  static post<T>(url: string, data?: object): Promise<T> {
    return requestHttp<T>(url, http.RequestMethod.POST, data)
  }

  static delete<T>(url: string, data?: object): Promise<T> {
    return requestHttp<T>(url, http.RequestMethod.DELETE, data)
  }

  static put<T>(url: string, data?: object): Promise<T> {
    return requestHttp<T>(url, http.RequestMethod.PUT, data)
  }
}

//自己对http的协议进行封装
async function requestHttp<T>(url: string = "",
                              method: http.RequestMethod = http.RequestMethod.GET
  , data?: object): Promise<T> {
  //针对get请求进行拼接参数  /tasks?username=luge&age=46
  let urlStr = BASE_URL + url
  if (method === http.RequestMethod.GET) {
    if (data && Object.keys(data).length) {
      urlStr += "?" + Object.keys(data).map(key => {
        if (data[key]) {
          return `${key}=${data[key]}`
        }
        return ""
      }).join('&')
    }
  }

  //header的设置 data数据的传递
  const config: http.HttpRequestOptions = {
    header: {
      'Content-Type': 'application/json'
    },
    method,
    readTimeout: 10000,
    extraData: method === http.RequestMethod.GET ? "" : data
  }

  try {
    const res = await httpRequest.request(urlStr, config)
    if (res.responseCode === 401) {
      /// 业务 跳转到登录页 刷新本地的token 自己写了 主要是借助sp本地的持久化
      // router.replaceUrl()


      return Promise.reject(new Error("用户被T下线了需要重新登录"))
    } else if (res.responseCode === 404) {
      promptAction.showToast({ message: "请求数据不对" })
      return Promise.reject(new Error("请求数据不对"))
    } else {
      const result = JSON.parse(res.result as string) as ResponseData<T>
      if (result.code === 200) {
        return result.data as T
      } else {
        promptAction.showToast({ message: '服务器出问题了' })
        return Promise.reject(new Error(result.message))
      }
    }
  } catch (error) {
    promptAction.showToast({ message: '服务器出问题了' })
    return Promise.reject(error)
  } finally {
    httpRequest.destroy()
  }

}
