<template>
  <div>
    <b-container class="my-4">
      <b-form-input
        v-model="searchQuery"
        type="text"
        placeholder="Search todos by title"
      ></b-form-input>
      <b-table
        striped
        hover
        :items="filteredTodos"
        :fields="todoFields"
        @row-clicked="showUser"
      >
        <template #cell(completed)="data">
          <input type="checkbox" :checked="data.item.completed" disabled />
        </template>
      </b-table>
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

interface ITodo {
  userId: number;
  id: number;
  title: string;
  completed: boolean;
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
      todos: [] as ITodo[],
      todoFields: ['title', 'completed'],
      modalId: 'user-modal',
      modalTitle: '',
      modalContent: {} as IUser,
    };
  },
  computed: {
    filteredTodos(): ITodo[] {
      return this.todos.filter((todo: ITodo) =>
        todo.title.toLocaleLowerCase().includes(this.searchQuery.toLocaleLowerCase())
      );
    },
  },
  async mounted() {
    try { 
      const response = await this.$axios.get<ITodo[]>(
        'https://jsonplaceholder.typicode.com/todos'
      );
      this.todos = response.data as ITodo[];
    } catch (error) {console.log(error)}
  },
  methods: {
    async showUser(item: ITodo) {
      try {
        const response = await this.$axios.get<IUser>(
          `https://jsonplaceholder.typicode.com/users/${item.userId}`
        );
        const user = response.data as IUser;
        this.modalTitle = 'Details';
        this.modalContent = user;
        this.$bvModal.show(this.modalId);
      } catch (error) {
        console.error(error);
      }
    },
  }
})
</script>