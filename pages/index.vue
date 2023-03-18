<template>
  <div>
    <b-container class="mt-5">
      <h1>Welcome to DataCose Vue Challenge</h1>
      <p>
        Navigate to the <nuxt-link to="/posts">Posts</nuxt-link> or
        <nuxt-link to="/todos">Todos</nuxt-link> pages using the navbar above.
      </p>
    </b-container>
  </div>
</template>

<script lang="ts">
import Vue from 'vue';

export default Vue.extend({
  name: 'IndexPage',
});
</script>

<style>
tbody tr td {
  cursor: pointer;
}
</style>