uniform float uBigWavesElevation;
uniform vec2 uBigWavesFrequency;
uniform float uTime;
uniform float uBigWavesSpeed;

void main()
{
    // Elevation
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    float elevation = uBigWavesElevation * sin(modelPosition.x * uBigWavesFrequency.x + uBigWavesSpeed * uTime) * sin(modelPosition.z * uBigWavesFrequency.y + uBigWavesSpeed * uTime);
    modelPosition.y += elevation;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;
    gl_Position = projectedPosition;

}