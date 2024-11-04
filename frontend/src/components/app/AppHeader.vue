<script setup lang="ts">
import { IonTitle, IonToolbar, IonButtons, IonMenuButton } from '@ionic/vue';
import { notificationsSharp, search } from "ionicons/icons";
const props = defineProps({
    title: String
})
</script>

<template>
    <ion-header :translucent="true">
        <ion-toolbar>
            <ion-buttons slot="start">
                <ion-menu-button :auto-hide="false"></ion-menu-button>
            </ion-buttons>
            <ion-title>{{ props.title }}</ion-title>
            <ion-buttons slot="end">
                <ion-button>
                    <ion-icon slot="icon-only" :icon="search" size="large"></ion-icon>
                </ion-button>
                <ion-button>
                    <ion-icon slot="icon-only" :icon="notificationsSharp" size="large"></ion-icon>
                </ion-button>
            </ion-buttons>
        </ion-toolbar>
    </ion-header>
</template>
<style scoped></style>