part of firebase_service;

@Injectable()
class ConsultationService extends FirebaseServiceBase
{
  ConsultationService() : super("consultations");

  @override
  Consultation createModelInstance(String id, Map<String, dynamic> data) => data == null ? new Consultation(id) : new Consultation.decode(id, data);
}