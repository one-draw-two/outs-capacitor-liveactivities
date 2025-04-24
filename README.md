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
* [`getLogs()`](#getlogs)
* [`clearLogs()`](#clearlogs)

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
startLiveActivity(options?: { testString?: string | undefined; } | undefined) => Promise<{ started: boolean; }>
```

| Param         | Type                                  |
| ------------- | ------------------------------------- |
| **`options`** | <code>{ testString?: string; }</code> |

**Returns:** <code>Promise&lt;{ started: boolean; }&gt;</code>

--------------------


### getLogs()

```typescript
getLogs() => Promise<{ logs: string; }>
```

**Returns:** <code>Promise&lt;{ logs: string; }&gt;</code>

--------------------


### clearLogs()

```typescript
clearLogs() => Promise<{ cleared: boolean; }>
```

**Returns:** <code>Promise&lt;{ cleared: boolean; }&gt;</code>

--------------------

</docgen-api>
