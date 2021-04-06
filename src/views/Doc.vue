<template>
  <div class="layout">
    <Topnav toggleMenuButtonVisible class="nav" />
    <div class="content">
      <aside v-if="asideVisible">
        <h2>文档</h2>
        <ol>
          <li>
            <router-link to="/doc/intro">介绍</router-link>
          </li>
          <li>
            <router-link to="/doc/install">安装</router-link>
          </li>
          <li>
            <router-link to="/doc/get-started">开始使用</router-link>
          </li>
        </ol>
        <h2>组件列表</h2>
        <ol>
          <li><router-link to="/doc/switch">switch 组件</router-link></li>
          <li><router-link to="/doc/button">Button 组件</router-link></li>
          <li><router-link to="/doc/dialog">Dialog 组件</router-link></li>
          <li><router-link to="/doc/tabs">Tabs 组件</router-link></li>
        </ol>
      </aside>
      <main>
        <router-view></router-view>
      </main>
    </div>
  </div>
</template>

<script lang="ts">
import { inject, Ref } from 'vue'
import Topnav from '../components/Topnav.vue'
export default {
  components: {
    Topnav
  },
  setup () {
    const asideVisible = inject<Ref<boolean>>('asideVisible') //Ref<boolean>标注类型
    return { asideVisible }
  }
}
</script>

<style lang="scss" scoped>
.layout {
  display: flex;
  flex-direction: column;
  height: 100vh;
  > .nav {
    flex-shrink: 0;
  }
  > .content {
    flex-grow: 1;
    padding-top: 60px;
    padding-left: 156px;
    @media (max-width: 500px) {
      padding-left: 0;
    }
  }
}
.content {
  display: flex;
  > aside {
    flex-shrink: 0;
  }
  > main {
    flex-grow: 1;
    padding: 16px;
  }
}
aside {
  // background: lightblue;
  width: 150px;
  padding: 16px 0;
  position: fixed;
  top: 0;
  left: 0;
  padding-top: 70px;
  height: 100%;
  z-index: 9;
  background-color: #fff;
  box-shadow: 5px 0 5px rgb(51 51 51 / 10%);
  > h2 {
    margin-bottom: 4px;
    padding: 0 16px;
  }
  > ol {
    > li {
      // padding: 4px 0;
      a {
        text-decoration: none;
        display: block;
        padding: 8px 16px;
        transition: background-color 300ms;
        border-right: 3px solid transparent;
        &:hover {
          background-color: #fd9392;
          color: #fff;
        }
      }
      .router-link-active {
        color: #fff;

        background-color: #fd9392;
      }
    }
  }
}
main {
  overflow: auto;
}
</style>
