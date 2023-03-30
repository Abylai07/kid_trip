import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppUtils {
  static MaskTextInputFormatter phoneMaskFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static MaskTextInputFormatter iinMaskFormatter = MaskTextInputFormatter(
    mask: '###### ######',
    filter: {"#": RegExp(r'[0-9]')},
  );
  static MaskTextInputFormatter textMaskFormatter = MaskTextInputFormatter();

  static MaskTextInputFormatter dateMaskFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static MaskTextInputFormatter yearMaskFormatter = MaskTextInputFormatter(
    mask: '####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static MaskTextInputFormatter carNumberMaskFormatter = MaskTextInputFormatter(
    mask: '###/@@@/##',
    filter: {"#": RegExp(r'[0-9]'), "@" : RegExp(r"^[a-zA-Z]")},
  );

  static MaskTextInputFormatter timeMaskFormatter = MaskTextInputFormatter(
    mask: '##:##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static MaskTextInputFormatter amountMaskFormatter = MaskTextInputFormatter(
    mask: '# ### ### ### ###',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static String? phoneValidation(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.length < 11) {
      return 'Введите корректный номер телефона';
    } else {
      return null;
    }
  }


  static String? textValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите корректный текст';
    } else {
      return null;
    }
  }

  static String? emailValidate(String? value) {
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value == null || !regExp.hasMatch(value)) {
      return 'Введите корректный e-mail';
    } else {
      return null;
    }
  }

  static String getFormattedDate(String date) {
    /// Convert into local date format.
    var localDate = DateTime.parse(date).toLocal();

    /// inputFormat - format getting from api or other func.
    /// e.g If 2021-05-27 9:34:12.781341 then format should be yyyy-MM-dd HH:mm
    /// If 27/05/2021 9:34:12.781341 then format should be dd/MM/yyyy HH:mm
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(localDate.toString());

    /// outputFormat - convert into format you want to show.
    var outputFormat = DateFormat('dd/MM/yyyy');
    var outputDate = outputFormat.format(inputDate);

    return outputDate.toString();
  }

  static String formatPrice(dynamic price, {String? currency}) {
    if (price == null) return '';
    return '$price ${currency ?? 'KZT'}';
  }
}
