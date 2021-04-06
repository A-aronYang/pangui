// shims-vue.d.ts
declare module '*.vue' {
  import { ComponentOptions } from 'vue'
  const componentOptions: ComponentOptions
  export default componentOptions
}

// 解决导入md红线
declare module '*.md' {
  const str: String
  export default str
}
