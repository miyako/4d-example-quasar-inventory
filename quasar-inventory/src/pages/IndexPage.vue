<template>
  <q-page class="bg-grey-3 column">
        <q-list dense>
      <q-item 
        v-for="(item,index) in items"
        :key="item.title">
        <q-item-section>
          <q-item-label>{{ item.title }}</q-item-label>
        </q-item-section>
        <q-item-section>
          <q-input
            v-on:change="setCount(index)"
            class="col"
            square
            v-model.number="item.count"
            filled
            bg-color="white"
            style="max-width: 200px"
            >
            <template v-slot:append>
              <q-btn 
                @click.stop="addCount(index)"
                round 
                dense 
                flat 
                icon="add" />
              <q-btn 
                @click.stop="removeCount(index)"
                round 
                dense 
                flat 
                icon="remove" />
            </template>
          </q-input>
        </q-item-section>
      </q-item>
    </q-list>
  </q-page>
</template>

<script>
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'IndexPage',

  data() {
    return {
      items: [
        {
          title: '商品1',
          count: 10
        },
        {
          title: '商品2',
          count: 20
        },
        {
          title: '商品3',
          count: 30
        }
      ]
    }
  },

  methods: {
    addCount(index) {
      this.items[index].count++
    },
    removeCount(index) {
      this.items[index].count--
    },
    setCount(index) {
      console.log(this.items[index].count)
    }
  } 
})
</script>
