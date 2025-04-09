import { registerPlugin } from '@capacitor/core';

import type { CapLiveActivitiesPlugin } from './definitions';

const CapLiveActivities = registerPlugin<CapLiveActivitiesPlugin>('CapLiveActivities', {
  web: () => import('./web').then((m) => new m.CapLiveActivitiesWeb()),
});

export * from './definitions';
export { CapLiveActivities };
