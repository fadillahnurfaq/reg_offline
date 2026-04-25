import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:register_offline/cubit/draft/create_draft_cubit.dart';
import 'package:register_offline/services/member_service.dart';
import 'package:register_offline/utils/colors.dart';
import 'package:register_offline/utils/extensions/build_context_extension.dart';
import 'package:register_offline/utils/extensions/datetime_extension.dart';
import 'package:register_offline/utils/injector.dart';
import 'package:register_offline/utils/text_style.dart';
import 'package:register_offline/widgets/form.dart';

import '../../utils/dialog_helper.dart';
import '../../utils/global_func.dart';
import '../../widgets/button.dart';
import '../../widgets/dropdown.dart';

class CreateDraftView extends StatelessWidget {
  const CreateDraftView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: context.hideKeyboard,
      child: BlocProvider(
        create: (context) => CreateDraftCubit(
          memberService: locator<MemberService>()
        ),
        child: BlocListener<CreateDraftCubit, CreateDraftState>(
          listenWhen: (previous, current) => previous.isSubmitting != current.isSubmitting 
            || previous.errorMessage != current.errorMessage 
            || previous.isSuccess != current.isSuccess,
          listener: (context, state) {
            if (state.isSubmitting) {
              context.hideKeyboard();
              DialogHelper.showLoading(context);
            } else {
              context.pop();
            }

            if (state.errorMessage != null) {
              DialogHelper.showSnacbar(context: context, message: state.errorMessage!);
            }

            if (state.isSuccess == true) {
              context.pop();
            }
          },
          child: Scaffold(
            backgroundColor: AppColors.gray200,
            appBar: AppBar(title: Text('Tambah Data', style: bodyLargeBold)),
            body: Builder(
              builder: (context) {
                return ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      color: AppColors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 16.0,
                        children: [
                          Text(
                            'Data Utama',
                            style: headlineSmallBold.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: AppColors.gray200,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              spacing: 8.0,
                              children: [
                                const Icon(
                                  Icons.info,
                                  size: 28.0,
                                  color: AppColors.primary,
                                ),
                                Flexible(
                                  child: Text(
                                    "Nomor Handphone, NIK, dan Foto KTP wajib diisi sebelum di-upload",
                                    style: bodyRegular.copyWith(
                                      color: AppColors.gray700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          BlocBuilder<CreateDraftCubit, CreateDraftState>(
                            buildWhen: (previous, current) => previous.phoneNumberValidation != current.phoneNumberValidation,
                            builder: (context, state) {
                              return AppForm(
                                title: "Nomor Handphone",
                                isRequired: true,
                                controller: context.read<CreateDraftCubit>().phoneNumberController,
                                forceErrorText: state.phoneNumberValidation.errorMessage,
                                onChanged: (value) => context.read<CreateDraftCubit>().validatePhoneNumber(value),
                                keyboardType: TextInputType.phone,
                              );
                            },
                          ),
                          BlocBuilder<CreateDraftCubit, CreateDraftState>(
                            buildWhen: (previous, current) => previous.nikValidation != current.nikValidation,
                            builder: (context, state) {
                              return AppForm(
                                title: "NIK",
                                isRequired: true,
                                controller: context.read<CreateDraftCubit>().nikController,
                                forceErrorText: state.nikValidation.errorMessage,
                                onChanged: (value) => context.read<CreateDraftCubit>().validateNik(value),
                                keyboardType: TextInputType.number,
                                maxLength: 16,
                                showCounterText: false,
                              );
                            },
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 6.0,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Foto KTP",
                                  style: bodyBold,
                                  children: [
                                    TextSpan(
                                      text: "*",
                                      style: bodyBold.copyWith(
                                        color: AppColors.red,
                                        fontWeight: semiBold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "Ambil 2 foto KTP untuk hasil yang lebih baik. Pastikan KTP terlihat jelas dan tidak blur.",
                                style: bodyRegular,
                              ),
                              Row(
                                spacing: 16.0,
                                children: [
                                  Expanded(
                                    child: BlocBuilder<CreateDraftCubit, CreateDraftState>(
                                          buildWhen: (previous, current) => previous.primaryIndentityPhoto != current.primaryIndentityPhoto,
                                          builder: (context, state) {
                                            return GestureDetector(
                                              behavior: HitTestBehavior.translucent,
                                              onTap: () async {
                                                final ImagePicker picker = ImagePicker();
                                                final XFile? photo = await picker.pickImage(
                                                  source:ImageSource.camera,
                                                  imageQuality: 30
                                                );
                                                if (photo != null) {
                                                  context.read<CreateDraftCubit>().setPrimaryIdentityPhoto(
                                                    File(photo.path),
                                                  );
                                                }
                                              },
                                              child: Container(
                                                height: 100.h,
                                                padding: const EdgeInsets.all(
                                                  10.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(
                                                    8.0,
                                                  ),
                                                  border: Border.all(
                                                    color: AppColors.gray300,
                                                  ),
                                                ),
                                                child: state.primaryIndentityPhoto != null
                                                    ? Image.file(
                                                        width: double.infinity,
                                                        state
                                                            .primaryIndentityPhoto!,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : const Icon(
                                                        Icons.camera_alt,
                                                        size: 40.0,
                                                        color: AppColors.gray700,
                                                      ),
                                              ),
                                            );
                                          },
                                        ),
                                  ),
                                  Expanded(
                                    child: BlocBuilder<CreateDraftCubit,CreateDraftState>(
                                          buildWhen: (previous, current) => previous.secondaryIndentityPhoto != current.secondaryIndentityPhoto,
                                          builder: (context, state) {
                                            return GestureDetector(
                                              behavior: HitTestBehavior.translucent,
                                              onTap: () async {
                                                final ImagePicker picker = ImagePicker();
                                                final XFile? photo = await picker.pickImage(
                                                  source: ImageSource.camera,
                                                  imageQuality: 30,
                                                );
                                                if (photo != null) {
                                                  context.read<CreateDraftCubit>().setSecondaryIdentityPhoto(
                                                    File(photo.path),
                                                  );
                                                }
                                              },
                                              child: Container(
                                                height: 100.h,
                                                padding: const EdgeInsets.all(
                                                  10.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(
                                                    8.0,
                                                  ),
                                                  border: Border.all(
                                                    color: AppColors.gray300,
                                                  ),
                                                ),
                                                child:state.secondaryIndentityPhoto != null
                                                    ? Image.file(
                                                        width: double.infinity,
                                                        state
                                                            .secondaryIndentityPhoto!,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : const Icon(
                                                        Icons.camera_alt,
                                                        size: 40.0,
                                                        color:
                                                            AppColors.gray700,
                                                      ),
                                              ),
                                            );
                                          },
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      color: AppColors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 16.0,
                        children: [
                          Text(
                            'Informasi Lainnya',
                            style: headlineSmallBold.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          AppForm(
                            title: "Nama Lengkap",
                            controller: context.read<CreateDraftCubit>().fullNameController,
                          ),
                          AppForm(
                            title: "Tempat Lahir",
                            controller: context.read<CreateDraftCubit>().placeOfBirthController,
                          ),
                          BlocBuilder<CreateDraftCubit, CreateDraftState>(
                            buildWhen: (previous, current) => previous.dateOfBirth != current.dateOfBirth,
                            builder: (context, state) {
                              return AppForm(
                                title: "Tanggal Lahir",
                                isReadOnly: true,
                                suffixIcon: const Icon(
                                  Icons.calendar_month,
                                  color: AppColors.gray700,
                                ),
                                controller: TextEditingController(
                                  text: state.dateOfBirth.formatDate(
                                    pattern: "dd MMMM yyyy",
                                  ),
                                ),
                                onTap: () {
                                  GlobalFunc.pickDate(
                                    context: context,
                                    selectedDate: state.dateOfBirth,
                                    onDateSelected: (date) => context.read<CreateDraftCubit>().setDateOfBirth(date),
                                  );
                                },
                              );
                            },
                          ),
                          BlocBuilder<CreateDraftCubit, CreateDraftState>(
                            buildWhen: (previous, current) =>
                                previous.gender != current.gender,
                            builder: (context, state) {
                              return AppForm(
                                title: "Jenis Kelamin",
                                isReadOnly: true,
                                controller: TextEditingController(
                                  text: state.gender,
                                ),
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.gray700,
                                ),
                                onTap: () {
                                  AppSelect.instance.single(
                                    context: context,
                                    title: "Jenis kelamin",
                                    itemToString: (item) => item,
                                    onSelected: (item) => context.read<CreateDraftCubit>().setGender(item),
                                    dataList: context.read<CreateDraftCubit>().genderOptions,
                                    selectedData: state.gender,
                                  );
                                },
                              );
                            },
                          ),
                          BlocBuilder<CreateDraftCubit, CreateDraftState>(
                            buildWhen: (previous, current) => previous.status != current.status,
                            builder: (context, state) {
                              return AppForm(
                                title: "Status",
                                isReadOnly: true,
                                controller: TextEditingController(
                                  text: state.status,
                                ),
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.gray700,
                                ),
                                onTap: () {
                                  AppSelect.instance.single(
                                    context: context,
                                    title: "Status",
                                    itemToString: (item) => item,
                                    onSelected: (item) => context.read<CreateDraftCubit>().setStatus(item),
                                    dataList: context.read<CreateDraftCubit>().statusOptions,
                                    selectedData: state.status,
                                  );
                                },
                              );
                            },
                          ),
                          BlocBuilder<CreateDraftCubit, CreateDraftState>(
                            buildWhen: (previous, current) => previous.occupation != current.occupation,
                            builder: (context, state) {
                              return AppForm(
                                title: "Jenis Pekerjaan",
                                isReadOnly: true,
                                controller: TextEditingController(
                                  text: state.occupation,
                                ),
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.gray700,
                                ),
                                onTap: () {
                                  AppSelect.instance.single(
                                    context: context,
                                    title: "Jenis Pekerjaan",
                                    itemToString: (item) => item,
                                    onSelected: (item) => context.read<CreateDraftCubit>().setOccupation(item),
                                    dataList: context.read<CreateDraftCubit>().occupationOptions,
                                    selectedData: state.occupation,
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      color: AppColors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 16.0,
                        children: [
                          Text(
                            'Informasi Alamat Lengkap',
                            style: headlineSmallBold.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          AppForm(
                            title: "Alamat Lengkap",
                            controller: context.read<CreateDraftCubit>().addressController,
                          ),
                          BlocBuilder<CreateDraftCubit, CreateDraftState>(
                            buildWhen: (previous, current) => previous.province != current.province,
                            builder: (context, state) {
                              return AppForm(
                                title: "Provinsi",
                                isReadOnly: true,
                                controller: TextEditingController(
                                  text: state.province,
                                ),
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.gray700,
                                ),
                                onTap: () {
                                  AppSelect.instance.single(
                                    context: context,
                                    title: "Provinsi",
                                    hintSearch: "Search Provinsi",
                                    itemToString: (item) => item,
                                    onSelected: (item) => context.read<CreateDraftCubit>().setProvince(item),
                                    dataList: context.read<CreateDraftCubit>().provinceOptions,
                                    selectedData: state.province,
                                  );
                                },
                              );
                            },
                          ),
                          BlocBuilder<CreateDraftCubit, CreateDraftState>(
                            buildWhen: (previous, current) => previous.city != current.city,
                            builder: (context, state) {
                              return AppForm(
                                title: "Kota/Kabupaten",
                                isReadOnly: true,
                                controller: TextEditingController(
                                  text: state.city,
                                ),
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.gray700,
                                ),
                                onTap: () {
                                  AppSelect.instance.single(
                                    context: context,
                                    title: "Kota/Kabupaten",
                                    hintSearch: "Search Kota/Kabupaten",
                                    itemToString: (item) => item,
                                    onSelected: (item) => context.read<CreateDraftCubit>().setCity(item),
                                    dataList: context.read<CreateDraftCubit>().cityOptions,
                                    selectedData: state.city,
                                  );
                                },
                              );
                            },
                          ),
                          BlocBuilder<CreateDraftCubit, CreateDraftState>(
                            buildWhen: (previous, current) => previous.district != current.district,
                            builder: (context, state) {
                              return AppForm(
                                title: "Kecamatan",
                                isReadOnly: true,
                                controller: TextEditingController(
                                  text: state.district,
                                ),
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.gray700,
                                ),
                                onTap: () {
                                  AppSelect.instance.single(
                                    context: context,
                                    title: "Kecamatan",
                                    hintSearch: "Search Kecamatan",
                                    itemToString: (item) => item,
                                    onSelected: (item) => context.read<CreateDraftCubit>().setDistrict(item),
                                    dataList: context.read<CreateDraftCubit>().districtOptions,
                                    selectedData: state.district,
                                  );
                                },
                              );
                            },
                          ),
                          BlocBuilder<CreateDraftCubit, CreateDraftState>(
                            buildWhen: (previous, current) => previous.subDistrict != current.subDistrict,
                            builder: (context, state) {
                              return AppForm(
                                title: "Kelurahan",
                                isReadOnly: true,
                                controller: TextEditingController(
                                  text: state.subDistrict,
                                ),
                                suffixIcon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.gray700,
                                ),
                                onTap: () {
                                  AppSelect.instance.single(
                                    context: context,
                                    title: "Kelurahan",
                                    hintSearch: "Search Kelurahan",
                                    itemToString: (item) => item,
                                    onSelected: (item) => context.read<CreateDraftCubit>().setSubDistrict(item),
                                    dataList: context.read<CreateDraftCubit>().subDistrictOptions,
                                    selectedData: state.subDistrict,
                                  );
                                },
                              );
                            },
                          ),
                          AppForm(
                            title: "Kode Pos",
                            keyboardType: TextInputType.number,
                            controller: context.read<CreateDraftCubit>().postalCodeController,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: context.bottomPadding,
                    top: 16.0,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.gray200,
                        spreadRadius: 7,
                        blurRadius: 8,
                        offset: Offset(1, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    spacing: 8.0,
                    children: [
                      BlocBuilder<CreateDraftCubit, CreateDraftState>(
                        builder: (context, state) {
                          return AppButton.filled(
                            width: double.infinity,
                            onPressed: context.read<CreateDraftCubit>().upload,
                            disabled: !context.read<CreateDraftCubit>().isEligibleToSubmit,
                            label: "Upload",
                          );
                        },
                      ),
                      BlocBuilder<CreateDraftCubit, CreateDraftState>(
                        builder: (context, state) {
                          return AppButton.outlined(
                            width: double.infinity,
                            onPressed: () {},
                            disabled: !context.read<CreateDraftCubit>().isEligibleToSubmit,
                            sideColor: AppColors.primary,
                            label: "Simpan sebagai Draft",
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
