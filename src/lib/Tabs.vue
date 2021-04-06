<template>
  <div class="pang-tabs">
    <div class="pang-tabs-nav" ref="container">
      <div
        class="pang-tabs-nav-item"
        v-for="(t, index) in titles"
        :key="index"
        :class="{ selected: selected === t }"
        @click="select(t)"
        :ref="
          el => {
            if (selected === t) selectedItem = el
          }
        "
      >
        {{ t }}
      </div>
      <div class="pang-tabs-nav-indicator" ref="indicator"></div>
    </div>
    <div class="pang-tabs-content">
      <component
        class="pang-tabs-content-item"
        :is="current"
        :key="current.props.title"
      ></component>
    </div>
  </div>
</template>
<script lang="ts">
import { computed, onMounted, onUpdated, ref, watchEffect } from 'vue'
import Tab from './Tab.vue'
export default {
  props: {
    selected: {
      type: String
    }
  },
  setup (props, context) {
    //const navItems = ref<HTMLDivElement[]>([]) // ts 中的泛型
    const indicator = ref<HTMLDivElement>(null)
    const container = ref<HTMLDivElement>(null)
    const selectedItem = ref<HTMLDivElement>(null)
    const x = () => {
      const { width } = selectedItem.value.getBoundingClientRect()
      indicator.value.style.width = width + 'px'
      const { left: left1 } = container.value.getBoundingClientRect()
      const { left: left2 } = selectedItem.value.getBoundingClientRect()
      const left = left2 - left1
      indicator.value.style.left = left + 'px'
    }
    onMounted(x)
    onUpdated(x)
    const defaults = context.slots.default()
    // 获取选中内容
    const current = computed(() => {
      return defaults.find(tag => tag.props.title == props.selected)
    })
    // 判断是否是Tab类型
    defaults.forEach(tag => {
      if (tag.type !== Tab) {
        throw new Error('Tabs 子标签必须是Tab')
      }
    })
    // 获取title
    const titles = defaults.map(tag => {
      return tag.props.title
    })
    // 选中title title: string 是ts的写法
    const select = (title: string) => {
      context.emit('update:selected', title)
    }
    return {
      defaults,
      titles,
      current,
      select,
      indicator,
      container,
      selectedItem
    }
  }
}
</script>
<style lang="scss">
$blue: #40a9ff;
$color: #333;
$border-color: #d9d9d9;
.pang-tabs {
  &-nav {
    display: flex;
    color: $color;
    border-bottom: 1px solid $border-color;
    position: relative;
    &-item {
      padding: 8px 0;
      margin: 0 16px;
      cursor: pointer;
      &:first-child {
        margin-left: 0;
      }
      &.selected {
        color: $blue;
      }
    }
    &-indicator {
      position: absolute;
      height: 3px;
      background: $blue;
      left: 0;
      bottom: -1px;
      width: 100px;
      transition: all 250ms;
    }
  }

  &-content {
    padding: 8px 0;
  }
}
</style>
