class TPricingCalculator{
  // calculate price based on tax / shipping
  static double calculateTotalPrice(double subTotal, String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = subTotal * taxRate;
    double shippingCost = getShippingCost(location);
    double totalPrice = subTotal +taxAmount +shippingCost;
    return totalPrice;
  }

  // calculate shipping cost
static String calculateShippingCost(double subTotal , String location){
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
}
// calculate tax
static String calculateTax (double subTotal , String location ){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = subTotal * taxRate;
    return taxAmount.toStringAsFixed(2);

}

  static double getTaxRateForLocation(String location) {
    // lookup the tax rate for the given location from a tax rate database \
    // return the appropriate tax rate
    return 0.10; // taxRate of 10%
  }

  static double getShippingCost(String location) {
    // lookup the shipping cost for the given location using a shipping rate API
    // calculate the shipping cost based on various factors like distance , weight , etc
    return 100.0; // shipping cost of 100 EGP
  }

  // Sum all cart values and return total amount
// static double calculateCarTotal(CarModel cart){
// return cart.items.map((e)=> e.price).fold(0, (previousPrice , currentPrice) = > previousPrice + (currentPrice ?? 0));
// }

}