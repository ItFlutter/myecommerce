class CouponModel {
  String? couponId;
  String? couponName;
  String? couponCount;
  String? couponExpiredate;
  String? couponDiscount;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponCount,
      this.couponExpiredate,
      this.couponDiscount});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponCount = json['coupon_count'];
    couponExpiredate = json['coupon_expiredate'];
    couponDiscount = json['coupon_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_id'] = this.couponId;
    data['coupon_name'] = this.couponName;
    data['coupon_count'] = this.couponCount;
    data['coupon_expiredate'] = this.couponExpiredate;
    data['coupon_discount'] = this.couponDiscount;
    return data;
  }
}
