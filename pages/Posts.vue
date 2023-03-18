<template>
  <div>
    <b-container class="my-4">
      <b-form-input
        v-model="searchQuery"
        type="text"
        placeholder="Search posts by title"
      ></b-form-input>
      <b-table
        striped
        hover
        :items="filteredPosts"
        :fields="postFields"
        @row-clicked="showUser"
      ></b-table>
    </b-container>
    <b-modal 
      :id="modalId"
      title="modalTitle"
      hide-footer
      centered
      header-bg-variant="dark"
      header-text-variant="light"
    >
      <p>Name: {{ modalContent.name }}</p>
      <p>Username: {{ modalContent.username }}</p>
      <p>Email: {{ modalContent.email }}</p>
      <p>Phone: {{ modalContent.phone }}</p>
      <p>Website: {{ modalContent.website }}</p>
    </b-modal>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

interface IPost {
  userId: number;
  id: number;
  title: string;
  body: string;
}

interface IUser {
  id: number;
  name: string;
  username: string;
  email: string;
  phone: string;
  website: string;
}

export default Vue.extend({
  data() {
    return {
      searchQuery: '',
      posts: [] as IPost[],
      postFields: ['title', 'body'],
      modalId: 'user-modal',
      modalTitle: '',
      modalContent: {} as IUser,
    };
  },
  computed: {
    filteredPosts(): IPost[] {
      return this.posts.filter((post: IPost) =>
        post.title.toLocaleLowerCase().includes(this.searchQuery.toLocaleLowerCase())
      );
    },
  },
  async mounted() {
    try {
      const response = await this.$axios.get<IPost[]>(
        "https://jsonplaceholder.typicode.com/posts"
      );
      this.posts = response.data;
    } catch (error) {
      console.log(error);
    }
  },
  methods: {
    async showUser (item: IPost) {
      try {
        const response = await this.$axios.get<IUser>(
          `https://jsonplaceholder.typicode.com/users/${item.userId}`
        );
        const user = response.data;
        this.modalTitle = 'Details';
        this.modalContent = user;
        this.$bvModal.show(this.modalId);
      } catch (error) {
        console.log(error);
      }
    }
  }
})
</script>