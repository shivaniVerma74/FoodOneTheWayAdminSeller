/// error : false
/// message : "Transactions Retrieved Successfully"
/// total : "2"
/// data : [{"id":"2844","transaction_type":"wallet","user_id":"1","order_id":null,"type":"credit","txn_id":null,"payu_txn_id":null,"amount":"449.15","status":null,"currency_code":null,"payer_email":null,"message":"Credited for Order Item ID  : 2089","transaction_date":"2022-11-18 23:14:35","date_created":"2022-11-18 23:14:35","t_date":"0000-00-00"},{"id":"1","transaction_type":"wallet","user_id":"1","order_id":"4","type":"credit","txn_id":"","payu_txn_id":null,"amount":"8","status":"success","currency_code":null,"payer_email":null,"message":"Order delivery bonus for order item ID: #4","transaction_date":"2022-07-01 18:11:03","date_created":"2022-07-01 18:11:03","t_date":"2022-11-17"}]

class GetAdminTransactionModel {
  GetAdminTransactionModel({
      bool? error, 
      String? message, 
      String? total, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _total = total;
    _data = data;
}

  GetAdminTransactionModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _total = json['total'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  String? _total;
  List<Data>? _data;
GetAdminTransactionModel copyWith({  bool? error,
  String? message,
  String? total,
  List<Data>? data,
}) => GetAdminTransactionModel(  error: error ?? _error,
  message: message ?? _message,
  total: total ?? _total,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  String? get total => _total;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    map['total'] = _total;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "2844"
/// transaction_type : "wallet"
/// user_id : "1"
/// order_id : null
/// type : "credit"
/// txn_id : null
/// payu_txn_id : null
/// amount : "449.15"
/// status : null
/// currency_code : null
/// payer_email : null
/// message : "Credited for Order Item ID  : 2089"
/// transaction_date : "2022-11-18 23:14:35"
/// date_created : "2022-11-18 23:14:35"
/// t_date : "0000-00-00"

class Data {
  Data({
      String? id, 
      String? transactionType, 
      String? userId, 
      dynamic orderId, 
      String? type, 
      dynamic txnId, 
      dynamic payuTxnId, 
      String? amount, 
      dynamic status, 
      dynamic currencyCode, 
      dynamic payerEmail, 
      String? message, 
      String? transactionDate, 
      String? dateCreated, 
      String? tDate,}){
    _id = id;
    _transactionType = transactionType;
    _userId = userId;
    _orderId = orderId;
    _type = type;
    _txnId = txnId;
    _payuTxnId = payuTxnId;
    _amount = amount;
    _status = status;
    _currencyCode = currencyCode;
    _payerEmail = payerEmail;
    _message = message;
    _transactionDate = transactionDate;
    _dateCreated = dateCreated;
    _tDate = tDate;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _transactionType = json['transaction_type'];
    _userId = json['user_id'];
    _orderId = json['order_id'];
    _type = json['type'];
    _txnId = json['txn_id'];
    _payuTxnId = json['payu_txn_id'];
    _amount = json['amount'];
    _status = json['status'];
    _currencyCode = json['currency_code'];
    _payerEmail = json['payer_email'];
    _message = json['message'];
    _transactionDate = json['transaction_date'];
    _dateCreated = json['date_created'];
    _tDate = json['t_date'];
  }
  String? _id;
  String? _transactionType;
  String? _userId;
  dynamic _orderId;
  String? _type;
  dynamic _txnId;
  dynamic _payuTxnId;
  String? _amount;
  dynamic _status;
  dynamic _currencyCode;
  dynamic _payerEmail;
  String? _message;
  String? _transactionDate;
  String? _dateCreated;
  String? _tDate;
Data copyWith({  String? id,
  String? transactionType,
  String? userId,
  dynamic orderId,
  String? type,
  dynamic txnId,
  dynamic payuTxnId,
  String? amount,
  dynamic status,
  dynamic currencyCode,
  dynamic payerEmail,
  String? message,
  String? transactionDate,
  String? dateCreated,
  String? tDate,
}) => Data(  id: id ?? _id,
  transactionType: transactionType ?? _transactionType,
  userId: userId ?? _userId,
  orderId: orderId ?? _orderId,
  type: type ?? _type,
  txnId: txnId ?? _txnId,
  payuTxnId: payuTxnId ?? _payuTxnId,
  amount: amount ?? _amount,
  status: status ?? _status,
  currencyCode: currencyCode ?? _currencyCode,
  payerEmail: payerEmail ?? _payerEmail,
  message: message ?? _message,
  transactionDate: transactionDate ?? _transactionDate,
  dateCreated: dateCreated ?? _dateCreated,
  tDate: tDate ?? _tDate,
);
  String? get id => _id;
  String? get transactionType => _transactionType;
  String? get userId => _userId;
  dynamic get orderId => _orderId;
  String? get type => _type;
  dynamic get txnId => _txnId;
  dynamic get payuTxnId => _payuTxnId;
  String? get amount => _amount;
  dynamic get status => _status;
  dynamic get currencyCode => _currencyCode;
  dynamic get payerEmail => _payerEmail;
  String? get message => _message;
  String? get transactionDate => _transactionDate;
  String? get dateCreated => _dateCreated;
  String? get tDate => _tDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['transaction_type'] = _transactionType;
    map['user_id'] = _userId;
    map['order_id'] = _orderId;
    map['type'] = _type;
    map['txn_id'] = _txnId;
    map['payu_txn_id'] = _payuTxnId;
    map['amount'] = _amount;
    map['status'] = _status;
    map['currency_code'] = _currencyCode;
    map['payer_email'] = _payerEmail;
    map['message'] = _message;
    map['transaction_date'] = _transactionDate;
    map['date_created'] = _dateCreated;
    map['t_date'] = _tDate;
    return map;
  }

}