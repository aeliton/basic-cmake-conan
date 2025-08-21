#include "brokenmath/brokenmath.h"
#include <gtest/gtest.h>

TEST(BM, SumWorks) { ASSERT_EQ(bm::sum(1, 2), 3); }
