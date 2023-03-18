<template>
  <b-navbar toggleable="md" type="dark" variant="info" class="px-5">
    
    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>
    <b-collapse id="nav-collapse" is-nav>
      <b-navbar-nav>
        <b-nav-item href="/posts">Posts</b-nav-item>
        <b-nav-item href="/todos">Todos</b-nav-item>
      </b-navbar-nav>
    </b-collapse>

    <b-navbar-brand href="/" class="ml-auto">DataCose Vue Challenge</b-navbar-brand>
  </b-navbar>
</template>

<script lang="ts">
import Vue from 'vue';

export default Vue.extend({
  name: 'NavBar',
})
</script>