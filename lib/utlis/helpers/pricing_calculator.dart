class TPricingCalculator{
  // calculate price based on tax / shipping
  static double calculateTotalPrice(double productPrice, String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice +taxAmount +shippingCost;
    return totalPrice;
  }

  // calculate shipping cost
static String calculateShippingCost(double productPrice , String location){
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
}
// calculate tax
static String calculateTax (double productPrice , String location ){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);

}

  static double getTaxRateForLocation(String location) {
    // lokup the tax rate for the given location from a tax rate database \
    // return the appropriate tax rate
    return 0.10; // taxRate of 10%
  }

  static double getShippingCost(String location) {
    // lokup the shipping cost for the given location using a shipping rate API
    // calculate the shipping cost based on various factors like distance , weight , etc
    return 50; // shipping cost of 50 EGP
  }

  // Sum all cart values and return total amount
// static double calculateCarTotal(CarModel cart){
// return cart.items.map((e)=> e.price).fold(0, (previousPrice , currentPrice) = > previousPrice + (currentPrice ?? 0));
// }

}