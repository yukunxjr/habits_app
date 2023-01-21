import colors from "vuetify/es5/util/colors";
require("dotenv").config();

export default {
  mode: "spa",
  /*
   ** Headers of the page
   */
  head: {
    // titleTemplate: "%s - " + process.env.npm_package_name,
    // title: process.env.npm_package_name || "",
    title: "Habits-app",
    meta: [
      { charset: "utf-8" },
      { name: "viewport", content: "width=device-width, initial-scale=1" },
      {
        hid: "description",
        name: "description",
        content: process.env.npm_package_description || "",
      },
    ],
    link: [{ rel: "icon", type: "image/x-icon", href: "/favicon.ico" }],
  },
  /*
   ** Customize the progress-bar color
   */
  loading: { color: "#fff" },
  /*
   ** Global CSS
   */
  css: [],
  /*
   ** Plugins to load before mounting the App
   */
  plugins: ["~/plugins/axios.js", "~/plugins/format-date.js"],
  /*
   ** Nuxt.js dev-modules
   */
  buildModules: ["@nuxtjs/vuetify", "@nuxtjs/moment"],

  moment: {
    locales: ["ja"],
  },
  /*
   ** Nuxt.js modules
   */
  modules: ["@nuxtjs/axios", "@nuxtjs/auth", "@nuxtjs/proxy", "@nuxtjs/dotenv"],

  /*
   ** vuetify module configuration
   ** https://github.com/nuxt-community/vuetify-module
   */
  vuetify: {
    customVariables: ["~/assets/variables.scss"],
    theme: {
      dark: false,
      themes: {
        dark: {
          primary: colors.blue.darken2,
          accent: colors.grey.darken3,
          secondary: colors.amber.darken3,
          info: colors.teal.lighten1,
          warning: colors.amber.base,
          error: colors.deepOrange.accent4,
          success: colors.green.accent3,
        },
      },
    },
  },

  axios: {
    baseURL:
      process.env.NODE_ENV === "production"
        ? "https://learning-management-habits-api.net"
        : "http://localhost:8000",
    proxy: true,
  },
  proxy: {
    "/api/v1/": {
      target:
        process.env.NODE_ENV === "production"
          ? "https://learning-management-habits-api.net"
          : "http://localhost:8000",
      pathRewrite: {
        "^/api/v1/": "/api/v1/",
      },
    },
  },

  auth: {
    redirect: {
      login: "/users/signin", //middleware:authを設定したURLにアクセスがあった場合の、リダイレクト先。
      logout: "/", //ログアウト後のリダイレクト先
      callback: false,
      home: "/home", //ログイン後のリダイレクト先。
    },
    strategies: {
      local: {
        endpoints: {
          login: {
            url: "/api/v1/auth/sign_in",
            method: "post",
            propertyName: "access_token",
          },
          logout: { url: "/api/v1/auth/sign_out", method: "delete" },
          user: false,
        },
      },
    },
  },

  /*
   ** Build configuration
   */
  build: {
    /*
     ** You can extend webpack config here
     */
    extend(config, ctx) {
      config.module.rules.push({
        test: /\.(ogg|mp3|wav|mpe?g)$/i,
        loader: "file-loader",
        options: {
          name: "[path][name].[ext]",
        },
      });
    },
  },
};
