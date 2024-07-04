import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
// 按需导入element-plus的更多组件
import AutoImport from 'unplugin-auto-import/vite'
import Components from 'unplugin-vue-components/vite'
import { ElementPlusResolver } from 'unplugin-vue-components/resolvers'
// 设置默认配置
export default defineConfig({
  plugins: [vue(),
  AutoImport({
        resolvers: [ElementPlusResolver()],
      }),
      Components({
        resolvers: [ElementPlusResolver()],
      })
  ],
  transpileDependencies: true,
  lintOnSave:false,
  publicPath:'./',
  server:{
  	  port:8088  //以此端口开始依次改变
  }
})
