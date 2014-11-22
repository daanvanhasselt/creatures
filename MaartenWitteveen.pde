class MaartenWitteveen extends Creature {

    MaartenWitteveen(float x, float y) {
        super(x, y);
    }
     
    void setup() {
    }
     
    void draw(float x, float y) {
        stroke(255);
        noFill();
        
        float phase = frameCount * 0.025;
        float phaseAddition = map(sin(phase), -1, 1, 0, 0.75);
        for(int i = 0; i < 10; i++){
            float t = sin(phase);
            float radius = map(t, -1, 1, 40, 300);
            float lineWidth = map(t, -1, 1, 0, 5);
            float r = map(t, -1, 1, 0, 255);
            float g = map(t, -1, 1, 255, 0);
            float b = map(t, -1, 1, 255, 125);
            
            // use the lerp function to interpolate between white and colored depending on agitation
            r = lerp(255, r, agitation);
            g = lerp(255, g, agitation);
            b = lerp(255, b, agitation);
            stroke(r, g, b);
            
            float lineWidthAddition = random(map(agitation, 0, 1, 0, 25));
            strokeWeight(lineWidth + lineWidthAddition);    
            
            ellipse(x, y, radius, radius);
            phase = phase + phaseAddition;
            phaseAddition += 0.1;
        }
    }
}
