
#ifndef FILTER_AUDIO
#define FILTER_AUDIO

#include <stdint.h>

#ifndef _FILTER_AUDIO
typedef struct Filter_Audio Filter_Audio;
#endif


Filter_Audio *new_filter_audio(uint32_t fs);

void kill_filter_audio(Filter_Audio *f_a);

int filter_audio(Filter_Audio *f_a, int16_t *data, unsigned int samples);

/* Give the audio output from your software to this function so it knows what echo to cancel from the frame */
int pass_audio_output(Filter_Audio *f_a, const int16_t *data, unsigned int samples);

/* Tell the echo canceller how much time in ms it takes for audio to be played and recorded back after. */
int set_echo_delay_ms(Filter_Audio *f_a, int16_t msInSndCardBuf);
#endif
