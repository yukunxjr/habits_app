<template>
  <v-container fill-height>
    <v-row>
      <v-col cols="12">
        <v-card-title class="justify-center">
          {{ status }}
        </v-card-title>
        <v-card-text v-if="error.statusCode === 404" class="text-center">
          {{ pageNotFound }}
        </v-card-text>
        <v-card-text v-else class="text-center">
          {{ otherError }}
        </v-card-text>
        <v-card-actions class="justify-center">
          <NuxtLink to="/" class="text-decoration-none grey--text">
            <v-icon>mdi-home</v-icon>
          </NuxtLink>
        </v-card-actions>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  layout: "none",
  props: {
    error: {
      type: Object,
      default: null,
    },
  },
  data() {
    return {
      pageNotFound: "ページが見つかりません",
      otherError: "エラーが発生しました",
    };
  },
  head() {
    const title =
      this.error.statusCode === 404 ? this.pageNotFound : this.otherError;
    return {
      title,
    };
  },
  computed: {
    status() {
      return this.error.statusCode;
    },
  },
};
</script>
