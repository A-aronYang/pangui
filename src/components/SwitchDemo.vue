<template>
  <div>
    <h1>Switch 组件示例</h1>
    <Demo :component="Switch1" />
    <Demo :component="Switch2" />
  </div>
</template>
<script lang="ts">
import Switch1 from '../components/Switch1.demo.vue'
import Switch2 from '../components/Switch2.demo.vue'
import Demo from '../components/Demo.vue'
import Prism from 'prismjs'
import '../../node_modules/prismjs/themes/prism.css'
export default {
  components: {
    Demo
  },
  setup () {
    return { Switch1, Switch2, Prism }
  }
}
</script>
<style lang="scss" scoped></style>
