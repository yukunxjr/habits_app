<template>
  <v-app id="inspire">
    <v-main class="blue-grey lighten-5 pt-10">
      <v-container>
        <v-row>
          <v-col cols="3">
            <v-sheet rounded="lg">
              <v-list color="transparent">
                <v-list-item link>
                  <nuxt-link to="/" class="text-decoration-none black--text">
                    ・ アプリの使い方
                  </nuxt-link>
                </v-list-item>
                <v-list-item
                  v-for="Item in Items"
                  :key="Item.number"
                  @click="currentComponent = Item.components"
                >
                  <v-list-item-content>
                    <v-list-item-title> ・ {{ Item.name }} </v-list-item-title>
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
                      ><v-icon>mdi-logout-variant</v-icon>
                      <span class="mx-3"></span>
                      ログアウト
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
                :userSkills="skill"
                @click_reload="reload"
              >
              </component>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import Email from "@/components/User/UserEmail.vue";
import Drawal from "@/components/User/UserDrawal.vue";
import Password from "@/components/User/UserPassword.vue";
import Skills from "@/components/User/UserSkill.vue";

export default {
  middleware: "auth",
  async asyncData({ $axios }) {
    const userData = await $axios.$get("/api/v1/users/new");
    const skillData = await $axios.$get("/api/v1/skills");
    return { user: userData, skill: skillData };
  },

  data: () => ({
    user: "",
    skill: "",
    Items: [
      { name: "アカウント編集", components: "Email" },
      { name: "パスワード変更", components: "Password" },
      { name: "スキル編集", components: "Skills" },
      { name: "アカウント削除", components: "drawal" },
    ],
    currentComponent: "Email",
  }),
  components: { Email, Drawal, Password, Skills },
  methods: {
    async logout() {
      await this.$auth.logout().then(() => {
        localStorage.removeItem("access-token");
        localStorage.removeItem("client");
        localStorage.removeItem("uid");
        localStorage.removeItem("token-type");
      });
    },
    reload() {
      location.reload();
    },
  },
};
</script>
