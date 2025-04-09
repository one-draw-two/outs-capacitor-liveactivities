import { WebPlugin } from '@capacitor/core';

import type { CapLiveActivitiesPlugin } from './definitions';

export class CapLiveActivitiesWeb extends WebPlugin implements CapLiveActivitiesPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
  async startLiveActivity(options: { activityId: string; data: any }): Promise<{ started: boolean }> {
    console.warn('Live Activities are not supported in web environment');
    console.log(options);
    return { started: false };
  }
}
