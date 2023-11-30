import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RegisterSubjectsComponent } from './register-subjects.component';

describe('RegisterSubjectsComponent', () => {
  let component: RegisterSubjectsComponent;
  let fixture: ComponentFixture<RegisterSubjectsComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [RegisterSubjectsComponent]
    });
    fixture = TestBed.createComponent(RegisterSubjectsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
