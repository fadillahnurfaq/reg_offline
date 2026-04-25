import 'package:flutter/material.dart';
import 'package:register_offline/utils/extensions/build_context_extension.dart';
import 'package:register_offline/utils/text_style.dart';
import 'package:register_offline/widgets/form.dart';

import '../models/result.dart';
import '../utils/colors.dart';
import '../utils/dialog_helper.dart';

class AppSelect {
  AppSelect._();

  static final _instance = AppSelect._();

  static AppSelect get instance => _instance;

  Future<void> single<T>({
    required final BuildContext context,
    required final String title,
    required final Function(T selectedData) onSelected,
    required final String Function(T item) itemToString,
    final T? selectedData,
    final List<T>? dataList,
    final Result<List<T>> Function()? resultBuilder,
    final Widget Function(T item, bool isSelected)? itemBuilder,
    final String? hintSearch,
    final VoidCallback? onReset,
    final List<T> Function(List<T>)? onFilterList,
    final void Function()? onRetryIfFailed,
  }) async {
    return DialogHelper.showBottomSheet(
      context: context,
      content: DropdownBasedPopUp<T>(
        title: title,
        onSelected: onSelected,
        itemToString: itemToString,
        selectedData: selectedData,
        dataList: dataList,
        resultBuilder: resultBuilder,
        itemBuilder: itemBuilder,
        hintSearch: hintSearch,
        onReset: onReset,
        onFilterList: onFilterList,
        onRetryIfFailed: onRetryIfFailed,
      ),
    );
  }
}

class DropdownBasedPopUp<T> extends StatefulWidget {
  final String title;
  final Function(T data) onSelected;
  final String Function(T) itemToString;
  final T? selectedData;
  final List<T>? dataList;
  final Result<List<T>> Function()? resultBuilder;
  final String? hintSearch;
  final Widget Function(T item, bool isSelected)? itemBuilder;
  final List<T> Function(List<T>)? onFilterList;
  final void Function()? onRetryIfFailed;
  final VoidCallback? onReset;

  const DropdownBasedPopUp({
    super.key,
    required this.title,
    required this.onSelected,
    required this.itemToString,
    this.selectedData,
    this.dataList,
    this.resultBuilder,
    this.hintSearch,
    this.itemBuilder,
    this.onFilterList,
    this.onRetryIfFailed,
    this.onReset,
  });

  @override
  State<DropdownBasedPopUp<T>> createState() => _DropdownBasedPopUpState<T>();
}

class _DropdownBasedPopUpState<T> extends State<DropdownBasedPopUp<T>> {
  late final ValueNotifier<String> _keywordNotifier;

  @override
  void initState() {
    super.initState();
    _keywordNotifier = ValueNotifier('');
    
  }

  void setKeyword(String keyword) {
    _keywordNotifier.value = keyword;
  }


  List<T> _filterData({
    required String keyword,
    required List<T> dataList,
  }) {
    List<T> datas = dataList.where((v) {
      final text = widget.itemToString(v).toLowerCase();
      return text.contains(keyword.toLowerCase());
    }).toList();

    if (widget.onFilterList != null) {
      datas = widget.onFilterList!(datas);
    }

    return datas;
  }

  Widget _buildList(List<T> dataList) {
    return ValueListenableBuilder<String>(
      valueListenable: _keywordNotifier,
      builder: (_, keyword, __) {
        final filtered =
            _filterData(keyword: keyword, dataList: dataList);

        return SliverList.builder(
          itemCount: filtered.length,
          itemBuilder: (context, index) {
            final data = filtered[index];

            final text = widget.itemToString(data);
            final selectedText = widget.selectedData == null
                ? ""
                : widget.itemToString(widget.selectedData as T);

            final isSelected =
                text.toLowerCase().trim() ==
                    selectedText.toLowerCase().trim();

            return InkWell(
              onTap: () {
                context.pop();
                widget.onSelected(data);
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: widget.itemBuilder?.call(
                            data,
                            isSelected,
                          ) ??
                          Text(
                            text,
                            style: TextStyle(
                              color: isSelected
                                  ? AppColors.primary
                                  : null,
                            ),
                          ),
                    ),
                    if (isSelected)
                      const Icon(Icons.check,
                          color: AppColors.primary),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildContent() {
    /// 🔥 pakai Result
    if (widget.resultBuilder != null) {
      final result = widget.resultBuilder!.call();

      if (result.isLoading) {
        return const SliverToBoxAdapter(
          child: Center(child: CircularProgressIndicator()),
        );
      }

      if (result.isFailed) {
        return SliverToBoxAdapter(
          child: Column(
            children: [
              Text(result.errorMessage ?? ""),
              TextButton(
                onPressed: widget.onRetryIfFailed,
                child: const Text("Retry"),
              ),
            ],
          ),
        );
      }

      if (result.isEmpty) {
        return const SliverToBoxAdapter(
          child: Center(child: Text("Data kosong")),
        );
      }

      if (result.isSuccess) {
        return _buildList(result.resultValue ?? []);
      }
    }

    /// fallback static
    if (widget.dataList != null) {
      return _buildList(widget.dataList!);
    }

    return const SliverToBoxAdapter();
  }

    @override
  Widget build(BuildContext context) {
    final withReset = widget.onReset != null &&
        (widget.selectedData != null &&
            widget.itemToString(widget.selectedData as T).isNotEmpty);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: withReset ? 0 : 10,
          ),
          child: Row(
            children: [
              Expanded(child: Text(widget.title, style: bodyLargeBold,)),
              if (withReset)
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    widget.onReset?.call();
                  },
                  child: const Text("Reset"),
                )
            ],
          ),
        ),
        const Divider(),

        if (widget.hintSearch != null)
          Padding(
            padding: const EdgeInsets.all(16),
            child: AppForm(
              onChanged: setKeyword,
              hintText: widget.hintSearch,
              prefixIcon: const Icon(Icons.search),
            ),
          ),

        Flexible(
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              _buildContent(),
            ],
          ),
        ),
      ],
    );
  }
}