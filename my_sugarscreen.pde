class Ball {
  PVector _pos;
  PVector _size;
  PVector _max_speed;
  PVector _offset;
  float _r;
  float _g;
  float _b;
  
  Ball(PVector size) {
    this._size = size;
    this._pos = get_random_vector(0, width, 0, height);
    this._max_speed = new PVector(15, 15);
    this._offset = get_random_vector(0, this._max_speed.x, 0, this._max_speed.y);
    this._r = random(0, 255);
    this._g = random(0, 255);
    this._b = random(0, 255);
  }
  
  void update()
  {
    if (this._pos.x < 0) {
      if (this._offset.x < 0) {
        this._offset.x = -this._offset.x;
      }
    } else if (this._pos.x > width) {
      if (this._offset.x > 0) {
        this._offset.x = -this._offset.x;
      }
    }
    
    if (this._pos.y < 0) {
      if (this._offset.y < 0) {
        this._offset.y = -this._offset.y;
      }
    } else if (this._pos.y > height) {
      if (this._offset.y > 0) {
        this._offset.y = -this._offset.y;
      }
    }
  
    this._pos.x += this._offset.x;
    this._pos.y += this._offset.y;
  }
  
  void display() {
    fill(this._r, this._g, this._b);
    ellipse(this._pos.x, this._pos.y, this._size.x, this._size.y);
  }
}

PImage img;
Ball balls[];

void set_bg()
{
  background(img);
}

void draw()
{
  set_bg();
  for (int i = 0; i < balls.length; i ++) {
    balls[i].display();
    balls[i].update();
  }
}

PVector get_random_vector(float x_min, float x_max, float y_min, float y_max)
{
  float x = random(x_min, x_max);
  float y = random(y_min, y_max);
  
  return new PVector(x, y);
}

void setup()
{
  img = loadImage("takumi.jpeg");
  balls = new Ball[(int)random(300, 600)];
  //balls = new Ball[1800];
  for (int i = 0; i < balls.length; i ++) {
    int size = (int)random(10, 42);
    balls[i] = new Ball(new PVector(size, size));
  }

  size(736, 736);
  set_bg();
}
