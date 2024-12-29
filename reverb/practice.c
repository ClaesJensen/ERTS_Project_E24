#include <sndfile.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_SAMPLES 1302858

typedef struct
{
    float a;
    int D;
    float w[ MAX_SAMPLES ];
    float x[ MAX_SAMPLES ];
    int idx;
} allPassReverberatorSection;

typedef struct
{
    int N_allpass_filters;
    allPassReverberatorSection *reverberators;
} allpassReverberatorChain;

typedef struct
{
    float a;
    int K;
    float delay_buffer[ MAX_SAMPLES ];
    int idx;
} feedbackCombFilterSection;

typedef struct
{
    int N_comb_filters;
    feedbackCombFilterSection *comb_filters;
} feedbackCombFilterArray;

typedef struct
{
    allpassReverberatorChain allpass_reverberator;
    feedbackCombFilterArray comb_filter;
    float mix;
} reverbEffect;

void init_allPassReverberatorSection( allPassReverberatorSection *section,
                                      float a,
                                      int D )
{
    section->a = a;
    section->D = D;
    section->idx = 0;
    memset( section->w, 0, MAX_SAMPLES * sizeof( float ) );
    memset( section->x, 0, MAX_SAMPLES * sizeof( float ) );
}

void process_allPassReverberatorSection( allPassReverberatorSection *section,
                                         float *input,
                                         float *output,
                                         int input_len )
{
    for ( int n = 0; n < input_len; ++n )
    {
        int delayed_idx =
            ( section->idx - section->D + section->D ) % section->D;
        float x_n_D = section->x[ delayed_idx ];
        float w_n_D = section->w[ delayed_idx ];

        // Compute y[n] using the first equation
        float y_n = -section->a * input[ n ] + w_n_D;

        // Compute w[n] using the second equation
        float w_n = section->a * y_n + input[ n ];

        // Update the circular buffer
        section->x[ section->idx ] = input[ n ];
        section->w[ section->idx ] = w_n;

        // Store the computed value in the output
        output[ n ] = y_n;

        // Increment the circular buffer index
        section->idx = ( section->idx + 1 ) % section->D;
    }
}

void init_allpassReverberatorChain( allpassReverberatorChain *chain,
                                    float *a_values,
                                    int *D_values,
                                    int N_allpass_filters )
{
    chain->N_allpass_filters = N_allpass_filters;
    chain->reverberators = ( allPassReverberatorSection * )malloc(
        N_allpass_filters * sizeof( allPassReverberatorSection ) );

    for ( int i = 0; i < N_allpass_filters; ++i )
    {
        init_allPassReverberatorSection( &chain->reverberators[ i ],
                                         a_values[ i ],
                                         D_values[ i ] );
    }
}

void process_allpassReverberatorChain( allpassReverberatorChain *chain,
                                       float *input,
                                       float *output,
                                       int input_len )
{
    float temp_input[ MAX_SAMPLES ];
    memcpy( temp_input, input, input_len * sizeof( float ) );

    for ( int i = 0; i < chain->N_allpass_filters; ++i )
    {
        process_allPassReverberatorSection( &chain->reverberators[ i ],
                                            temp_input,
                                            output,
                                            input_len );
        memcpy( temp_input, output, input_len * sizeof( float ) );
    }
}

void init_feedbackCombFilterSection( feedbackCombFilterSection *section,
                                     float a,
                                     int K )
{
    section->a = a;
    section->K = K;
    section->idx = 0;
    memset( section->delay_buffer, 0, MAX_SAMPLES * sizeof( float ) );
}

void process_feedbackCombFilterSection( feedbackCombFilterSection *section,
                                        float *input,
                                        float *output,
                                        int input_len )
{
    for ( int n = 0; n < input_len; ++n )
    {
        float y_n_K = section->delay_buffer[ section->idx ];
        output[ n ] = input[ n ] + section->a * y_n_K;
        section->delay_buffer[ section->idx ] = output[ n ];
        section->idx = ( section->idx + 1 ) % section->K;
    }
}

void init_feedbackCombFilterArray( feedbackCombFilterArray *array,
                                   int N_comb_filters,
                                   float *a_values,
                                   int *K_values )
{
    array->N_comb_filters = N_comb_filters;
    array->comb_filters = ( feedbackCombFilterSection * )malloc(
        N_comb_filters * sizeof( feedbackCombFilterSection ) );

    for ( int i = 0; i < N_comb_filters; ++i )
    {
        init_feedbackCombFilterSection( &array->comb_filters[ i ],
                                        a_values[ i ],
                                        K_values[ i ] );
    }
}

void process_feedbackCombFilterArray( feedbackCombFilterArray *array,
                                      float *input,
                                      float *output,
                                      int input_len )
{
    float temp_output[ MAX_SAMPLES ];
    memset( temp_output, 0, input_len * sizeof( float ) );

    for ( int i = 0; i < array->N_comb_filters; ++i )
    {
        process_feedbackCombFilterSection( &array->comb_filters[ i ],
                                           input,
                                           temp_output,
                                           input_len );
        for ( int n = 0; n < input_len; ++n )
        {
            output[ n ] += temp_output[ n ];
        }
    }

    for ( int n = 0; n < input_len; ++n )
    {
        output[ n ] /= array->N_comb_filters;
    }
}

void init_reverbEffect( reverbEffect *effect,
                        float *a_values_reverberator,
                        float *a_values_comb_filter,
                        int *D_values,
                        int *K_values,
                        int N_comb_filters,
                        float mix )
{
    init_allpassReverberatorChain( &effect->allpass_reverberator,
                                   a_values_reverberator,
                                   D_values,
                                   N_comb_filters );
    init_feedbackCombFilterArray( &effect->comb_filter,
                                  N_comb_filters,
                                  a_values_comb_filter,
                                  K_values );
    effect->mix = mix;
}

void process_reverbEffect( reverbEffect *effect,
                           float *input,
                           float *output,
                           int input_len )
{
    float processed_audio[ MAX_SAMPLES ];

    process_feedbackCombFilterArray( &effect->comb_filter,
                                     input,
                                     processed_audio,
                                     input_len );
    process_allpassReverberatorChain( &effect->allpass_reverberator,
                                      processed_audio,
                                      processed_audio,
                                      input_len );

    for ( int n = 0; n < input_len; ++n )
    {
        output[ n ] = ( 1 - effect->mix ) * input[ n ]
                      + effect->mix * processed_audio[ n ];
    }
}

int main()
{
    // Allpass values
    float a_values_allpass[ 5 ] = { 0.85f, 0.85f, 0.85f, 0.85f, 0.85f };
    int D_values[ 5 ] = { 89, 131, 563, 3001, 7001 };

    // Comb values, 0.8 is chosen for a long natural sounding reverb
    float a_values_comb[ 9 ] =
        { 0.65f, 0.75f, 0.67f, 0.75f, 0.85f, 0.66f, 0.85f, 0.75f, 0.81f };
    int K_values[ 9 ] =
        { 1511, 1723, 1999, 2137, 2411, 2731, 3163, 3571, 4001 };

    // Mix percentage
    float mix = 0.5f;

    // Initialize the reverb effect
    reverbEffect effect;
    init_reverbEffect( &effect,
                       a_values_allpass,
                       a_values_comb,
                       D_values,
                       K_values,
                       9,
                       mix );

    // Open the input file
    SF_INFO sfinfo;
    SNDFILE *infile = sf_open( "kortsample.wav", SFM_READ, &sfinfo );
    if ( !infile )
    {
        printf( "Error: could not open input file kortsample.wav\n" );
        return 1;
    }

    // Allocate memory for the input and output arrays
    float *input =
        ( float * )malloc( sfinfo.frames * sfinfo.channels * sizeof( float ) );
    float *output =
        ( float * )malloc( sfinfo.frames * sfinfo.channels * sizeof( float ) );

    printf( "Number of frames in the file: %lld\n", sfinfo.frames );
    printf( "Sample rate: %d\n", sfinfo.samplerate );
    printf( "Channels: %d\n", sfinfo.channels );

    // Read the input file into the input array
    int frames_read = sf_readf_float( infile, input, sfinfo.frames );
    printf( "Frames read: %d, Expected frames: %lld\n",
            frames_read,
            sfinfo.frames );

    if ( frames_read != sfinfo.frames )
    {
        printf( "Error: failed to read enough samples from the input file.\n" );
        return 1;
    }
    if ( sf_readf_float( infile, input, sfinfo.frames ) != sfinfo.frames )
    {
        printf( "Error: failed to read enough samples from the input file.\n" );
        return 1;
    }

    sf_close( infile );

    // Process the reverb effect
    process_reverbEffect( &effect, input, output, sfinfo.frames );

    // Open the output file
    SNDFILE *outfile = sf_open( "result.wav", SFM_WRITE, &sfinfo );
    if ( !outfile )
    {
        printf( "Error: could not open output file result.wav\n" );
        return 1;
    }

    // Write the processed output to the output file
    sf_writef_float( outfile, output, sfinfo.frames );
    sf_close( outfile );

    free( input );
    free( output );

    return 0;
}
