import { NativeModules, Platform,NativeEventEmitter } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-boiler-library' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const BoilerLibrary = NativeModules.BoilerLibrary
  ? NativeModules.BoilerLibrary
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function multiply(a: number, b: number): Promise<number> {
  return BoilerLibrary.multiply(a, b);
}

export function showNativeUI() {
  return BoilerLibrary.showNativeUI()
}

export function subscribeForCloseButton(eventName: string,callback: (e: any)=>void) {
  return new NativeEventEmitter(BoilerLibrary).addListener(
    eventName,
    e => {
      if (callback != null) {
        callback(e);
      }
    }
  );
}

export function unSubscribeForCloseButton(eventName: string) {
  return new NativeEventEmitter(BoilerLibrary).removeAllListeners(eventName)
}

