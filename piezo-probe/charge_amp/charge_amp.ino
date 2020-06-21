void setup() {
  Serial.begin(115200);
  pinMode(13,OUTPUT);

}

float average = 0;
float integral = 0;

void loop() {
  
  float reading = analogRead(A0);
  average = reading * 0.001 + average * 0.999;
  integral *= 0.9;
  integral += reading - average;
  digitalWrite(13, integral > 100);
  delay(1);
}
