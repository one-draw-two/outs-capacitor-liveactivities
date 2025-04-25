export interface CapLiveActivitiesPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  startLiveActivity(options?: { testString?: string }): Promise<{ started: boolean }>;
}
