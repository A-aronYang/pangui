<demo>
一键打开 Dialog
</demo>
<template>
  <div>
    <Button @click="showDialog">打开对话框</Button>
  </div>
</template>

<script lang="ts">
import { openDialog } from '../lib/openDialog'
import Dialog from '../lib/Dialog.vue'
import Button from '../lib/Button.vue'
export default {
  components: {
    Dialog,
    Button
  },
  setup () {
    const showDialog = () => {
      openDialog({
        title: '提示',
        content: 'content',
        ok () {
          console.log('ok')
        },
        cancel () {
          console.log('cancel')
        }
      })
    }

    return { showDialog }
  }
}
</script>
