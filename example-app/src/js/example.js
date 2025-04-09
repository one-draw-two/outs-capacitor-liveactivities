import { CapLiveActivities } from 'outs-capacitor-liveactivities';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    CapLiveActivities.echo({ value: inputValue })
}
