import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';

import { TodoAppComponent } from './todo-app.component';
import { TodoService } from "../todo.service";

describe('TodoAppComponent', () => {
  let component: TodoAppComponent;
  let fixture: ComponentFixture<TodoAppComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      imports: [ BrowserModule, FormsModule ],
      providers: [ TodoService ],
      declarations: [ TodoAppComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TodoAppComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });
});
