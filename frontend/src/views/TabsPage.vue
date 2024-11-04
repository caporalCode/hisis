<template>
  <ion-page>
    <ion-tabs>
      <ion-router-outlet></ion-router-outlet>
      <ion-tab-bar slot="bottom">
        <ion-tab-button tab="home" href="/tabs/home">
          <ion-icon aria-hidden="true" :icon="home" />
          <ion-label>Home</ion-label>
        </ion-tab-button>

        <ion-tab-button tab="search" href="/tabs/search">
          <ion-icon aria-hidden="true" :icon="search" />
          <ion-label>Search</ion-label>
        </ion-tab-button>

        <ion-tab-button tab="saved" href="/tabs/saved">
          <ion-icon aria-hidden="true" :icon="bookmark" />
          <ion-label>Saved</ion-label>
        </ion-tab-button>
      </ion-tab-bar>
    </ion-tabs>
  </ion-page>
</template>

<script setup lang="ts">
import { IonTabBar, IonTabButton, IonTabs, IonLabel, IonIcon, IonPage, IonRouterOutlet } from '@ionic/vue';
import { home, search, bookmark } from 'ionicons/icons';
</script>
