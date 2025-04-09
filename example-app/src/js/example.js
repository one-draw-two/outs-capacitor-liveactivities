import { CapLiveActivities } from 'outs-capacitor-liveactivities';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    CapLiveActivities.echo({ value: inputValue })
}

window.startLiveActivity = async () => {
    console.log('Praw')
    try {
        const result = await CapLiveActivities.startLiveActivity({
            activityId: 'your-activity-id',
            data: {
                // Your activity data
                title: 'Activity Title',
                content: 'Activity Content'
            }
        });
        
        console.log('Live Activity started:', result.started);
    } catch (error) {
        console.error('Failed to start Live Activity:', error);
    }
}