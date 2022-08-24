<template>
<div>
<p> This is a demo dashboard </p>
<p> Our first graphql response: {{ ping }} </p>
</div>
</template>

<script>
import gql from 'graphql-tag'
export default {
  name: 'Dashboard',
  apollo: {
    ping: gql`query{
	    ping
      }
    `
  }
}
</script>

<style>
</style>
