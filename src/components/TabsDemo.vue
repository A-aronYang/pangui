<template>
  <div>
    <Demo :component="Tabs1Demo" />
  </div>
</template>
<script lang="ts">
import Tabs1Demo from './Tabs1Demo.vue'
import Demo from './Demo.vue'
export default {
  components: {
    Demo
  },
  setup () {
    return { Tabs1Demo }
  }
}
</script>
