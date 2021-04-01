
class DataSearchBranch {
  int inspirationId ;
  String inspirationName ;
  int businessId ;
  String businessName ;
  int categoryId ;
  String keywords ;
  int hotDeals ;



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.inspirationId != null)
      data['business_category_id'] = this.inspirationId;
    if(this.businessId != null)
      data['business_id'] = this.businessId;
    if(this.categoryId != null)
      data['category_id'] = this.categoryId;
    if(this.hotDeals != null)
      data['hotdeals'] = this.hotDeals;
    if(this.keywords != null)
      data['keywords'] = this.keywords;
    return data;
  }
}