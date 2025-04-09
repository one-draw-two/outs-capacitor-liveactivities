# outs-capacitor-liveactivities

Very cool plugin

## Install

```bash
npm install outs-capacitor-liveactivities
npx cap sync
```

## API

<docgen-index>

* [`echo(...)`](#echo)
* [`startLiveActivity(...)`](#startliveactivity)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: { value: string; }) => Promise<{ value: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### startLiveActivity(...)

```typescript
startLiveActivity(options: { activityId: string; data: any; }) => Promise<{ started: boolean; }>
```

| Param         | Type                                            |
| ------------- | ----------------------------------------------- |
| **`options`** | <code>{ activityId: string; data: any; }</code> |

**Returns:** <code>Promise&lt;{ started: boolean; }&gt;</code>

--------------------

</docgen-api>
