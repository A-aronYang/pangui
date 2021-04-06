<template>
  <div>
    <button
      class="pang-switch"
      :class="{ 'pang-checked': value }"
      @click="toggle"
      :disabled="disabled"
    >
      <span></span>
    </button>
  </div>
</template>
<script lang="ts">
import { ref } from 'vue'
export default {
  props: {
    value: Boolean,
    disabled: {
      type: Boolean,
      value: false
    }
  },
  setup (props, context) {
    const { disabled } = props
    const checked = ref(false)
    const toggle = () => {
      context.emit('update:value', !props.value)
    }
    return { checked, toggle, disabled }
  }
}
</script>
<style lang="scss">
$h: 22px;
$h2: $h - 4px;
.pang-switch {
  height: $h;
  width: $h * 2;
  border: none;
  background-color: #bfbfbf;
  border-radius: $h/2;
  position: relative;
  &:focus {
    outline: none;
  }
  span {
    position: absolute;
    top: 2px;
    left: 2px;
    width: 2px;
    height: $h2;
    width: $h2;
    background-color: #fff;
    border-radius: $h2/2;
    transition: left 250ms;
  }
  &.pang-checked {
    background-color: #1890ff;
    > span {
      left: calc(100% - #{$h2} - 2px);
    }
  }
}
</style>
