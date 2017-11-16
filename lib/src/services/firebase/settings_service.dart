part of firebase_service;

@Injectable()
class SettingsService extends FirebaseServiceBase<Settings>
{
  SettingsService() : super("settings");

  @override
  Settings createModelInstance(String id, Map<String, dynamic> data) => data == null ? new Settings(id) : new Settings.decode(id, data);
}