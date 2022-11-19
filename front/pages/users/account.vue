<template>
  <v-app id="inspire">
    <v-main class="grey lighten-3 pt-10">
      <v-container>
        <v-row>
          <v-col cols="3">
            <v-sheet rounded="lg">
              <v-list color="transparent">
                <v-list-item
                  v-for="Item in Items"
                  :key="Item.number"
                  @click="currentComponent = Item.components"
                >
                  <v-list-item-content>
                    <v-list-item-title> ・{{ Item.name }} </v-list-item-title>
                  </v-list-item-content>
                </v-list-item>

                <v-divider class="my-2"></v-divider>

                <v-list-item link color="grey lighten-4">
                  <v-list-item-content>
                    <v-list-item-title
                      v-if="this.$auth.loggedIn"
                      variant="danger"
                      @click="logout"
                      color="gray"
                      >・ログアウト
                    </v-list-item-title>
                  </v-list-item-content>
                </v-list-item>
              </v-list>
            </v-sheet>
          </v-col>

          <v-col>
            <v-card min-height="70vh" rounded="lg">
              <component
                v-bind:is="currentComponent"
                :currentUser="user"
              ></component>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import Profile from "@/components/User/UserProfile.vue";
import Email from "@/components/User/UserEmail.vue";
import Drawal from "@/components/User/UserDrawal.vue";
import Password from "@/components/User/UserPassword.vue";

export default {
  middleware: "auth",
  async asyncData({ $axios }) {
    const data = await $axios.$get("/api/v1/users/new");
    return { user: data };
  },

  data: () => ({
    user: "",
    Items: [
      { name: "プロフィール", components: "Profile" },
      { name: "アカウント編集", components: "Email" },
      { name: "パスワード変更", components: "Password" },
      { name: "アカウント削除", components: "drawal" },
    ],
    currentComponent: "Profile",
  }),
  components: { Profile, Email, Drawal, Password },
  methods: {
    async logout() {
      await this.$auth.logout().then(() => {
        localStorage.removeItem("access-token");
        localStorage.removeItem("client");
        localStorage.removeItem("uid");
        localStorage.removeItem("token-type");
      });
    },
  },
};
</script>
