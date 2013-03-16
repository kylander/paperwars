//
//  RandomMath.h
//  paperwars
//
//  Created by Tim Wood on 2/23/13.
//
//

#ifndef paperwars_RandomMath_h
#define paperwars_RandomMath_h


#include <stdlib.h>
#include <math.h>



#define M_TAU     M_PI * 2.0f
#define M_TAU_2   M_PI
#define M_TAU_4   M_PI_2
#define M_TAU_8   M_PI_4
#define M_TAU_16  M_PI_4 * 0.5f
#define M_TAU_32  M_PI_4 * 0.25f


static __inline__ float FloatLerp(float start, float end, float t) {
    return start + ((end - start) * t);
}

static __inline__ float FloatRandom() {
    return ((arc4random() / (float) 0xffffffff));
}

static __inline__ float FloatRandomBetween(float start, float end) {
    return FloatLerp(start, end, FloatRandom());
}

static __inline__ float FloatPercentBetween(float start, float end, float center) {
    return (center - start) / (end - start);
}

static __inline__ float FloatClampZeroOne(float t) {
    return fminf(1.0f, fmaxf(0.0f, t));
}

static __inline__ float FloatLerpEaseOut(float start, float end, float t) {
    float ts = t * t;
	float tc = ts * t;
    float diff = end - start;
	return start + diff * (tc * ts + -5.0f * ts * ts + 10.0f * tc + -10.0f * ts + 5.0f * t);
}

static __inline__ float FloatLerpEaseIn(float start, float end, float t) {
    float ts = t * t;
	float tc = ts * t;
    float diff = end - start;
	return start + diff * (tc * ts);
}

static __inline__ float FloatLerpEaseInOut(float start, float end, float t) {
    float ts = t * t;
	float tc = ts * t;
    float diff = end - start;
	return start + diff * (6.0f * tc * ts + -15.0f * ts * ts + 10.0f * tc);
}

static __inline__ float FloatLerpBackInOut(float start, float end, float t) {
    float ts = t * t;
	float tc = ts * t;
    float diff = end - start;
	return start + diff * (1.77f * tc * ts + -1.77f * ts * ts + -4.0f * tc + 6.0f * ts - 1.0f * t);
}

static __inline__ float FloatModBetween(float num, float lower, float upper) {
    float diff = upper - lower;
    if (num > 0.0f) {
        return fmodf(num + lower, diff) - lower;
    } else {
        return fmodf(num - lower, diff) + lower;
    }
}

static __inline__ float FloatCloserToZero(float a, float b) {
    if (a < 0.0f) {
        return fmaxf(a, b);
    } else {
        return fminf(a, b);
    }
}

static __inline__ float FloatSign(float x) {
    if (x > 0) {
        return 1;
    }
    if (x < 0) {
        return -1;
    }
    return 0;
}


#endif
