<script setup lang="ts">
import AppHeader from '@/components/app/AppHeader.vue';
import { IonPage, IonHeader, IonToolbar, IonTitle, IonContent } from '@ionic/vue';
import ExploreContainer from '@/components/ExploreContainer.vue';
</script>
<template>
    <ion-page>
        <AppHeader title="Fil d'actualité"></AppHeader>
        <ion-content :fullscreen="true">
            <ion-header collapse="condense">
                <ion-toolbar>
                    <ion-title size="large">Tab 1</ion-title>
                </ion-toolbar>
            </ion-header>

            <ExploreContainer name="Tab 1 page" />
        </ion-content>
    </ion-page>
</template>
