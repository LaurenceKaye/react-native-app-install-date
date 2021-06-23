import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import AppInstallDate from 'react-native-app-install-date';

export default function App() {
  const [installResult, setInstallResult] = React.useState<string | undefined>();
  const [updateResult, setUpdateResult] = React.useState<string | undefined>();

  React.useEffect(() => {
    AppInstallDate.getInstallDateTime('yyyy/MM/dd hh:mm:ss').then(setInstallResult);
    AppInstallDate.getUpdateDateTime('yyyy/MM/dd hh:mm:ss').then(setUpdateResult);
  }, []);

  return (
    <View style={styles.container}>
      <Text>Installed: {installResult}</Text>
      <Text>Updated: {updateResult}</Text>
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
