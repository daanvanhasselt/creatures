float agitation = 0;
 
void setup() {
}
 
void setAgitation(float newAgitation) {
    agitation = newAgitation;
}
 
void draw() {
    background(0);
    stroke(255);
    noFill();
    
    float phase = frameCount * 0.025;
    float phaseAddition = map(sin(phase), -1, 1, 0, 0.75);
    for(int i = 0; i < 10; i++){
        float x = sin(phase);
        float radius = map(x, -1, 1, 40, 300);
        float lineWidth = map(x, -1, 1, 0, 5);
        float r = map(x, -1, 1, 0, 255);
        float g = map(x, -1, 1, 255, 0);
        float b = map(x, -1, 1, 255, 125);
        
        // use the lerp function to interpolate between white and colored depending on agitation
        r = lerp(255, r, agitation);
        g = lerp(255, g, agitation);
        b = lerp(255, b, agitation);
        stroke(r, g, b);
        
        float lineWidthAddition = random(map(agitation, 0, 1, 0, 25));
        strokeWeight(lineWidth + lineWidthAddition);    
        
        ellipse(width / 2, height / 2, radius, radius);
        phase = phase + phaseAddition;
        phaseAddition += 0.1;
    }
}
