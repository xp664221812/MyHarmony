// "code": 200,
// "message": "获取数据ok",
// "data": {
export class ResponseData<T> {
  code:number = 0
  message:string=""
  data:T | null= null

}