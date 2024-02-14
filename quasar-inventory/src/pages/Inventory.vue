<template>
  <q-page class="bg-grey-3 column">
        <q-list dense>
      <q-item 
        v-for="(item,index) in items"
        :key="item.name">
        <q-item-section>
          <q-item-label>{{ item.name }}</q-item-label>
        </q-item-section>
        <q-item-section>
          <q-input
            v-on:change="setCount(index)"
            type="tel"
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
  name: 'Inventory',

  data() {
    return {
      connection: null,
      items: []
    }
  },

  methods: {
    addCount(index) {
      this.items[index].count++;
      this.setCount(index);
    },
    removeCount(index) {
      this.items[index].count--;
      this.setCount(index);
    },
    setCount(index) {
      if(this.connection != null) {
        let item = this.items[index];
        this.connection.send(JSON.stringify({action:"setCount", Id: item.Id, count: item.count}));
      }
    }

  },

  created: function() {

    let hostname = window.location.hostname;
    this.connection = new WebSocket("ws://"+hostname+"/inventory")

    let that = this;

    this.connection.onmessage = function(event) {
      let data = JSON.parse(event.data);
      if(data.inventory != null) {
        that.items = data.inventory;
      }
      if(data.item != null) {
        let Id = data.item.Id;
        let found = that.items.find(obj => {
          return obj.Id === Id
        })
        if(found != null) {
          found.count = data.item.count;
        }
      }
    }

    this.connection.onopen = function(event) {

    }    

  }

})
</script>
