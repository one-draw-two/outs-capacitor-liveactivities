import { WebPlugin } from '@capacitor/core';

import type { CapLiveActivitiesPlugin } from './definitions';

export class CapLiveActivitiesWeb extends WebPlugin implements CapLiveActivitiesPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
