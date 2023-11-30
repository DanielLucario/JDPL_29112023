import { Component } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { Student } from 'src/app/interfaces/student';
import { StudentService } from 'src/app/services/student/student.service';

@Component({
  selector: 'app-add-student',
  templateUrl: './add-student.component.html',
  styleUrls: ['./add-student.component.scss']
})
export class AddStudentComponent {
  constructor(private studentService: StudentService, private formBuilder: FormBuilder, public dialogRef: MatDialogRef<AddStudentComponent>) { }

  form = this.formBuilder.group({
    nombre: ['', Validators.required],
    apellidoPaterno: ['', Validators.required],
    apellidoMaterno: [''],
  });

  public save() {
    if (this.form.valid) {
      const values = this.form.value
      const student: Student = {
        nombre: values.nombre?.trim(),
        apellidoMaterno: values.apellidoMaterno?.trim(),
        apellidoPaterno: values.apellidoPaterno?.trim()
      }
      this.studentService.insert(student).then(result => {
        if (result) {
          this.dialogRef.close(true)
        }
      })
    }
  }
}
