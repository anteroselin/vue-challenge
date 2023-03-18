import Vue from 'vue';

declare module 'vue/types/vue' {
  interface Vue {
    $bvModal: {
      show: (id: string) => void;
    };
  }
}