<template>
  <header>
    <v-app-bar color="white">
      <v-app-bar-nav-icon @click="drawer = true"></v-app-bar-nav-icon>
      <v-toolbar-title>
        <v-img
          v-bind:src="require('@/assets/images/logo.png')"
          class="logo mr-3"
        >
        </v-img>
      </v-toolbar-title>
      <v-toolbar-title class="mr-10 text-h5 font"
        ><span class="font-w"> Habits</span>
      </v-toolbar-title>
      <!-- PC画面 -->
      <!-- ログインしている -->
      <v-tabs
        v-if="this.$auth.loggedIn"
        background-color="transparent"
        color="blue"
        grow
      >
        <v-tab v-for="(Item, index) in Items" :key="index" class="text-h6">
          <nuxt-link :to="Item.url" class="text-decoration-none grey--text">
            <v-icon>{{ Item.icon }}</v-icon>
            <span class="item-space"> </span>
            {{ Item.name }}
          </nuxt-link>
        </v-tab>
        <v-tab>
          <nuxt-link
            to="/users/account"
            class="text-decoration-none grey--text text-h6"
          >
            <v-icon>mdi-account-circle</v-icon>
            <span class="item-space"> </span>
            ACCOUNT
          </nuxt-link>
        </v-tab>
      </v-tabs>
      <!-- ログインしていない -->
      <v-tabs
        v-if="!this.$auth.loggedIn"
        background-color="transparent"
        color="blue"
        right
      >
        <v-tab class="text-h6">
          <nuxt-link to="/" class="text-decoration-none grey--text">
            <v-icon>mdi-star</v-icon>
            <span class="item-space"> </span>
            SERVICE
          </nuxt-link>
        </v-tab>
        <v-tab class="ml-4 text-h6">
          <nuxt-link to="/users/login" class="text-decoration-none grey--text">
            <v-icon>mdi-account-circle</v-icon>
            <span class="item-space"> </span>
            LOGIN
          </nuxt-link>
        </v-tab>
        <v-btn
          color="primary"
          elevation="2"
          to="/users/signup"
          large
          class="mt-3 mx-4"
          >無料会員登録</v-btn
        >
      </v-tabs>
    </v-app-bar>
    <!-- レスポンシブデザイン -->
    <!-- ログイン済み -->
    <v-navigation-drawer
      v-if="this.$auth.loggedIn"
      v-model="drawer"
      fixed
      temporary
    >
      <v-list nav dense>
        <v-list-item-group>
          <v-list-item v-for="(Item, index) in Items" :key="index">
            <nuxt-link :to="Item.url" class="text-decoration-none grey--text">
              {{ Item.name }}
            </nuxt-link>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>
    <!-- ログインしていない -->
    <v-navigation-drawer
      v-if="!this.$auth.loggedIn"
      v-model="drawer"
      fixed
      temporary
    >
      <v-list nav dense>
        <v-list-item-group>
          <v-list-item>
            <nuxt-link to="/" class="text-decoration-none grey--text">
              <v-icon>mdi-star</v-icon>
              <span class="item-space"> </span>
              SERVICE
            </nuxt-link>
          </v-list-item>
          <v-list-item>
            <nuxt-link
              to="/users/login"
              class="text-decoration-none grey--text"
            >
              <v-icon>mdi-account-circle</v-icon>
              <span class="item-space"> </span>
              LOGIN
            </nuxt-link>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>
  </header>
</template>

<script>
import constants from "@/common/headerItems";
export default {
  data() {
    return {
      drawer: false,
      Items: constants.Items,
    };
  },
};
</script>

<style lang="scss" scoped>
.v-toolbar__title {
  overflow: visible !important;
}
.v-app-bar__nav-icon {
  @include display_pc {
    display: none !important;
  }
}
.v-tabs {
  display: none;

  @include display_pc {
    display: block !important;
  }
}
.item-space {
  padding: 3px;
}
.logo {
  height: 40px;
  width: 40px;
}
.font-w {
  font-family: serif, sans-serif;
}
</style>
