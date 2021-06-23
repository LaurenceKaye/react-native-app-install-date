import { NativeModules } from 'react-native';

type AppInstallDateType = {
  getInstallDateTime(format: string): Promise<string>;
  getUpdateDateTime(format: string): Promise<string>;
};

const { AppInstallDate } = NativeModules;

export default AppInstallDate as AppInstallDateType;
