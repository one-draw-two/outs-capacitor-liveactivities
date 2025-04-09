export interface CapLiveActivitiesPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  startLiveActivity(options: { activityId: string; data: any }): Promise<{ started: boolean }>;
}
