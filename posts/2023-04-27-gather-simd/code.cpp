#include <arm_neon.h>
#include <array>
#include <algorithm>
#include <numeric>
#include <fmt/ranges.h>
#include <vector>

union alignas(16) u32x4_union
{
  uint32x4_t              reg128i;
  std::array<unsigned, 4> u32x4;
};

union alignas(16) f32x4_union
{
  float32x4_t          reg128;
  std::array<float, 4> f32x4;
};

int main()
{
  f32x4_union res_vec;
  size_t      size = 1 << 27;
  fmt::print("size: {}\n", size);

  std::vector<float>    buf(size, 1.0);
  std::vector<float>    x(size, 1.0);
  std::vector<unsigned> idx(size, 1.0);

  //random fill to x vector
  std::iota(x.begin(), x.end(), 0);

  //random fill to idx vector
  std::iota(idx.begin(), idx.end(), 0);
  std::random_shuffle(idx.begin(), idx.end());

  alignas(16) std::array<float, 4> tmp;
  alignas(16) std::array<float, 4> values;

  uint32x4_t  idx_vec;
  float32x4_t x_vec;
  //timer start
  //timer start 
  for(size_t i = 0; i < size; i += 4)
  {
    res_vec.f32x4[0] = x[idx[i]];
    res_vec.f32x4[1] = x[idx[i + 1]];
    res_vec.f32x4[2] = x[idx[i + 2]];
    res_vec.f32x4[3] = x[idx[i + 3]];
    vst1q_f32(&buf[i], res_vec.reg128);
  }
  //timer end


  for(size_t i = 0; i < size; i += 4)
  {
    tmp[0] = x[idx[i]];
    tmp[1] = x[idx[i + 1]];
    tmp[2] = x[idx[i + 2]];
    tmp[3] = x[idx[i + 3]];

    float32x4_t tmp_vec = vld1q_f32(tmp.data());    // a bit cost
    vst1q_f32(&buf[i], tmp_vec);
  }


  for(size_t i = 0; i < size; i += 4)
  {
    idx_vec = vld1q_u32(&idx[i]);
    x_vec   = vsetq_lane_f32(x[vgetq_lane_u32(idx_vec, 0)], x_vec, 0);
    x_vec   = vsetq_lane_f32(x[vgetq_lane_u32(idx_vec, 1)], x_vec, 1);
    x_vec   = vsetq_lane_f32(x[vgetq_lane_u32(idx_vec, 2)], x_vec, 2);
    x_vec   = vsetq_lane_f32(x[vgetq_lane_u32(idx_vec, 3)], x_vec, 3);
    vst1q_f32(&buf[i], x_vec);
  }

  for(size_t i = 0; i < size; i += 4)
  {
    uint32x4_t idx_vec = vld1q_u32(&idx[i]);

    values[0] = x[vgetq_lane_u32(idx_vec, 0)];
    values[1] = x[vgetq_lane_u32(idx_vec, 1)];
    values[2] = x[vgetq_lane_u32(idx_vec, 2)];
    values[3] = x[vgetq_lane_u32(idx_vec, 3)];

    float32x4_t x_vec = vld1q_f32(values.data());
    vst1q_f32(&buf[i], x_vec);
  }
}