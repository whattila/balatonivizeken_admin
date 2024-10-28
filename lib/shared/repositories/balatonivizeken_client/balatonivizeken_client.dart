import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../features/authentication/login/models/login.model.dart';
import '../../../features/authentication/register/models/registration.model.dart';
import '../../../features/boat/detail/models/boat.model.dart';
import '../../../features/boat/list/models/boat.header.dart';
import '../../../features/no_go_zone/models/input/no_go_zone_input.dto.dart';
import '../../../features/no_go_zone/models/no_go_zone.dart';
import '../../../features/storm/models/storm_input.dart';
import '../../../features/users/detail/models/user_info.model.dart';
import '../../../features/users/list/models/user.header.dart';
import '../user_storage/models/user.model.dart';

part 'balatonivizeken_client.g.dart';

@RestApi(baseUrl: 'http://127.0.0.1:3000')
abstract class BalatoniVizekenClient {
  factory BalatoniVizekenClient(Dio dio, {String? baseUrl}) = _BalatoniVizekenClient;

  @GET('/user')
  Future<List<UserHeaderDto>> getAllUsers();

  @GET('/user/{id}')
  Future<UserInfoDto> getUser({
    @Path() required String id,
  });

  @GET('/boat/headers')
  Future<List<BoatHeaderDto>> getBoatHeaders();

  @GET('/boat/by-boat-id/{id}')
  Future<BoatDto> getBoatById({
    @Path() required String id,
  });

  @POST('/auth/login')
  Future<UserDto> login({
    @Body() required LoginDto loginDto,
  });

  @POST('/auth/register')
  Future<UserDto> register({
    @Body() required RegistrationDto registrationDto,
  });

  @POST('/storm/new')
  Future<void> createStorm({
    @Body() required StormInputDto stormInputDto
  });
  
  @POST('/zone/update')
  Future<NoGoZone> createOrUpdateNoGoZone({
    @Body() required NoGoZoneInputDto noGoZoneInputDto
  });

  @GET('/zone')
  Future<List<NoGoZone>> getNoGoZones();
  
  @DELETE('/zone/delete/{id}')
  Future<void> deleteNoGoZone({
    @Path() required String id
  });
}