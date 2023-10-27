import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import { multiply,subscribeForCloseButton,unSubscribeForCloseButton } from 'react-native-boiler-library';

export default function App() {
  const [result, setResult] = React.useState<number | undefined>();

  React.useEffect(() => {
    multiply(3, 7).then(setResult);
  }, []);

  React.useEffect(() => {
    console.log("useEffect")
   subscribeForCloseButton("event", (data) => {
      console.log("event trigered", data)
    })
    return ()=> {
      unSubscribeForCloseButton("event")
    }
  }, [])

  return (
    <View style={styles.container}>
      <Text>Result: {result}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
