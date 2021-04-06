<demo>
支持 size
</demo>
<template>
  <div>
    <Button size="big">大按钮</Button>
    <Button>按钮</Button>
    <Button size="small">小按钮</Button>
  </div>
</template>

<script lang="ts">
import Button from '../lib/Button.vue'
export default {
  components: {
    Button
  }
}
</script>
