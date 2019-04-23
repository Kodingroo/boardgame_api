<template>
  <article>
    <section v-for="(g, index) in pageOffset" :key="index">
      <img :src="'https://picsum.photos/400/400?image='+index" alt="">
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
        Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
        nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
        reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
        Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
        officia deserunt mollit anim id est laborum.</p>
      </section>
      <footer>
        <div ref="infinitescrolltrigger" id="scroll-trigger"></div>
        <div class="circle-loader"></div>
      </footer>
    </article>
  </template>

  <script>
  export default {
    data: () => {
      return {
        currentPage: 1,
        maxPerPage: 5,
        totalResults: 100,
        showloader: false
      }
    },
    computed: {
      pageCount()  {
        return Math.ceil(this.totalResults/this.maxPerPage)
      },
      pageOffset() {
        return this.maxPerPage * this.currentPage
      }
    },
    methods: {
      scrollTrigger() {
        const observer = new IntersectionObserver((entries) => {
          entries.forEach(entry => {
            if(entry.intersectionRatio > 0 && this.currentPage < this.pageCount) {
              this.showloader = true
              setTimeout(() => {
                this.currentPage += 1
                this.showloader = false
              }, 2000)
            }
          })
        })
        observer.observe(this.$refs.infinitescrolltrigger)
      }
    },
    mounted() {
      this.scrollTrigger()
    }
  }
  </script>

  <style lang="scss" scoped>
  article {
    margin: 0 auto;
    width: 400px;

    section {
      width: 400px;
      margin-bottom: 20px;
      border-radius: 10px;
      background-color: white;
      color: pink;
      overflow:hidden;

      p {
        margin: 0;
        padding: 10px 20px;
      }
    }

    footer {
      position: relative;
      width: 400px;

      #scroll-trigger {
        height: 50px;
      }

      .circle-loader {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 50px;
        height: 50px;
        border-radius: 50%;
        border: 5px solid rgba(255, 255, 255, .2);
        border-top: 5px solid white;
        animation: animate 1.5s infinite linear;
      }
    }
  }

  @keyframes animate {
    0% {
      transform: translate(-50%,-50%) rotate(0deg);
    }
    100% {
      transform: translate(-50%,-50%) rotate(360deg);
    }
  }
  </style>
