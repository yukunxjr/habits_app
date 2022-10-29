<template>
  <header>
    <v-app-bar app dark>
      <v-app-bar-nav-icon @click="drawer = true"></v-app-bar-nav-icon>
      <v-toolbar-title>学習管理アプリ　Habits</v-toolbar-title>
      <v-tabs>
        <v-tab v-for="(Item, index) in Items" :key="index">
          {{ Item.name }}
        </v-tab>
      </v-tabs>
    </v-app-bar>
    <v-navigation-drawer v-model="drawer" fixed temporary>
      <v-list nav dense>
        <v-list-item-group>
          <v-list-item v-for="(Item, index) in Items" :key="index">
            <v-list-item-title>{{ Item.name }}</v-list-item-title>
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
  margin-right: 50px !important;
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
</style>
