# react-native-boiler-library

created based on study purpose

## Installation

```sh
npm install react-native-boiler-library
```

## Usage

```js
import { multiply,subscribeForCloseButton,unSubscribeForCloseButton } from 'react-native-boiler-library';

// ...

const result = await multiply(3, 7);

 React.useEffect(() => {
   subscribeForCloseButton("event", (data) => {
      console.log("event triggered", data)
    })
    return ()=> {
      unSubscribeForCloseButton("event")
    }
  }, [])

```



## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
