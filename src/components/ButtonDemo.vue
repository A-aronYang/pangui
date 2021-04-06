<template>
  <div>
    <div>Button 示例</div>
    <Demo :component="ButtonDemo1" />
    <Demo :component="ButtonDemo2" />
    <Demo :component="ButtonDemo3" />
    <Demo :component="ButtonDemo4" />
    <Demo :component="ButtonDemo5" />
  </div>
</template>
<script lang="ts">
import Button from '../lib/Button.vue'
import Demo from '../components/Demo.vue'
import ButtonDemo1 from '../components/Button1.Demo.vue'
import ButtonDemo2 from '../components/Button2.Demo.vue'
import ButtonDemo3 from '../components/Button3.Demo.vue'
import ButtonDemo4 from '../components/Button4.Demo.vue'
import ButtonDemo5 from '../components/Button5.Demo.vue'
export default {
  components: {
    Button,
    Demo
  },
  setup () {
    const onClick = () => {
      console.log('hi')
    }
    return {
      onClick,
      ButtonDemo1,
      ButtonDemo2,
      ButtonDemo3,
      ButtonDemo4,
      ButtonDemo5
    }
  }
}
</script>
