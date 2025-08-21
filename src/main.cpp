#include "brokenmath/brokenmath.h"
#include <print>
#include <spdlog/spdlog.h>

int main() {
  const int result = bm::sum(1, 2);
  spdlog::info("log: the sum of 1 and 2 is {}", result);
  std::println("{}", result);
  return 0;
}
