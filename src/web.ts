import { WebPlugin } from '@capacitor/core';

import type { CapLiveActivitiesPlugin } from './definitions';

export class CapLiveActivitiesWeb extends WebPlugin implements CapLiveActivitiesPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }

  async startLiveActivity(options?: { testString?: string }): Promise<{ started: boolean }> {
    console.warn('Live Activities are not supported in web environment');
    if (options?.testString) console.log('Test string:', options.testString);
    return { started: false };
  }

  async getLogs(): Promise<{ logs: string }> {
    console.warn('Logs are not available in web environment');
    return { logs: 'Logs are only available on native devices' };
  }

  async clearLogs(): Promise<{ cleared: boolean }> {
    console.warn('Logs are not available in web environment');
    return { cleared: false };
  }
}
