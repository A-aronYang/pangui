<demo>
常规使用
</demo>
<template>
  <div>
    <Button @click="toggle">toggle</Button>
    <!-- <Dialog :visible="x" @update:visible="x = $event"></Dialog> -->
    <Dialog
      v-model:visible="x"
      :closeOnClickOverlay="false"
      :ok="f1"
      :cancel="f2"
    >
      <template v-slot:content>
        <h1>hi</h1>
        <h2>hi</h2>
      </template>
      <template v-slot:title>
        <h2>提示</h2>
      </template>
    </Dialog>
  </div>
</template>

<script lang="ts">
import Dialog from '../lib/Dialog.vue'
import Button from '../lib/Button.vue'
import { ref } from 'vue'

export default {
  components: {
    Dialog,
    Button
  },
  setup () {
    const x = ref(false)
    const toggle = () => {
      x.value = !x.value
    }
    const f1 = () => {
      return true
    }
    const f2 = () => {}
    return {
      x,
      toggle,
      f1,
      f2
    }
  }
}
</script>
