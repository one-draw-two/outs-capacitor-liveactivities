export interface CapLiveActivitiesPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
