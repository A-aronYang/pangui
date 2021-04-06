<template>
  <div class="topnav">
    <router-link to="/" class="logo">
      <svg class="icon">
        <use xlink:href="#icon-shezhichilun"></use>
      </svg>
    </router-link>
    <ul class="menu">
      <li><router-link to="/doc">文档</router-link></li>
    </ul>
    <svg v-if="toggleMenuButtonVisible" class="toggleAside" @click="toggleMenu">
      <use xlink:href="#icon-caidan"></use>
    </svg>
  </div>
</template>

<script lang="ts">
import { Ref, inject } from 'vue'
export default {
  props: {
    toggleMenuButtonVisible: {
      type: Boolean,
      default: false
    }
  },
  setup () {
    const asideVisible = inject<Ref<boolean>>('asideVisible') //Ref<boolean>标注类型
    const toggleMenu = () => {
      asideVisible.value = !asideVisible.value
    }
    return { toggleMenu }
  }
}
</script>

<style lang="scss" scoped>
.topnav {
  display: flex;
  padding: 16px;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  z-index: 15;
  justify-content: center;
  align-items: center;
  box-shadow: 0 5px 5px rgb(51 51 51 / 10%);
  background-color: #fff;
  > .logo {
    max-width: 6em;
    margin-right: auto;
    svg {
      width: 32px;
      height: 32px;
    }
  }
  > .menu {
    display: flex;
    white-space: nowrap;
    flex-wrap: nowrap;
    > li {
      margin: 0 1em;
    }
  }
  > .toggleAside {
    width: 36px;
    height: 36px;
    position: absolute;
    left: 16px;
    top: 50%;
    transform: translateY(-50%);
    display: none;
  }
  @media (max-width: 500px) {
    > .menu {
      display: none;
    }
    > .logo {
      margin-right: 0;
      margin-left: auto;
    }
    > .toggleAside {
      display: inline-block;
    }
  }
}
</style>
