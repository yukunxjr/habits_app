<template>
  <v-list>
    <v-list-item v-for="note in this.$parent.notes" :key="note.id" two-line>
      <v-list-content>
        <v-list-item-title>
          {{ note.title }}
        </v-list-item-title>
        <v-list-item-subtitle>{{ note.updated_at }} </v-list-item-subtitle>
      </v-list-content>
    </v-list-item>
  </v-list>
</template>

<script>
export default {};
</script>
