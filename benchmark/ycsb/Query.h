//
// Created by Yi Lu on 7/19/18.
//

#pragma once

#include "benchmark/ycsb/Context.h"
#include "benchmark/ycsb/Random.h"
#include "common/Zipf.h"
#include "const.h"

namespace star {
namespace ycsb {

template <std::size_t N> struct YCSBQuery {
  int32_t Y_KEY[N];
  bool UPDATE[N];
};

template <std::size_t N> class makeYCSBQuery {
public:
  YCSBQuery<N> operator()(const Context &context, uint32_t partitionID,
                          Random &random) const {

    YCSBQuery<N> query;
    for (auto i = 0u; i < N; i++) {
      query.UPDATE[i] = true;

      int32_t key;

      // generate a key in a partition
      bool retry;
      do {
        retry = false;

        key = random.uniform_dist(
              0, static_cast<int>(context.keysPerPartition) - 1);

        query.Y_KEY[i] = context.getGlobalKeyID(key, partitionID);

        for (auto k = 0u; k < i; k++) {
          if (query.Y_KEY[k] == query.Y_KEY[i]) {
            retry = true;
            break;
          }
        }
      } while (retry);
    }
    return query;
  }
};

template <std::size_t N> class makeYCSBQueryRead {
public:
    YCSBQuery<N> operator()(const Context &context, uint32_t partitionID,
                          Random &random) const {

    YCSBQuery<N> query;
    for (auto i = 0u; i < N; i++) {
      query.UPDATE[i] = false;

      int32_t key;

      // generate a key in a partition
      bool retry;
      do {
        retry = false;

        key = random.uniform_dist(
              0, static_cast<int>(context.keysPerPartition) - 1);

        query.Y_KEY[i] = context.getGlobalKeyID(key, partitionID);

        for (auto k = 0u; k < i; k++) {
          if (query.Y_KEY[k] == query.Y_KEY[i]) {
            retry = true;
            break;
          }
        }
      } while (retry);
    }
    return query;
  }
};
} // namespace ycsb
} // namespace star
